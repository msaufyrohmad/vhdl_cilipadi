library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity cilipadi_datapath is
    Port ( 
           clock : in  STD_LOGIC;
           reset : in std_logic;
           
           -- main datapath input ---
           nonce : in  STD_LOGIC_VECTOR (0 to 127);
           keys : in STD_LOGIC_VECTOR (0 to 127);
           plaintext : in std_logic_vector(0 to 63);
	       tag : out  STD_LOGIC_VECTOR (0 to 63);
	       ciphertext : out  STD_LOGIC_VECTOR (0 to 63);
	       ad : in std_logic_vector(0 to 63);
	       
	       -- control signal 
           regload : in  STD_LOGIC;
	       mux_k1_sel : in std_logic_vector(0 to 1);
	       mux_k2_sel : in std_logic_vector(0 to 1);
	       mux_n1_sel : in std_logic_vector(0 to 1);
	       mux_n2_sel : in std_logic_vector(0 to 1);
	       final_demux : in std_logic;
	       
	        cf1_1 : in std_logic_vector(0 to 3);
	       cf1_2 : in std_logic_vector(0 to 3);
	       cf1_3 : in std_logic_vector(0 to 3);
	       cf1_4 : in std_logic_vector(0 to 3);
	       cf1_5 : in std_logic_vector(0 to 3);
	       cf1_6 : in std_logic_vector(0 to 3);
	       cf1_7 : in std_logic_vector(0 to 3);
	       cf1_8 : in std_logic_vector(0 to 3);
	       cf2_1 : in std_logic_vector(0 to 3);
	       cf2_2 : in std_logic_vector(0 to 3);
	       cf2_3 : in std_logic_vector(0 to 3);
	       cf2_4 : in std_logic_vector(0 to 3);
	       cf2_5 : in std_logic_vector(0 to 3);
	       cf2_6 : in std_logic_vector(0 to 3);
	       cf2_7 : in std_logic_vector(0 to 3);
	       cf2_8 : in std_logic_vector(0 to 3)
	       );
end cilipadi_datapath;

architecture Behavioral of cilipadi_datapath is


component led
    PORT(
         led_in : IN  std_logic_vector(0 to 63);
         led_out : OUT  std_logic_vector(0 to 63);
         clock : IN  std_logic;
         const1 ,const2,const3,const4 : IN  std_logic_vector(0 to 3);
	     const5 ,const6,const7,const8 : IN  std_logic_vector(0 to 3)
	 );
end component;
	 
component mux64
    PORT(
         ain : IN  std_logic_vector(0 to 63);
         bin : IN  std_logic_vector(0 to 63);
         cin : IN  std_logic_vector(0 to 63);
         din : IN  std_logic_vector(0 to 63);
         muxout : OUT  std_logic_vector(0 to 63);
         selmux : IN  std_logic_vector(0 to 1)
        );
end component;

component reg64
    PORT(
         i : IN  std_logic_vector(0 to 63);
         clock : IN  std_logic;
         load : IN  std_logic;
         rst : IN  std_logic;
         q : OUT  std_logic_vector(0 to 63)
        );
 end component;
 
component demux64 is
 port(
     demux_in : in std_logic_vector(0 to 63);
     demux_sel: in std_logic;
     demux_out1 : out std_logic_vector(0 to 63);
     demux_out2 : out std_logic_vector(0 to 63)
 );
end component;
 

-- signals for mux and register out
signal muxk1out : std_logic_vector(0 to 63);
signal regk1out : std_logic_vector(0 to 63);

signal muxk2out : std_logic_vector(0 to 63);
signal regk2out : std_logic_vector(0 to 63);


signal muxn1out : std_logic_vector(0 to 63);
signal regn1out : std_logic_vector(0 to 63);

signal muxn2out : std_logic_vector(0 to 63);
signal regn2out : std_logic_vector(0 to 63);

-- signal for leds
signal led1out : std_logic_vector(0 to 63);
signal led2out : std_logic_vector(0 to 63);

-- shuffle signal 
signal f1out : std_logic_vector(0 to 63);
signal f2out : std_logic_vector(0 to 63);


signal f1out_xor : std_logic_vector(0 to 63);
signal mux21_out : std_logic_vector(0 to 63);

-- last xor value for final add
signal ad_last_xor : std_logic_vector(0 to 63):=x"0000000000000001";

-- demux signal for final tag generation
signal demux_out1_return : std_logic_vector(0 to 63);
signal demux_out2_final : std_logic_vector(0 to 63);

-- signal for ad xor and msg xor
signal ad_xor : std_logic_vector(0 to 63);
signal msg_xor : std_logic_vector(0 to 63);

-- real const values ----
--Type ICD_ARRAY is array 
-- (integer range 1 to 36) of std_logic_vector (0 to 3);
-- constant ICD1 : ICD_ARRAY := (x"0",  x"0", x"0",  x"0", x"0", x"0", x"0", x"0", x"0",  x"0", x"0",  x"0", x"0", x"0", x"0", x"0", x"0",  x"0", x"0", x"0", x"0", x"0", x"0",  x"0", x"0",  x"0", x"0", x"0", x"0", x"0", x"0", x"0",  x"0",  x"0",  x"0", x"0");
-- constant ICD2 : ICD_ARRAY := (x"1",  x"2", x"1",  x"2", x"1", x"2", x"1", x"2", x"1",  x"2", x"1",  x"2", x"1", x"2", x"1", x"2", x"1",  x"2", x"1", x"2", x"1", x"2", x"1",  x"2", x"1",  x"2", x"1", x"2", x"1", x"2", x"1", x"2",  x"1",  x"2",  x"1", x"2");
-- constant ICD3 : ICD_ARRAY := (x"2",  x"2", x"2",  x"2", x"2", x"2", x"2", x"2", x"2",  x"2", x"2",  x"2", x"2", x"2", x"2", x"2", x"2",  x"2", x"2", x"2", x"2", x"2", x"2",  x"2", x"2",  x"2", x"2", x"2", x"2", x"2", x"2", x"2",  x"2",  x"2",  x"2", x"2");
-- constant ICD4 : ICD_ARRAY := (x"3",  x"3", x"3",  x"3", x"3", x"3", x"3", x"3", x"3",  x"3", x"3",  x"3", x"3", x"3", x"3", x"3", x"3",  x"3", x"3", x"3", x"3", x"3", x"3",  x"3", x"3",  x"3", x"3", x"3", x"3", x"3", x"3", x"3",  x"3",  x"3",  x"3", x"3");
-- constant ICD5 : ICD_ARRAY := (x"0",  x"0", x"0",  x"0", x"0", x"0", x"1", x"1", x"3",  x"3", x"7",  x"7", x"7", x"7", x"7", x"7", x"6",  x"6", x"5", x"5", x"3", x"3", x"7",  x"7", x"7",  x"7", x"6", x"6", x"4", x"4", x"1", x"1",  x"3",  x"3",  x"7", x"7");
-- constant ICD6 : ICD_ARRAY := (x"1",  x"1", x"3",  x"3", x"7", x"7", x"7", x"7", x"7",  x"7", x"6",  x"6", x"5", x"5", x"3", x"3", x"7",  x"7", x"7", x"7", x"6", x"6", x"4",  x"4", x"1",  x"1", x"3", x"3", x"7", x"7", x"6", x"6",  x"5",  x"5",  x"2", x"2");
-- constant ICD7 : ICD_ARRAY := (x"0",  x"0", x"0",  x"0", x"0", x"0", x"1", x"1", x"3",  x"3", x"7",  x"7", x"7", x"7", x"7", x"7", x"6",  x"6", x"5", x"5", x"3", x"3", x"7",  x"7", x"7",  x"7", x"6", x"6", x"4", x"4", x"1", x"1",  x"3",  x"3",  x"7", x"7");
-- constant ICD8 : ICD_ARRAY := (x"1",  x"1", x"3",  x"3", x"7", x"7", x"7", x"7", x"7",  x"7", x"6",  x"6", x"5", x"5", x"3", x"3", x"7",  x"7", x"7", x"7", x"6", x"6", x"4",  x"4", x"1",  x"1", x"3", x"3", x"7", x"7", x"6", x"6",  x"5",  x"5",  x"2", x"2");
 
 
begin

--------k1 mux and register ------------
mux_k1: mux64 port map (
          ain => keys(0 to 63),
          bin => f1out,
          cin => f1out_xor,
          din => f1out,
          muxout => muxk1out,
          selmux => mux_k1_sel
        );

reg_k1: reg64 PORT MAP (
          I => muxk1out,
          clock => clock,
	       load => regload,
	      rst => reset ,
          Q => regk1out
        );		  
        
        
---- k2 mux and register -------------        
mux_k2: mux64 port map (
          ain => keys(64 to 127),
          bin => regn1out,
          cin => regn1out,
          din => regn1out,
          muxout => muxk2out,
          selmux => mux_k2_sel
        );
	
reg_k2: reg64 PORT MAP (
          I => muxk2out,
          clock => clock,
	       load => regload,
	       rst => reset ,
           Q => regk2out
        );
        
--- n1 mux and register--------------
mux_n1: MUX64 port map (
          ain => nonce(0 to 63),
          bin => f2out,
          cin => f2out,
          din => f2out,
          muxout => muxn1out,
          selmux => mux_n1_sel
        );
		  
reg_n1: reg64 PORT MAP (
          I => muxn1out   ,
          clock => clock,
	   load => regload,
	    rst => reset ,
           Q => regn1out
        );	  
		  

--- n2 mux and register ----  
mux_n2: mux64 port map (
          ain => nonce(64 to 127),
          bin => demux_out1_return,
          cin => ad_xor,
          din => msg_xor,
          muxout => muxn2out,
          selmux => mux_n2_sel
        );	


reg_n2: reg64 port map (
          I => muxn2out   ,
          clock => clock,
	       load => regload,
	        rst => reset ,
           Q => regn2out
        );	


        
led1: led port map (
          led_in => regk1out,
          led_out => led1out,
          clock => clock,
          CONST1 => cf1_1,
          CONST2 => cf1_2,
          CONST3 => cf1_3,
          CONST4 => cf1_4,
          CONST5 => cf1_5,
          CONST6 => cf1_6,
          CONST7 => cf1_7,
          CONST8 => cf1_8
        );

led2: led port map (
          led_in => regn1out,
          led_out => led2out,
          clock => clock,
          CONST1 => cf2_1,
          CONST2 => cf2_2,
          CONST3 => cf2_3,
          CONST4 => cf2_4,
          CONST5 => cf2_5,
          CONST6 => cf2_6,
          CONST7 => cf2_7,
          CONST8 => cf2_8
        );


demux1 : demux64 port map(
        demux_in => regk1out,
        demux_sel => final_demux,
        demux_out1 => demux_out1_return,
        demux_out2 => tag
   --     demux_out2 => demux_out2_final
        );
------------------------------------

f1out <= regk2out xor led1out;
f2out <= regn2out xor led2out;
f1out_xor <= f1out xor ad_last_xor;
ad_xor <=demux_out1_return xor ad;
msg_xor <=demux_out1_return xor plaintext;
ciphertext <= msg_xor;

end Behavioral;



							 
                                