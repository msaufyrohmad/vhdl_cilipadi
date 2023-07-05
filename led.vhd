library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity led is
    Port ( led_in : in  STD_LOGIC_VECTOR (0 TO 63);
           led_out : out  STD_LOGIC_VECTOR (0 TO 63);
           clock      :in  STD_LOGIC;
           const1,const2,const3,const4 : in  STD_LOGIC_VECTOR (0 TO 3);
           const5,const6,const7,const8 : in  STD_LOGIC_VECTOR (0 TO 3));
end led;

architecture Behavioral of led is

	 
---------------AddConst-----------------		
 COMPONENT ac
    PORT(
         adin : IN  std_logic_vector(0 to 63);
	rc5, rc6, rc7,rc8 :  in  STD_LOGIC_VECTOR (0 to 3);
	rc1, rc2, rc3, rc4 :  in  STD_LOGIC_VECTOR (0 to 3);
         adout : OUT  std_logic_vector(0 to 63)
        );
    END COMPONENT; 

----------------SBOX---------------------------
 COMPONENT sc
    PORT(
         sc_in : IN  std_logic_vector(0 to 63);
         sc_out : OUT  std_logic_vector(0 to 63)
        );
    END COMPONENT; 	
-------------------SHIFT ROW------------------------------------
  COMPONENT sr
    PORT(
         sr_in : IN  std_logic_vector(0 to 63);
         sr_out : OUT  std_logic_vector(0 to 63)
        );
    END COMPONENT;	 
	 
--------------------MIX COLUMNS---------------------------------
    
COMPONENT mcs
    PORT(
         mcs_in : IN  std_logic_vector(0 to 63);
         mcs_out : OUT  std_logic_vector(0 to 63)
        );
    END COMPONENT;
	 SIGNAL ACRND, SBXRND, SHFRND :std_logic_vector(0 to 63);

begin


 
---------------AddConst-ac----------------		
   uutAC: ac PORT MAP (
          adin => led_in,
			 rc1 => const1,
			 rc2 => const2,
			 rc3 => const3,
			 rc4 => const4,
			 rc5 => const5,
			 rc6 => const6,
			 rc7 => const7,
			 rc8 => const8,
          adout => ACRND
        );
--OUTAC <= ACRND;
-----------------SBOX-sub cells ---------------------
uutSBOX: sc PORT MAP (
          sc_in => ACRND,
          sc_out => SBXRND
        );
--OUTSBX <= SBXRND;		  
--------------SHIFT-----------------------------------		  
 uutSHFIT: sr PORT MAP (
          sr_in => SBXRND,
          sr_out =>  SHFRND
        );
--OUTSHF <= SHFRND;		  
-------------MIX 4BY4--------------------
 uutMIX: mcs PORT MAP (
          mcs_in => SHFRND,
          mcs_out => led_out 
			 );
--------------------------------------


end Behavioral;

