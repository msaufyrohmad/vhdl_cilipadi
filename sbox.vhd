library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sbox is
Port    ( sbox_in : in  STD_LOGIC_VECTOR (0 to 3);
           sbox_out : out  STD_LOGIC_VECTOR ( 0 to 3));

end sbox;

architecture Behavioral of sbox is


begin

WITH sbox_in  SELECT
     sbox_out <= 
	  
	x"c" when x"0",
	x"5" when x"1",
   x"6" when x"2",
   x"b" when x"3",
	x"9" when x"4",
	x"0" when x"5",
	x"a" when x"6",
   x"D" when x"7",
	x"3" when x"8",
	x"E" when x"9",
	x"F" when x"A",
	x"8" when x"B",
	x"4" when x"C",
	x"7" when x"D",
	x"1" when x"E",
	x"2" when x"F",
   X"0" when others; 



end Behavioral;


