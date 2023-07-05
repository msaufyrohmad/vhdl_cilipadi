library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr is
    Port ( sr_in : in  STD_LOGIC_VECTOR (0 to 63);
           sr_out : out  STD_LOGIC_VECTOR (0 to 63));
end sr;

architecture Behavioral of sr is
  SIGNAL sr_op : STD_LOGIC_VECTOR (0 to 63);
begin
  
  -----------1ST ROW-----------------------
  sr_op ( 0 TO 15 ) <= sr_in ( 0 TO 15);
  ----------2ND ROW------------------------------------
    sr_op ( 16 TO 27) <= sr_in ( 20 TO 31);
    sr_op ( 28 TO 31 ) <= sr_in ( 16 TO 19);
	 ---------------3RD ROW------------------------
	 sr_op ( 32 TO 39) <= sr_in  ( 40 TO 47);
    sr_op ( 40 TO 47 ) <= sr_in  ( 32 TO 39);
	  ---------------4TH ROW------------------------
	 sr_op ( 48 TO 51) <= sr_in  ( 60 TO 63);
    sr_op ( 52 TO 63 ) <= sr_in  ( 48 TO 59);
	 
	 sr_out <= sr_op ;
	 
end Behavioral;

