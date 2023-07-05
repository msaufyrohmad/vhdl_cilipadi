library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity cilipadi is
    Port ( 
            clock : in std_logic;
            reset : in std_logic; 
            nonce : in  STD_LOGIC_VECTOR (0 to 127);
           keys : in STD_LOGIC_VECTOR (0 to 127);
           mode : in  STD_LOGIC;
           ad_next : in std_logic;
           msg_next : in std_logic;
	       tag : out  STD_LOGIC_VECTOR (0 to 63);
	       ciphertext : out  STD_LOGIC_VECTOR (0 to 63);
	       plaintext : in std_logic_vector(0 to 63);
	       ad : in std_logic_vector(0 to 63)
	             
	       );
end cilipadi ;

architecture Behavioral of cilipadi is

component cilipadi_datapath is
    port ( 
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
	       
end component;

component cilipadi_controlunit is
port (
            -- signal from outside
           clock : in std_logic;
           reset : in std_logic;
           mode : in std_logic;
           ad_next : in std_logic;
	       msg_next : in std_logic;
	       
	       -- control signal to datapath
           regload : out  STD_LOGIC;
           mux_k1_sel : out std_logic_vector(0 to 1);
	       mux_k2_sel : out std_logic_vector(0 to 1);
	       mux_n1_sel : out std_logic_vector(0 to 1);
	       mux_n2_sel : out std_logic_vector(0 to 1);
	       final_demux : out std_logic;
	       
	       -- signal to counter
	       begin16 : out std_logic;
           begin18 : out std_logic;
           end16 : in std_logic;
           end18 : in std_logic;
	     
	       -- constaant to datapath
	       cf1_1 : out std_logic_vector(0 to 3);
	       cf1_2 : out std_logic_vector(0 to 3);
	       cf1_3 : out std_logic_vector(0 to 3);
	       cf1_4 : out std_logic_vector(0 to 3);
	       cf1_5 : out std_logic_vector(0 to 3);
	       cf1_6 : out std_logic_vector(0 to 3);
	       cf1_7 : out std_logic_vector(0 to 3);
	       cf1_8 : out std_logic_vector(0 to 3);
	       cf2_1 : out std_logic_vector(0 to 3);
	       cf2_2 : out std_logic_vector(0 to 3);
	       cf2_3 : out std_logic_vector(0 to 3);
	       cf2_4 : out std_logic_vector(0 to 3);
	       cf2_5 : out std_logic_vector(0 to 3);
	       cf2_6 : out std_logic_vector(0 to 3);
	       cf2_7 : out std_logic_vector(0 to 3);
	       cf2_8 : out std_logic_vector(0 to 3);
	       
	       --constant from counter
	       cf1_1_in : in std_logic_vector(0 to 3);
           cf1_2_in : in std_logic_vector(0 to 3);
           cf1_3_in : in std_logic_vector(0 to 3);
           cf1_4_in : in std_logic_vector(0 to 3);
           cf1_5_in : in std_logic_vector(0 to 3);
           cf1_6_in : in std_logic_vector(0 to 3);
           cf1_7_in : in std_logic_vector(0 to 3);
           cf1_8_in : in std_logic_vector(0 to 3);
           cf2_1_in : in std_logic_vector(0 to 3);
           cf2_2_in : in std_logic_vector(0 to 3);
           cf2_3_in : in std_logic_vector(0 to 3);
           cf2_4_in : in std_logic_vector(0 to 3);
           cf2_5_in : in std_logic_vector(0 to 3);
           cf2_6_in : in std_logic_vector(0 to 3);
           cf2_7_in : in std_logic_vector(0 to 3);
           cf2_8_in : in std_logic_vector(0 to 3)
	       );
end component;

component count16 
    Port ( clk: in std_logic; -- clock input
           c16_reset: in std_logic; -- reset input 
           cf1_1 : out std_logic_vector(3 downto 0);
           cf1_2 : out std_logic_vector(3 downto 0);
           cf1_3 : out std_logic_vector(3 downto 0);
           cf1_4 : out std_logic_vector(3 downto 0);
           cf1_5 : out std_logic_vector(3 downto 0);
           cf1_6 : out std_logic_vector(3 downto 0);
           cf1_7 : out std_logic_vector(3 downto 0);
           cf1_8 : out std_logic_vector(3 downto 0);
           cf2_1 : out std_logic_vector(3 downto 0);
           cf2_2 : out std_logic_vector(3 downto 0);
           cf2_3 : out std_logic_vector(3 downto 0);
           cf2_4 : out std_logic_vector(3 downto 0);
           cf2_5 : out std_logic_vector(3 downto 0);
           cf2_6 : out std_logic_vector(3 downto 0);
           cf2_7 : out std_logic_vector(3 downto 0);
           cf2_8 : out std_logic_vector(3 downto 0);
           counter16 : out std_logic           
     );
end component;

component count18 
    Port ( clk: in std_logic; -- clock input
           c18_reset: in std_logic; -- reset input 
           cf1_1 : out std_logic_vector(3 downto 0);
           cf1_2 : out std_logic_vector(3 downto 0);
           cf1_3 : out std_logic_vector(3 downto 0);
           cf1_4 : out std_logic_vector(3 downto 0);
           cf1_5 : out std_logic_vector(3 downto 0);
           cf1_6 : out std_logic_vector(3 downto 0);
           cf1_7 : out std_logic_vector(3 downto 0);
           cf1_8 : out std_logic_vector(3 downto 0);
           cf2_1 : out std_logic_vector(3 downto 0);
           cf2_2 : out std_logic_vector(3 downto 0);
           cf2_3 : out std_logic_vector(3 downto 0);
           cf2_4 : out std_logic_vector(3 downto 0);
           cf2_5 : out std_logic_vector(3 downto 0);
           cf2_6 : out std_logic_vector(3 downto 0);
           cf2_7 : out std_logic_vector(3 downto 0);
           cf2_8 : out std_logic_vector(3 downto 0);
           counter18 : out std_logic
     );
end component;



-- CONNECTING SIGNAL DECLARATION--
--signal ciphertext : std_logic_vector(0 to 63);
signal regload_local : std_logic;
signal mux_k1_sel_local : std_logic_vector(0 to 1);
signal mux_k2_sel_local : std_logic_vector(0 to 1);
signal mux_n1_sel_local : std_logic_vector(0 to 1);
signal mux_n2_sel_local : std_logic_vector(0 to 1);	       
signal final_demux_local : std_logic;

-- local signal to datapath
signal cf1_1_local : std_logic_vector(0 to 3);
signal cf1_2_local : std_logic_vector(0 to 3);
signal cf1_3_local : std_logic_vector(0 to 3);
signal cf1_4_local : std_logic_vector(0 to 3);
signal cf1_5_local : std_logic_vector(0 to 3);
signal cf1_6_local : std_logic_vector(0 to 3);
signal cf1_7_local : std_logic_vector(0 to 3);
signal cf1_8_local : std_logic_vector(0 to 3);
signal cf2_1_local : std_logic_vector(0 to 3);
signal cf2_2_local : std_logic_vector(0 to 3);
signal cf2_3_local : std_logic_vector(0 to 3);
signal cf2_4_local : std_logic_vector(0 to 3);
signal cf2_5_local : std_logic_vector(0 to 3);
signal cf2_6_local : std_logic_vector(0 to 3);
signal cf2_7_local : std_logic_vector(0 to 3);
signal cf2_8_local : std_logic_vector(0 to 3);

--signal local to counter16 and counter18
signal cf1_1_local2 : std_logic_vector(0 to 3);
signal cf1_2_local2 : std_logic_vector(0 to 3);
signal cf1_3_local2 : std_logic_vector(0 to 3);
signal cf1_4_local2 : std_logic_vector(0 to 3);
signal cf1_5_local2 : std_logic_vector(0 to 3);
signal cf1_6_local2 : std_logic_vector(0 to 3);
signal cf1_7_local2 : std_logic_vector(0 to 3);
signal cf1_8_local2 : std_logic_vector(0 to 3);
signal cf2_1_local2 : std_logic_vector(0 to 3);
signal cf2_2_local2 : std_logic_vector(0 to 3);
signal cf2_3_local2 : std_logic_vector(0 to 3);
signal cf2_4_local2 : std_logic_vector(0 to 3);
signal cf2_5_local2 : std_logic_vector(0 to 3);
signal cf2_6_local2 : std_logic_vector(0 to 3);
signal cf2_7_local2 : std_logic_vector(0 to 3);
signal cf2_8_local2 : std_logic_vector(0 to 3);

signal begin16_local : std_logic;
signal begin18_local : std_logic;
signal end16_local : std_logic;
signal end18_local : std_logic;
begin

c16 : count16 port map(
    clk => clock,
    c16_reset => begin16_local,
    cf1_1 => cf1_1_local2,
    cf1_2 => cf1_2_local2,
    cf1_3 => cf1_3_local2,
    cf1_4 => cf1_4_local2,
    cf1_5 => cf1_5_local2,
    cf1_6 => cf1_6_local2,
    cf1_7 => cf1_7_local2,
    cf1_8 => cf1_8_local2,
    cf2_1 => cf2_1_local2,
    cf2_2 => cf2_2_local2,
    cf2_3 => cf2_3_local2,
    cf2_4 => cf2_4_local2,
    cf2_5 => cf2_5_local2,
    cf2_6 => cf2_6_local2,
    cf2_7 => cf2_7_local2,
    cf2_8 => cf2_7_local2,
    counter16 => end16_local
    );

c18 : count18 port map(
    clk => clock,
    c18_reset => begin18_local,
     cf1_1 => cf1_1_local2,
    cf1_2 => cf1_2_local2,
    cf1_3 => cf1_3_local2,
    cf1_4 => cf1_4_local2,
    cf1_5 => cf1_5_local2,
    cf1_6 => cf1_6_local2,
    cf1_7 => cf1_7_local2,
    cf1_8 => cf1_8_local2,
    cf2_1 => cf2_1_local2,
    cf2_2 => cf2_2_local2,
    cf2_3 => cf2_3_local2,
    cf2_4 => cf2_4_local2,
    cf2_5 => cf2_5_local2,
    cf2_6 => cf2_6_local2,
    cf2_7 => cf2_7_local2,
    cf2_8 => cf2_7_local2,
    counter18 => end18_local
    );
    

CP_DP: cilipadi_datapath PORT MAP (
            clock=>clock,
           reset=>reset,           
           nonce => nonce,
           keys => keys,
           plaintext => plaintext,
	       tag => tag,
	       ciphertext => ciphertext,
	       ad => ad,
	       regload => regload_local,
	       mux_k1_sel => mux_k1_sel_local,
	       mux_k2_sel => mux_k2_sel_local,
	       mux_n1_sel => mux_n1_sel_local,
	       mux_n2_sel => mux_n2_sel_local,
	       final_demux => final_demux_local,
	       cf1_1 =>    cf1_1_local,
	       cf1_2 =>    cf1_2_local,
	       cf1_3 =>    cf1_3_local,
	       cf1_4 =>    cf1_4_local,
	       cf1_5 =>    cf1_5_local,
	       cf1_6 =>    cf1_6_local,
	       cf1_7 =>    cf1_7_local,
	       cf1_8 =>    cf1_8_local,
	       cf2_1 =>    cf2_1_local,
	       cf2_2 =>    cf2_2_local,
	       cf2_3 =>    cf2_3_local,
	       cf2_4 =>    cf2_4_local,
	       cf2_5 =>    cf2_5_local,
	       cf2_6 =>    cf2_6_local,
	       cf2_7 =>    cf2_7_local,
	       cf2_8 =>    cf2_8_local
   );

          

CP_CU: cilipadi_controlunit PORT MAP (
            clock => clock,
           reset => reset,
          regload => regload_local,
	       mux_k1_sel => mux_k1_sel_local,
	       mux_k2_sel => mux_k2_sel_local,
	       mux_n1_sel => mux_n1_sel_local,
	       mux_n2_sel => mux_n2_sel_local,	       
	       final_demux => final_demux_local,
	       mode => mode,
	       ad_next =>ad_next,
	       msg_next =>msg_next,
	        begin16=> begin16_local,
           begin18=> begin18_local,
           end16 => end16_local,
           end18 => end18_local,
           cf1_1 =>    cf1_1_local,
	       cf1_2 =>    cf1_2_local,
	       cf1_3 =>    cf1_3_local,
	       cf1_4 =>    cf1_4_local,
	       cf1_5 =>    cf1_5_local,
	       cf1_6 =>    cf1_6_local,
	       cf1_7 =>    cf1_7_local,
	       cf1_8 =>    cf1_8_local,
	       cf2_1 =>    cf2_1_local,
	       cf2_2 =>    cf2_2_local,
	       cf2_3 =>    cf2_3_local,
	       cf2_4 =>    cf2_4_local,
	       cf2_5 =>    cf2_5_local,
	       cf2_6 =>    cf2_6_local,
	       cf2_7 =>    cf2_7_local,
	       cf2_8 =>    cf2_8_local,
	        cf1_1_in =>    cf1_1_local2,
	       cf1_2_in =>    cf1_2_local2,
	       cf1_3_in =>    cf1_3_local2,
	       cf1_4_in =>    cf1_4_local2,
	       cf1_5_in =>    cf1_5_local2,
	       cf1_6_in =>    cf1_6_local2,
	       cf1_7_in =>    cf1_7_local2,
	       cf1_8_in =>    cf1_8_local2,
	       cf2_1_in =>    cf2_1_local2,
	       cf2_2_in =>    cf2_2_local2,
	       cf2_3_in =>    cf2_3_local2,
	       cf2_4_in =>    cf2_4_local2,
	       cf2_5_in =>    cf2_5_local2,
	       cf2_6_in =>    cf2_6_local2,
	       cf2_7_in =>    cf2_7_local2,
	       cf2_8_in =>    cf2_8_local2
    );


end Behavioral;
