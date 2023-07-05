library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mult is
Port ( mult_inA : in  STD_LOGIC_VECTOR (0 to 3  );
       mult_inB : in  STD_LOGIC_VECTOR (0 to 3  );
       mult_out : out  STD_LOGIC_VECTOR (0 to 3  ));
end mult;

architecture Behavioral of mult is

begin
  P1 : Process ( mult_inA, mult_inB ) 
      begin
		IF ((mult_inA <=  X"0") OR  (mult_inB <=  X"0")) then  --- If A or B zero the output zero
				 mult_out <=  X"0";
		 elsIF  (mult_inA <=  X"1") then                          ----IF A = 1 the Out = B
				 mult_out <=  mult_inB ;
		   elsIF   (mult_inB <=  X"1") then                        --- IF B = 1 the Out = A
				 mult_out <=  mult_inA;
				  elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"2")) then
		      	 mult_out <=  X"4";
				   elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"3")) or   ((mult_inA <=  X"3") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"6";
					  elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"4")) or ((mult_inA <=  X"4") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"8";
					  elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"5")) or  ((mult_inA <=  X"5") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"A";
                 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"6"))  or ((mult_inA <=  X"6") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"C";
					 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"7")) or  ((mult_inA <=  X"7") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"E";
					  elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"8")) or  ((mult_inA <=  X"8") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"3";
					  elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"9")) or  ((mult_inA <=  X"9") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"1";
					 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"A")) or ((mult_inA <=  X"A") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"7";
					 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"B")) or((mult_inA <=  X"B") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"5";
					 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"C")) or ((mult_inA <=  X"C") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"B";
					 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"D"))  or ((mult_inA <=  X"D") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"9";
					 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"E"))  or ((mult_inA <=  X"E") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"F";
					 elsIF ((mult_inA <=  X"2") and (mult_inB <=  X"f")) or((mult_inA <=  X"F") and (mult_inB <=  X"2"))then
		      	 mult_out <=  X"D";
					 ---------------------------------------------
					  elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"3")) then
		      	 mult_out <=  X"5";
					  elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"4"))  or ((mult_inA <=  X"4") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"C";
					  elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"5"))  or ((mult_inA <=  X"5") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"F";
                 elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"6")) or ((mult_inA <=  X"6") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"A";
					 elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"7")) or ((mult_inA <=  X"7") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"9";
					  elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"8")) or ((mult_inA <=  X"8") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"B";
					  elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"9")) or ((mult_inA <=  X"9") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"8";
					 elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"A"))  or  ((mult_inA <=  X"A") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"D";
					 elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"B"))  or ((mult_inA <=  X"B") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"E";
					 elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"C") ) or ((mult_inA <=  X"C") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"7";
					 elsIF ((mult_inA <=  X"3") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"3"))then
		      	 mult_out <=  X"4";
					  elsIF  ((mult_inA <=  X"E") and (mult_inB <=  X"3")) or ((mult_inA <=  X"3") and (mult_inB <=  X"E"))
					  then		      	 mult_out <=  X"1";
					  elsIF  ((mult_inA <=  X"F") and (mult_inB <=  X"3")) or ((mult_inA <=  X"3") and (mult_inB <=  X"f"))then
		      	 mult_out <=  X"2";
					 ----------------------------------------------------------------------------------------
					  elsIF ((mult_inA <=  X"4") and (mult_inB <=  X"4")) then
		      	 mult_out <=  X"3";
					  elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"5")) or  ((mult_inA <=  X"5") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"7";
                 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"6")) or  ((mult_inA <=  X"6") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"B";
					 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"7")) or  ((mult_inA <=  X"7") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"F";
					  elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"8")) or  ((mult_inA <=  X"8") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"6";
					  elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"9")) or  ((mult_inA <=  X"9") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"2";
					 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"A")) or  ((mult_inA <=  X"A") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"E";
					 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"B")) or  ((mult_inA <=  X"B") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"A";
					 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"5";
					 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"1";
					 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"D";
					 elsIF (((mult_inA <=  X"4") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"4")))then
		      	 mult_out <=  X"9";
					 
				-----------------------------------------------------------------------------------------------------
					  elsIF ((mult_inA <=  X"5") and (mult_inB <=  X"5")) then
		      	 mult_out <=  X"2";
                 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"6")) or  ((mult_inA <=  X"6") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"D";
					 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"7")) or  ((mult_inA <=  X"7") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"8";
					  elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"8")) or  ((mult_inA <=  X"8") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"E";
					  elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"9")) or  ((mult_inA <=  X"9") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"B";
					 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"A")) or  ((mult_inA <=  X"A") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"4";
					 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"B")) or  ((mult_inA <=  X"B") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"1";
					 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"9";
					 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"C";
					 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"3";
					 elsIF (((mult_inA <=  X"5") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"5")))then
		      	 mult_out <=  X"6";

---------------------------------------------------------------------------
  
                 elsIF ((mult_inA <=  X"6") and (mult_inB <=  X"6"))then
		      	 mult_out <=  X"7";
					 elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"7")) or  ((mult_inA <=  X"7") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"1";
					  elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"8")) or  ((mult_inA <=  X"8") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"5";
					  elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"9")) or  ((mult_inA <=  X"9") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"3";
					 elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"A")) or  ((mult_inA <=  X"A") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"9";
					 elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"B")) or  ((mult_inA <=  X"B") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"F";
					 elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"E";
					 elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"8";
					 elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"2";
					 elsIF (((mult_inA <=  X"6") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"6")))then
		      	 mult_out <=  X"4";	

---------------------------------------------------------------------------------------------------------------------

					 elsIF ((mult_inA <=  X"7") and (mult_inB <=  X"7")) then
		      	 mult_out <=  X"6";
					  elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"8")) or  ((mult_inA <=  X"8") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"D";
					  elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"9")) or  ((mult_inA <=  X"9") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"A";
					 elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"A")) or  ((mult_inA <=  X"A") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"3";
					 elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"B")) or  ((mult_inA <=  X"B") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"4";
					 elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"2";
					 elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"5";
					 elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"C";
					 elsIF (((mult_inA <=  X"7") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"7")))then
		      	 mult_out <=  X"B";	
-------------------------------------------------------------------------------------------------------------
 					  elsIF ((mult_inA <=  X"8") and (mult_inB <=  X"8"))then
		      	 mult_out <=  X"C";
					  elsIF (((mult_inA <=  X"8") and (mult_inB <=  X"9")) or  ((mult_inA <=  X"9") and (mult_inB <=  X"8")))then
		      	 mult_out <=  X"4";
					 elsIF (((mult_inA <=  X"8") and (mult_inB <=  X"A")) or  ((mult_inA <=  X"A") and (mult_inB <=  X"8")))then
		      	 mult_out <=  X"F";
					 elsIF (((mult_inA <=  X"8") and (mult_inB <=  X"B")) or  ((mult_inA <=  X"B") and (mult_inB <=  X"8")))then
		      	 mult_out <=  X"7";
					 elsIF (((mult_inA <=  X"8") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"8")))then
		      	 mult_out <=  X"A";
					 elsIF (((mult_inA <=  X"8") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"8")))then
		      	 mult_out <=  X"2";
					 elsIF (((mult_inA <=  X"8") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"8")))then
		      	 mult_out <=  X"9";
					 elsIF (((mult_inA <=  X"8") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"8")))then
		      	 mult_out <=  X"1";	
					 
					-------------------------------------------------------------------------------------------------------
 
					 elsIF ((mult_inA <=  X"9") and (mult_inB <=  X"9")) then
		      	 mult_out <=  X"D";
					 elsIF (((mult_inA <=  X"9") and (mult_inB <=  X"A")) or  ((mult_inA <=  X"A") and (mult_inB <=  X"9")))then
		      	 mult_out <=  X"5";
					 elsIF (((mult_inA <=  X"9") and (mult_inB <=  X"B")) or  ((mult_inA <=  X"B") and (mult_inB <=  X"9")))then
		      	 mult_out <=  X"C";
					 elsIF (((mult_inA <=  X"9") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"9")))then
		      	 mult_out <=  X"6";
					 elsIF (((mult_inA <=  X"9") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"9")))then
		      	 mult_out <=  X"F";
					 elsIF (((mult_inA <=  X"9") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"9")))then
		      	 mult_out <=  X"7";
					 elsIF (((mult_inA <=  X"9") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"9")))then
		      	 mult_out <=  X"E";						
					 
			----------------------------------------------------------------------------------------------------------------------
  
					 elsIF ((mult_inA <=  X"A") and (mult_inB <=  X"A"))  then
		      	 mult_out <=  X"8";
					 elsIF (((mult_inA <=  X"A") and (mult_inB <=  X"B")) or  ((mult_inA <=  X"B") and (mult_inB <=  X"A")))then
		      	 mult_out <=  X"2";
					 elsIF (((mult_inA <=  X"A") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"A")))then
		      	 mult_out <=  X"1";
					 elsIF (((mult_inA <=  X"A") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"A")))then
		      	 mult_out <=  X"B";
					 elsIF (((mult_inA <=  X"A") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"A")))then
		      	 mult_out <=  X"6";
					 elsIF (((mult_inA <=  X"A") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"A")))then
		      	 mult_out <=  X"C";				
					 
					 
------------------------------------------------------------------------------------------------------------------------------
  
					 elsIF ((mult_inA <=  X"B") and (mult_inB <=  X"B")) then
		      	 mult_out <=  X"9";
					 elsIF (((mult_inA <=  X"B") and (mult_inB <=  X"C")) or  ((mult_inA <=  X"C") and (mult_inB <=  X"B")))then
		      	 mult_out <=  X"D";
					 elsIF (((mult_inA <=  X"B") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"B")))then
		      	 mult_out <=  X"6";
					 elsIF (((mult_inA <=  X"B") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"B")))then
		      	 mult_out <=  X"8";
					 elsIF (((mult_inA <=  X"B") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"B")))then
		      	 mult_out <=  X"3";					 
					 
		------------------------------------------------------------------------------------------------------------
 
					 elsIF ((mult_inA <=  X"C") and (mult_inB <=  X"C"))then
		      	 mult_out <=  X"F";
					 elsIF (((mult_inA <=  X"C") and (mult_inB <=  X"D")) or  ((mult_inA <=  X"D") and (mult_inB <=  X"C")))then
		      	 mult_out <=  X"3";
					 elsIF (((mult_inA <=  X"C") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"C")))then
		      	 mult_out <=  X"4";
					 elsIF (((mult_inA <=  X"C") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"C")))then
		      	 mult_out <=  X"8";					 
					 		
					 
		-----------------------------------------------------------------------------------------------------------------------
 
					 elsIF ((mult_inA <=  X"D") and (mult_inB <=  X"D"))then
		      	 mult_out <=  X"E";
					 elsIF (((mult_inA <=  X"D") and (mult_inB <=  X"E")) or  ((mult_inA <=  X"E") and (mult_inB <=  X"D")))then
		      	 mult_out <=  X"A";
					 elsIF (((mult_inA <=  X"D") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"D")))then
		      	 mult_out <=  X"7";					 
					 		
	----------------------------------------------------------------------------------------------------------------------------

 
					 elsIF ((mult_inA <=  X"E") and (mult_inB <=  X"E"))then
		      	 mult_out <=  X"B";
					 elsIF (((mult_inA <=  X"E") and (mult_inB <=  X"f")) or  ((mult_inA <=  X"F") and (mult_inB <=  X"E")))then
		      	 mult_out <=  X"5";	
----------------------------------------------------------------------------------------------------------------------------

 
					 
					 elsIF ((mult_inA <=  X"F") and (mult_inB <=  X"f")) then
		      	 mult_out <=  X"A";							 
					 
					 
					 
		 
					 
				 end if;
			end process P1;
	end Behavioral;

