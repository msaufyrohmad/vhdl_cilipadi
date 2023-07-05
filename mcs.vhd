library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mcs is
    Port ( mcs_in : in  STD_LOGIC_VECTOR (0 to 63  );
           mcs_out : out  STD_LOGIC_VECTOR (0 to 63  ));
end mcs;

architecture Behavioral of mcs is


  COMPONENT mult
    PORT(
         mult_inA  : IN  std_logic_vector ( 0 to 3);
         mult_inB  : IN  std_logic_vector ( 0 to 3);
         mult_out : out  std_logic_vector( 0 to 3)
        );
    END COMPONENT;


-------------------------------------------------------------------------------------------------------------------------	
	signal sout001, sout002, sout003, sout004, sout005 :  STD_LOGIC_VECTOR ( 0 to 3); --1st element first Col
	signal sout011, sout012, sout013, sout014, sout015 :  STD_LOGIC_VECTOR ( 0 to 3); --2nd element first Col
	signal sout021, sout022, sout023, sout024, sout025 :  STD_LOGIC_VECTOR ( 0 to 3); --3rd element first Col
 	signal sout031, sout032, sout033, sout034, sout035 :  STD_LOGIC_VECTOR ( 0 to 3); --4th element first Col
 	signal sout041, sout042, sout043, sout044, sout045 :  STD_LOGIC_VECTOR ( 0 to 3); --5th element first Col

	--------------------------------------------------------------------------------------------------------------

	signal R_Mat00, R_Mat01, R_Mat02, R_Mat03, R_Mat04 :  STD_LOGIC_VECTOR ( 0 to 3);
	 
 ------------------------------------------------------------------------------------------------------------------
   signal sout101, sout102, sout103, sout104, sout105 :  STD_LOGIC_VECTOR ( 0 to 3); --firtst element 2nd Col
	signal sout111, sout112, sout113, sout114, sout115 :  STD_LOGIC_VECTOR ( 0 to 3); --2nd element 2nd Col
	signal sout121, sout122, sout123, sout124, sout125 :  STD_LOGIC_VECTOR ( 0 to 3); --3rd element 2nd Col
 	signal sout131, sout132, sout133, sout134, sout135 :  STD_LOGIC_VECTOR ( 0 to 3); --4rd element 2nd Col
 	signal sout141, sout142, sout143, sout144, sout145 :  STD_LOGIC_VECTOR ( 0 to 3); --4rd element 2nd Col

	signal R_Mat10, R_Mat11, R_Mat12, R_Mat13, R_Mat14 :  STD_LOGIC_VECTOR ( 0 to 3);
	

	------------------------------------------------------------------------------------------------------------------
   signal sout201, sout202, sout203, sout204, sout205 :  STD_LOGIC_VECTOR ( 0 to 3); --1st element 3rd Col
	signal sout211, sout212, sout213, sout214, sout215 :  STD_LOGIC_VECTOR ( 0 to 3); --2nd element 3rd Col
	signal sout221, sout222, sout223, sout224, sout225 :  STD_LOGIC_VECTOR ( 0 to 3); --3rd element 3rd Col
 	signal sout231, sout232, sout233, sout234, sout235 :  STD_LOGIC_VECTOR ( 0 to 3); --4th element 3rd Col
 	signal sout241, sout242, sout243, sout244, sout245 :  STD_LOGIC_VECTOR ( 0 to 3); --5th element 3rd Col

	signal R_Mat20, R_Mat21, R_Mat22, R_Mat23, R_Mat24 :  STD_LOGIC_VECTOR ( 0 to 3);
	------------------------------------------------------------------------------------------------------------------------
	
	
	signal sout301, sout302, sout303, sout304, sout305 :  STD_LOGIC_VECTOR ( 0 to 3); --1st element 4th Col
	signal sout311, sout312, sout313, sout314, sout315 :  STD_LOGIC_VECTOR ( 0 to 3); --2nd element 4th Col
	signal sout321, sout322, sout323, sout324, sout325 :  STD_LOGIC_VECTOR ( 0 to 3); --3rd element 4th Col
 	signal sout331, sout332, sout333, sout334, sout335 :  STD_LOGIC_VECTOR ( 0 to 3); --4th element 4th Col
 	signal sout341, sout342, sout343, sout344, sout345 :  STD_LOGIC_VECTOR ( 0 to 3); --5th element 4th Col

	signal R_Mat30, R_Mat31, R_Mat32, R_Mat33, R_Mat34 :  STD_LOGIC_VECTOR ( 0 to 3);
	
	
	------------------------------------------------------------------------------------------------------------------------
	
	
	signal sout401, sout402, sout403, sout404, sout405 :  STD_LOGIC_VECTOR ( 0 to 3); --firtst element 5th Col
	signal sout411, sout412, sout413, sout414, sout415 :  STD_LOGIC_VECTOR ( 0 to 3); --2nd element 5th Col
	signal sout421, sout422, sout423, sout424, sout425 :  STD_LOGIC_VECTOR ( 0 to 3); --3rd element 5th Col
 	signal sout431, sout432, sout433, sout434, sout435 :  STD_LOGIC_VECTOR ( 0 to 3); --4th element 5th Col
 	signal sout441, sout442, sout443, sout444, sout445 :  STD_LOGIC_VECTOR ( 0 to 3); --5th element 5th Col

	signal R_Mat40, R_Mat41, R_Mat42, R_Mat43, R_Mat44 :  STD_LOGIC_VECTOR ( 0 to 3);
	 
 ------------------------------------------------------------------------------------------------------------------


Type Matrix5by5_ARRAY is array 
  (integer range 1 to  16 ) of std_logic_vector ( 0 to 3);
   constant Mat5 : Matrix5by5_ARRAY := (x"4",x"1", x"2", x"2", 
	                                     x"8",x"6", x"5", x"6", 
													 x"B",x"E", X"A", x"9", 
													 x"2",x"2", x"F", x"B" );
begin

  uut001: mult PORT MAP ( mult_inA => mcs_in (0 to 3 )  , mult_inB => Mat5 (1) , mult_out=> Sout001);
     uut002: mult PORT MAP (mult_inA =>  mcs_in(16 to 19 ) , mult_inB => Mat5 (2), mult_out=> Sout002);
	    uut003: mult PORT MAP (mult_inA => mcs_in ( 32 TO 35)  , mult_inB => Mat5 (3), mult_out=> Sout003);
		  uut004: mult PORT MAP ( mult_inA => mcs_in ( 48 TO 51)   , mult_inB => Mat5 (4), mult_out=> Sout004);
			  	R_Mat00 <= Sout001 XOR Sout002 XOR Sout003 XOR Sout004  ;
				 mcs_out ( 0 TO 3) <= R_Mat00; 
        
-------------------------------------------------------------------------------------
 	 
 uut011: mult PORT MAP ( mult_inA => mcs_in ( 0 TO 3)  ,mult_inB  =>  Mat5 (5), mult_out=> Sout011);
  uut012: mult PORT MAP (mult_inA => mcs_in ( 16 to 19)   , mult_inB => Mat5 (6), mult_out=> Sout012);
   uut0131: mult PORT MAP (mult_inA => mcs_in ( 32 TO 35)  , mult_inB => Mat5 (7)  , mult_out=> Sout013);
    uut0141: mult PORT MAP ( mult_inA => mcs_in ( 48 TO 51)  , mult_inB =>  Mat5 (8) , mult_out=> Sout014);
  			 
   			R_Mat01 <= Sout011 XOR Sout012 XOR Sout013 XOR Sout014 ;

			  mcs_out ( 16 to 19) <= R_Mat01 ;
 
-------------------- ---------------------------------------------------------------------------
 uut021: mult PORT MAP ( mult_inA => mcs_in ( 0 TO 3) , mult_inB => Mat5 (9) , mult_out=> Sout021);
   uut022: mult PORT MAP (mult_inA => mcs_in ( 16 to 19) , mult_inB => Mat5 (10), mult_out=> Sout022);
    uut023: mult PORT MAP (mult_inA => mcs_in ( 32 TO 35) , mult_inB => Mat5 (11) , mult_out=> Sout023);
	   uut024: mult PORT MAP ( mult_inA => mcs_in ( 48 TO 51), mult_inB => Mat5 (12) , mult_out=> Sout024);
			  
 			 R_Mat02 <= Sout021 XOR Sout022 XOR Sout023 XOR Sout024 ;
			 			  	 
			  mcs_out ( 32 TO 35)   <=  R_Mat02 ;
			 
--------------------------------------------------------------------------------------------------------------------
uut031: mult PORT MAP ( mult_inA => mcs_in ( 0 TO 3) , mult_inB =>  Mat5 (13) , mult_out=> Sout031);
    uut032: mult PORT MAP (mult_inA => mcs_in ( 16 to 19) , mult_inB =>  Mat5 (14), mult_out=> Sout032);
	   uut033: mult PORT MAP (mult_inA => mcs_in ( 32 TO 35) , mult_inB =>  Mat5 (15), mult_out=> Sout033);
		  uut034: mult PORT MAP ( mult_inA =>mcs_in ( 48 TO 51), mult_inB =>  Mat5 (16), mult_out=> Sout034);
			 
					 
			R_Mat03 <= Sout031 XOR Sout032 XOR Sout033 XOR Sout034 ;
						
				mcs_out ( 48 TO 51)  <=  R_Mat03 ;
				 
-----------------------------------------------------------------------------------------------------------

 ------------------Secod Coloum--------------------------
---------------------------------------------------------			
 uut101: mult PORT MAP ( mult_inA => Mat5 (1) , mult_inB => mcs_in ( 4 TO 7), mult_out=> Sout101);
    uut102: mult PORT MAP (mult_inA =>  Mat5 (2) , mult_inB => mcs_in ( 20 TO 23), mult_out=> Sout102);
	   uut103: mult PORT MAP (mult_inA => Mat5 (3) , mult_inB => mcs_in ( 36 TO 39), mult_out=> Sout103);
		  uut104: mult PORT MAP ( mult_inA =>  Mat5 (4) , mult_inB => mcs_in ( 52 to 55) , mult_out=> Sout104);
			 
			R_Mat10 <= Sout101 XOR Sout102 XOR Sout103 XOR Sout104;
      
	  mcs_out ( 4 TO 7)   <=  R_Mat10 ;
	 
-------------------------------------------------------------------------------------
	uut111: mult PORT MAP ( mult_inA => mcs_in ( 4 TO 7) , mult_inB => Mat5 (5) , mult_out=> Sout111);
    uut112: mult PORT MAP (mult_inA => mcs_in ( 20 TO 23) , mult_inB => Mat5 (6), mult_out=> Sout112);
	   uut113: mult PORT MAP (mult_inA => mcs_in ( 36 TO 39) , mult_inB => Mat5 (7) , mult_out=> Sout113);
		  uut114: mult PORT MAP ( mult_inA => mcs_in ( 52 to 55) , mult_inB => Mat5 (8) , mult_out=> Sout114);
			 
			R_Mat11 <= Sout111 XOR Sout112 XOR Sout113 XOR Sout114 ;
 
		 	  mcs_out ( 20 TO 23)   <=  R_Mat11 ;
 
--------------------------------------------------------------------------------------------
uut121: mult PORT MAP ( mult_inA => mcs_in ( 4 TO 7) , mult_inB => Mat5 (9) , mult_out=> Sout121);
    uut122: mult PORT MAP (mult_inA => mcs_in ( 20 TO 23) , mult_inB => Mat5 (10), mult_out=> Sout122);
	   uut123: mult PORT MAP (mult_inA => mcs_in ( 36 TO 39) , mult_inB => Mat5 (11) , mult_out=> Sout123);
		  uut124: mult PORT MAP ( mult_inA => mcs_in ( 52 to 55) , mult_inB => Mat5 (12) , mult_out=> Sout124);

		 
			R_Mat12 <= Sout121 XOR Sout122 XOR Sout123 XOR Sout124 ;
			 
			   mcs_out ( 36 TO 39)   <=  R_Mat12 ;
			
			
----------------------------------------------------------------------------------------------------------------
uut131: mult PORT MAP ( mult_inA => mcs_in ( 4 TO 7) , mult_inB =>  Mat5 (13) , mult_out=> Sout131);
    uut132: mult PORT MAP (mult_inA => mcs_in ( 20 TO 23) , mult_inB =>  Mat5 (14), mult_out=> Sout132);
	   uut133: mult PORT MAP (mult_inA => mcs_in ( 36 TO 39) , mult_inB =>  Mat5 (15), mult_out=> Sout133);
		  uut134: mult PORT MAP ( mult_inA =>mcs_in ( 52 to 55) , mult_inB =>  Mat5 (16), mult_out=> Sout134);
			
			 
			R_Mat13 <= Sout131 XOR Sout132 XOR Sout133 XOR Sout134 ;
			 
		 			   mcs_out ( 52 to 55)   <=  R_Mat13 ;
---------------------------------------------------------------------------------------------------------
			
------------------------------------------------------------
--------------------	Third Coloum--------------------------
---------------------------------------------------------			
 uut201: mult PORT MAP ( mult_inA => Mat5 (1) , mult_inB => mcs_in ( 8 to 11), mult_out=> Sout201);
    uut202: mult PORT MAP (mult_inA =>  Mat5 (2) , mult_inB => mcs_in ( 24 to 27), mult_out=> Sout202);
	   uut203: mult PORT MAP (mult_inA => Mat5 (3) , mult_inB => mcs_in ( 40 TO 43), mult_out=> Sout203);
		  uut204: mult PORT MAP ( mult_inA =>  Mat5 (4) , mult_inB => mcs_in ( 56 to 59) , mult_out=> Sout204);
			 
			R_Mat20 <= Sout201 XOR Sout202 XOR Sout203 XOR Sout204 ;

--------------------------------------------------
	  mcs_out ( 8 to 11)   <=  R_Mat20 ;
	-------------------------------------------------------------------------
	 
	-------------------------------------------------------------------------------------
	uut211: mult PORT MAP ( mult_inA => mcs_in ( 8 to 11) , mult_inB => Mat5 (5) , mult_out=> Sout211);
    uut212: mult PORT MAP (mult_inA => mcs_in ( 24 TO 27) , mult_inB => Mat5 (6), mult_out=> Sout212);
	   uut213: mult PORT MAP (mult_inA => mcs_in ( 40 TO 43) , mult_inB => Mat5 (7) , mult_out=> Sout213);
		  uut214: mult PORT MAP ( mult_inA => mcs_in ( 56 TO 59) , mult_inB => Mat5 (8) , mult_out=> Sout214);
			 
			R_Mat21 <= Sout211 XOR Sout212 XOR Sout213 XOR Sout214;
 
		 	  mcs_out ( 24 TO 27)   <=  R_Mat21 ;
 
 ------------------------------------------------ 
  
------------------ ---------------------------------------------------------------------------
uut221: mult PORT MAP ( mult_inA => mcs_in ( 8 to 11) , mult_inB => Mat5 (9) , mult_out=> Sout221);
    uut222: mult PORT MAP (mult_inA => mcs_in ( 24 TO 27) , mult_inB => Mat5 (10), mult_out=> Sout222);
	   uut223: mult PORT MAP (mult_inA => mcs_in ( 40 TO 43) , mult_inB => Mat5 (11) , mult_out=> Sout223);
		  uut224: mult PORT MAP ( mult_inA => mcs_in ( 56 TO 59) , mult_inB => Mat5 (12) , mult_out=> Sout224);

		 
			R_Mat22 <= Sout221 XOR Sout222 XOR Sout223 XOR Sout224 ;
			mcs_out ( 40 TO 43)   <=  R_Mat22 ;
			
----------------------------------------------------------------------------------------------------------------
uut231: mult PORT MAP ( mult_inA => mcs_in ( 8 to 11) , mult_inB =>  Mat5 (13) , mult_out=> Sout231);
    uut232: mult PORT MAP (mult_inA => mcs_in ( 24 TO 27) , mult_inB =>  Mat5 (14), mult_out=> Sout232);
	   uut233: mult PORT MAP (mult_inA => mcs_in ( 40 TO 43) , mult_inB =>  Mat5 (15), mult_out=> Sout233);
		  uut234: mult PORT MAP ( mult_inA =>mcs_in ( 56 TO 59) , mult_inB =>  Mat5 (16), mult_out=> Sout234);
			
			 
			R_Mat23 <= Sout231 XOR Sout232 XOR Sout233 XOR Sout234 ;
			 
		 	 mcs_out ( 56 TO 59)   <=  R_Mat23 ;
---------------------------------------------------------------------------------------------------------

--------------------------------------------------------
--------------------	Fourth Coloum--------------------------
---------------------------------------------------------			
 uut301: mult PORT MAP ( mult_inA => Mat5 (1) , mult_inB => mcs_in ( 12 TO 15), mult_out=> Sout301);
    uut302: mult PORT MAP (mult_inA =>  Mat5 (2) , mult_inB => mcs_in (28 TO 31), mult_out=> Sout302);
	   uut303: mult PORT MAP (mult_inA => Mat5 (3) , mult_inB => mcs_in (44 to 47), mult_out=> Sout303);
		  uut304: mult PORT MAP ( mult_inA =>  Mat5 (4) , mult_inB => mcs_in (60  TO 63) , mult_out=> Sout304);
			 
			R_Mat30 <= Sout301 XOR Sout302 XOR Sout303 XOR Sout304 ;

--------------------------------------------------
	 mcs_out ( 12 TO 15)   <=  R_Mat30 ;
	-------------------------------------------------------------------------
	 
	-------------------------------------------------------------------------------------
	uut311: mult PORT MAP ( mult_inA => mcs_in ( 12 TO 15) , mult_inB => Mat5 (5) , mult_out=> Sout311);
    uut312: mult PORT MAP (mult_inA => mcs_in (28 TO 31) , mult_inB => Mat5 (6), mult_out=> Sout312);
	   uut313: mult PORT MAP (mult_inA => mcs_in (44 to 47) , mult_inB => Mat5 (7) , mult_out=> Sout313);
		  uut314: mult PORT MAP ( mult_inA => mcs_in (60  TO 63) , mult_inB => Mat5 (8) , mult_out=> Sout314);
			 
			R_Mat31 <= Sout311 XOR Sout312 XOR Sout313 XOR Sout314 ;
 
			 mcs_out (28 TO 31)   <=  R_Mat31 ;
 
 ------------------------------------------------ 
  
------------------ ---------------------------------------------------------------------------
uut321: mult PORT MAP ( mult_inA => mcs_in ( 12 TO 15) , mult_inB => Mat5 (9) , mult_out=> Sout321);
    uut322: mult PORT MAP (mult_inA => mcs_in (28 to 31) , mult_inB => Mat5 (10), mult_out=> Sout322);
	   uut323: mult PORT MAP (mult_inA => mcs_in (44 to 47) , mult_inB => Mat5 (11) , mult_out=> Sout323);
		  uut324: mult PORT MAP ( mult_inA => mcs_in (60  TO 63) , mult_inB => Mat5 (12) , mult_out=> Sout324);

		 
			R_Mat32 <= Sout321 XOR Sout322 XOR Sout323 XOR Sout324 ;
			 
			 mcs_out (44 to 47)   <=  R_Mat32 ;
			
			
----------------------------------------------------------------------------------------------------------------
uut331: mult PORT MAP ( mult_inA => mcs_in ( 12 TO 15) , mult_inB =>  Mat5 (13) , mult_out=> Sout331);
    uut332: mult PORT MAP (mult_inA => mcs_in (28 TO 31) , mult_inB =>  Mat5 (14), mult_out=> Sout332);
	   uut333: mult PORT MAP (mult_inA => mcs_in (44 to 47) , mult_inB =>  Mat5 (15), mult_out=> Sout333);
		  uut334: mult PORT MAP ( mult_inA =>mcs_in (60  TO 63) , mult_inB =>  Mat5 (16), mult_out=> Sout334);
			
			 
			R_Mat33 <= Sout331 XOR Sout332 XOR Sout333 XOR Sout334 ;
			 
			 mcs_out (60  TO 63)   <=  R_Mat33 ;		
---------------------------------------------------------------------------------------------------------
	
end Behavioral;

