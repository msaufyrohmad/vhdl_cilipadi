library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sc is
    Port ( sc_in : in  STD_LOGIC_VECTOR (0 to 63);
           sc_out : out  STD_LOGIC_VECTOR (0 to 63));
end sc;

architecture Behavioral of sc is
COMPONENT  sbox
    Port ( sbox_in : in  STD_LOGIC_VECTOR (0 to 3);
           sbox_out : out  STD_LOGIC_VECTOR (0 to 3));
end COMPONENT;

 signal      a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15  : std_logic_vector (3 downto 0); 
 signal      s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14, s15 : std_logic_vector (3 downto 0);
begin
---------------------------------------------------
   Sbox_0 : sbox
	   port map (
                 sbox_in  => a0 ,	
                 sbox_out => s0 
		              );
------------------------------	
    Sbox_1 : sbox 
	   port map (
               sbox_in  => a1,	
               sbox_out  => s1
		               );
-----------------------------------	
  Sbox_2 : sbox 
	    port map (
                 sbox_in  => a2,	
                 sbox_out  => s2
	              );
-------------------------------------	
Sbox_3 : sbox 
	    port map (
                  sbox_in  => a3,	
                  sbox_out  => s3
	               );
-----------------------------------	
Sbox_4 : sbox 
    port map (
                 sbox_in  => a4,	
                 sbox_out  => s4
	               );
-----------------------------------	
Sbox_5 : sbox 
	    port map (
                 sbox_in  => a5,	
                  sbox_out  => s5
						);
-----------------------------------	
Sbox_6 : sbox 
	    port map (
                  sbox_in  => a6,	
                 sbox_out  => s6
	               );
-----------------------------------	
Sbox_7 : sbox 
	   port map (
                  sbox_in  => a7,	
                  sbox_out  => s7
		               );
-------------------------------------	
Sbox_8 : sbox 
	    port map (
                  sbox_in  => a8,	
                  sbox_out  => s8
		               );
-----------------------------------	
Sbox_9 : sbox 
    port map (
                 sbox_in  => a9,	
                  sbox_out  => s9
	               );
-----------------------------------	
Sbox_10 : sbox 
    port map (
                 sbox_in  => a10,	
                  sbox_out  => s10
		               );						
 -------------------------------	
Sbox_11 : sbox 
	    port map (
                  sbox_in  => a11,	
                  sbox_out  => s11
		               );
-----------------------------------	
Sbox_12 : sbox 
	    port map (
                  sbox_in  => a12,	
                  sbox_out  => s12
	               );
-----------------------------------	
Sbox_13 : sbox 
	    port map (
                  sbox_in  => a13,	
                 sbox_out  => s13
		               );
-----------------------------------	
Sbox_14 : sbox 
    port map (
                 sbox_in  => a14,	
                 sbox_out  => s14
	               );
-----------------------------------	
Sbox_15 : sbox 
	    port map (
                  sbox_in  => a15,	
                 sbox_out  => s15
		               );

----------------------------------------

 a15 <= sc_in ( 60 to 63);  
 a14 <= sc_in (56 to 59);    
 a13 <= sc_in (52 to 55);   
 a12 <= sc_in (48 to 51);  
 a11 <= sc_in (44 to 47) ;
 a10 <= sc_in (40 to 43);  
 a9  <= sc_in (36 to 39) ; 
 a8  <= sc_in (32 to 35); 
 a7  <= sc_in (28 to 31);  
 a6  <= sc_in (24 to 27);   
 a5  <= sc_in ( 20 to 23);  
 a4  <= sc_in ( 16 to 19);  
 a3  <= sc_in ( 12 to 15); 
 a2  <= sc_in ( 8 to 11);  
 a1  <= sc_in ( 4 to 7);  
 a0  <= sc_in ( 0 to 3 ) ;  


 sc_out  ( 60 to 63) <= s15 ;
 sc_out  ( 56 to 59) <= s14 ;
 sc_out  (52 to 55)<= s13 ;
 sc_out  (48 to 51) <= s12 ;
 sc_out  (44 to 47) <= s11 ;
 sc_out  (40 to 43)<= s10 ;
 sc_out  (36 to 39) <= s9  ;
 sc_out (32 to 35) <= s8  ;
 sc_out  (28 to 31) <= s7  ;
 sc_out (24 to 27)<= s6  ;
 sc_out  ( 20 to 23) <= s5  ;
 sc_out ( 16 to 19) <= s4  ;
 sc_out  ( 12 to 15) <= s3  ;
 sc_out  ( 8 to 11) <= s2  ;
 sc_out   ( 4 to 7) <= s1  ;
 sc_out  ( 0 to 3 ) <= s0  ;



end Behavioral;




