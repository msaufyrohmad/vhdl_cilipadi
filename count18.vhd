library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 USE ieee.numeric_std.ALL; 

  
entity count18 is
    Port ( clk: in std_logic; -- clock input
            c18_reset: in std_logic; -- reset input 
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
           counter18 :out std_logic 
     );
end count18;

architecture Behavioral of count18 is
signal counter_up: std_logic_vector(4 downto 0);
 Type AC_CONSTS_F1 is array 
 (integer range 1 to 18) of std_logic_vector (0 to 3);
 constant C1F1 : AC_CONSTS_F1 := (x"0",   x"0",  x"0",  x"0",  x"0",   x"0", x"0",  x"0",  x"0",  x"0", x"0",  x"0",  x"0",  x"0",  x"0",  x"0",  x"0",  x"0");
 constant C2F1 : AC_CONSTS_F1 := (x"1",   x"1",   x"1", x"1",  x"1",   x"1", x"1",  x"1",  x"1",  x"1", x"1",  x"1",  x"1",  x"1",  x"1",  x"1",  x"1",  x"1" );
 constant C3F1 : AC_CONSTS_F1 := (x"2",   x"2",   x"2", x"2",  x"2",   x"2", x"2",  x"2",  x"2",  x"2", x"2",  x"2",  x"2",  x"2",  x"2", x"2",   x"2",  x"2" );
 constant C4F1 : AC_CONSTS_F1 := (x"3",   x"3",   x"3", x"3", x"3",   x"3",  x"3",  x"3",  x"3",  x"3", x"3",  x"3",  x"3",  x"3",  x"3",  x"3",  x"3",  x"3" );
 constant C5F1 : AC_CONSTS_F1 := (x"0",   x"0",   x"0", x"1", x"3",   x"7",  x"7",  x"7",  x"6",  x"5", x"3",  x"7",  x"7",  x"6",  x"4",  x"1",  x"3",  x"7" );
 constant C6F1 : AC_CONSTS_F1 := (x"1",   x"3",   x"7", x"7", x"7",   x"6",  x"5",  x"3",  x"7",  x"7", x"6",  x"4",  x"1",  x"3",  x"7",  x"6",  x"5",  x"2" );
 constant C7F1 : AC_CONSTS_F1 := (x"0",   x"0",   x"0", x"1", x"3",   x"7",  x"7",  x"7",  x"6", x"5",  x"3",  x"7",  x"7",  x"6",  x"4", x"1",   x"3",  x"7" );
 constant C8F1 : AC_CONSTS_F1 := (x"1",   x"3",   x"7", x"7", x"7",   x"6",  x"5",  x"3",  x"7",  x"7", x"6",  x"4",  x"1",  x"3",  x"7",  x"6",  x"5",  x"2" );

Type AC_CONSTS_F2 is array 
 (integer range 1 to 18) of std_logic_vector (0 to 3);
 constant C1F2 : AC_CONSTS_F2 := (  x"0",   x"0",  x"0",  x"0",   x"0",   x"0", x"0",  x"0",   x"0",  x"0",  x"0",   x"0",   x"0",  x"0",  x"0", x"0",   x"0",   x"0");
 constant C2F2 : AC_CONSTS_F2 := (  x"2",   x"2",  x"2",  x"2",   x"2",   x"2", x"2",  x"2",   x"2",  x"2",  x"2",   x"2",   x"2",  x"2",  x"2", x"2",   x"2",   x"2");
 constant C3F2 : AC_CONSTS_F2 := (  x"2",   x"2",  x"2",  x"2",   x"2",   x"2", x"2",  x"2",   x"2",  x"2",  x"2",   x"2",   x"2",  x"2",  x"2", x"2",   x"2",   x"2");
 constant C4F2 : AC_CONSTS_F2 := (  x"3",   x"3",  x"3",  x"3",   x"3",   x"3", x"3",  x"3",   x"3",  x"3",  x"3",   x"3",   x"3",  x"3",  x"3", x"3",   x"3",   x"3");
 constant C5F2 : AC_CONSTS_F2 := (  x"0",   x"0",  x"0",  x"1",   x"3",   x"7", x"7",  x"7",   x"6",  x"5",  x"3",   x"7",   x"7",  x"6",  x"4", x"1",   x"3",   x"7");
 constant C6F2 : AC_CONSTS_F2 := (  x"1",   x"3",  x"7",  x"7",   x"7",   x"6", x"5",  x"3",   x"7",  x"7",  x"6",   x"4",   x"1",  x"3",  x"7", x"6",   x"5",   x"2");
 constant C7F2 : AC_CONSTS_F2 := (  x"0",   x"0",  x"0",  x"1",   x"3",   x"7", x"7",  x"7",   x"6",  x"5",  x"3",   x"7",   x"7",  x"6",  x"4", x"1",   x"3",   x"7");
 constant C8F2 : AC_CONSTS_F2 := (  x"1",   x"3",  x"7",  x"7",   x"7",  x"6", x"5",  x"3",   x"7",  x"7",  x"6",   x"4",   x"1",  x"3",  x"7", x"6",   x"5",   x"2");


begin

process(clk)
begin
if(rising_edge(clk)) then
    if(c18_reset='1') then
         counter_up <= "00000";
    else
        counter_up <= counter_up + x"1";
         cf1_1 <= c1f1(to_integer(signed(counter_up)));
        cf1_2 <= c1f1(to_integer(signed(counter_up)));
        cf1_3 <= c1f1(to_integer(signed(counter_up)));
        cf1_4 <= c1f1(to_integer(signed(counter_up)));
        cf1_5 <= c1f1(to_integer(signed(counter_up)));
        cf1_6 <= c1f1(to_integer(signed(counter_up)));
        cf1_7 <= c1f1(to_integer(signed(counter_up)));
        cf1_8 <= c1f1(to_integer(signed(counter_up)));
        cf2_1 <= c1f1(to_integer(signed(counter_up)));
        cf2_2 <= c1f1(to_integer(signed(counter_up)));
        cf2_3 <= c1f1(to_integer(signed(counter_up)));
        cf2_4 <= c1f1(to_integer(signed(counter_up)));
        cf2_5 <= c1f1(to_integer(signed(counter_up)));
        cf2_6 <= c1f1(to_integer(signed(counter_up)));
        cf2_7 <= c1f1(to_integer(signed(counter_up)));
        cf2_7 <= c1f1(to_integer(signed(counter_up)));
    end if;
 end if;
end process;

process(clk,counter_up)
begin
    if counter_up = "10010" then
       counter18 <= '1';
    end if;
end process;

end Behavioral;