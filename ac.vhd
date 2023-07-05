library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ac is
    Port ( adin : in  STD_LOGIC_VECTOR (0 to 63);
	  rc1, rc2, rc3, rc4 :  in  STD_LOGIC_VECTOR (0 to 3);
	  rc5, rc6, rc7, rc8 :  in  STD_LOGIC_VECTOR (0 to 3);
           adout : out  STD_LOGIC_VECTOR (0 to 63));
end ac;

architecture Behavioral of ac is
  SIGNAL adinS :  STD_LOGIC_VECTOR (0 to 63);
  
begin
--- FIRST COLUMNS----------
adinS ( 0 TO 3 )   <= adin( 0 to 3)   XOR rc1;
adinS ( 16 TO 19 ) <= adin( 16 to 19)  XOR rc2;
adinS ( 32 TO 35 ) <= adin ( 32 to 35) XOR rc3;
adinS ( 48 TO 51 ) <= adin ( 48 to 51) XOR rc4;

-----2ND COLUMNS----------

adinS ( 4 TO 7 )   <= adin ( 4 to 7)   XOR rc5;
adinS ( 20 TO 23 ) <= adin ( 20 to 23) XOR rc6;
adinS ( 36 TO 39 ) <= adin ( 36 to 39) XOR rc7;
adinS ( 52 TO 55 ) <= adin ( 52 to 55) XOR rc8;

adout ( 0 TO 7 )   <= adinS  ( 0  TO 7);
adout ( 16 TO 23 ) <= adinS  ( 16 TO 23);
adout ( 32 TO 39 ) <= adinS  ( 32 TO 39);
adout ( 48 TO 55)  <= adinS  ( 48 TO 55);

adout ( 8 TO 15 ) <= adin  ( 8 TO 15);
adout ( 24 TO 31 ) <= adin ( 24 TO 31);
adout ( 40 TO 47 ) <= adin ( 40 TO 47);
adout ( 56 TO 63 ) <= adin ( 56 TO 63);

end Behavioral;
