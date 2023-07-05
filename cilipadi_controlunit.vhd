library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity cilipadi_controlunit is
    Port (
           clock : in std_logic;
           reset : in std_logic;
           regload : out  STD_LOGIC;
           mode : in std_logic;
           begin16 : out std_logic;
           begin18 : out std_logic;
           end16 : in std_logic;
           end18 : in std_logic;
           ad_next : in std_logic;
           msg_next : in std_logic;
	       mux_k1_sel : out std_logic_vector(0 to 1);
	       mux_k2_sel : out std_logic_vector(0 to 1);
	       mux_n1_sel : out std_logic_vector(0 to 1);
	       mux_n2_sel : out std_logic_vector(0 to 1);
	       final_demux : out std_logic;
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
end cilipadi_controlunit;

architecture Behavioral of cilipadi_controlunit is


    type state is (init_start,init,ad_start,ad,msg_start,msg,final_start,final,tag);
	signal present_state, next_state : state;
    signal round18:integer range 0 to 17;
    signal round16:integer range 0 to 15;
    signal c16_reset : std_logic;
    signal c18_reset : std_logic;
    signal counter18 : std_logic;
    signal counter16 : std_logic;
 
begin
 
    
    
seq: process(clock,reset) is
begin
    if reset='1' then
        present_state <= init_start;
    elsif rising_edge(clock) then
        present_state <= next_state;
    end if;
end process seq;


fsm:process(present_state)is
begin
           regload <='0';
           mux_k1_sel <="00";
	       mux_k2_sel <="00";
	       mux_n1_sel <="00";
	       mux_n2_sel <= "00";
	       final_demux <='0';
	       case present_state is
	           when init_start =>
	               regload <='1';
	               mux_k1_sel <="00";
	               mux_k2_sel <="00";
	               mux_n1_sel <="00";
	               mux_n2_sel <= "00";
	               next_state <= init;
	           when init =>
	               regload <= '1';
	               mux_k1_sel <="01";
	               mux_k2_sel <="01";
	               mux_n1_sel <="01";
	               mux_n2_sel <= "01";
	               cf1_1 <= cf1_1_in;
	               cf1_2 <= cf1_2_in;
	               cf1_3 <= cf1_3_in;
	               cf1_4 <= cf1_4_in;
	               cf1_5 <= cf1_5_in;
	               cf1_6 <= cf1_6_in;
	               cf1_7 <= cf1_7_in;
	               cf1_8 <= cf1_8_in;
	               cf2_1 <= cf2_1_in;
	               cf2_2 <= cf2_2_in;
	               cf2_3 <= cf2_3_in;
	               cf2_4 <= cf2_4_in;
	               cf2_5 <= cf2_5_in;
	               cf2_6 <= cf2_6_in;
	               cf2_7 <= cf2_7_in;
	               cf2_8 <= cf2_8_in;
	               begin16 <= '1';
	               if end16 = '1' then
	                   next_state <= ad_start;
	               else
	                   next_state <= init;
	               end if;
	           when ad_start =>
	               regload <='1';
	               mux_k1_sel <="01";
	               mux_k2_sel <="01";
	               mux_n1_sel <="01";
	               mux_n2_sel <= "01";
	               next_state <= ad;
	           when ad =>
	               regload <='1';
	               mux_k1_sel <="01";
	               mux_k2_sel <="01";
	               mux_n1_sel <="01";
	               mux_n2_sel <= "01";
	               cf1_1 <= cf1_1_in;
	               cf1_2 <= cf1_2_in;
	               cf1_3 <= cf1_3_in;
	               cf1_4 <= cf1_4_in;
	               cf1_5 <= cf1_5_in;
	               cf1_6 <= cf1_6_in;
	               cf1_7 <= cf1_7_in;
	               cf1_8 <= cf1_8_in;
	               cf2_1 <= cf2_1_in;
	               cf2_2 <= cf2_2_in;
	               cf2_3 <= cf2_3_in;
	               cf2_4 <= cf2_4_in;
	               cf2_5 <= cf2_5_in;
	               cf2_6 <= cf2_6_in;
	               cf2_7 <= cf2_7_in;
	               cf2_8 <= cf2_8_in;
	               begin18 <= '1';
	               if end16 = '1' then
	                   next_state <= ad;
	               else
	                   next_state <= init;
	               end if;
	           when msg_start =>
	               regload <='1';
	               mux_k1_sel <="10";
	               mux_k2_sel <="10";
	               mux_n1_sel <="10";
	               mux_n2_sel <= "10";
	               next_state <= msg;
	           when msg =>
	               regload <='1';
	               mux_k1_sel <="01";
	               mux_k2_sel <="01";
	               mux_n1_sel <="01";
	               mux_n2_sel <= "01";
	              cf1_1 <= cf1_1_in;
	               cf1_2 <= cf1_2_in;
	               cf1_3 <= cf1_3_in;
	               cf1_4 <= cf1_4_in;
	               cf1_5 <= cf1_5_in;
	               cf1_6 <= cf1_6_in;
	               cf1_7 <= cf1_7_in;
	               cf1_8 <= cf1_8_in;
	               cf2_1 <= cf2_1_in;
	               cf2_2 <= cf2_2_in;
	               cf2_3 <= cf2_3_in;
	               cf2_4 <= cf2_4_in;
	               cf2_5 <= cf2_5_in;
	               cf2_6 <= cf2_6_in;
	               cf2_7 <= cf2_7_in;
	               cf2_8 <= cf2_8_in;
	               begin18<='1';
	               if end18 = '1' then
	                   next_state <= final_start;
	               else
	                   next_state <= msg;
	               end if;
	           when final_start =>
	               regload <='1';
	               mux_k1_sel <="10";
	               mux_k2_sel <="10";
	               mux_n1_sel <="10";
	               mux_n2_sel <= "10";
	               next_state <= final;
	           when final=>
	               regload <='1';
	               mux_k1_sel <="11";
	               mux_k2_sel <="11";
	               mux_n1_sel <="11";
	               mux_n2_sel <= "11";
	               cf1_1 <= cf1_1_in;
	               cf1_2 <= cf1_2_in;
	               cf1_3 <= cf1_3_in;
	               cf1_4 <= cf1_4_in;
	               cf1_5 <= cf1_5_in;
	               cf1_6 <= cf1_6_in;
	               cf1_7 <= cf1_7_in;
	               cf1_8 <= cf1_8_in;
	               cf2_1 <= cf2_1_in;
	               cf2_2 <= cf2_2_in;
	               cf2_3 <= cf2_3_in;
	               cf2_4 <= cf2_4_in;
	               cf2_5 <= cf2_5_in;
	               cf2_6 <= cf2_6_in;
	               cf2_7 <= cf2_7_in;
	               cf2_8 <= cf2_8_in;
	               begin18 <= '1';
	               if end18 = '1' then
	                   next_state <= tag;
	               else
	                   next_state <= final;
	               end if;
	           when tag=>
               end case;
               end process;
end architecture Behavioral;
