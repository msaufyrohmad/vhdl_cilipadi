LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY cilipadi_tb IS
END cilipadi_tb;
 
ARCHITECTURE behavior OF cilipadi_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cilipadi
    PORT(
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
    END COMPONENT;
    

   --Inputs
   signal nonce_local : std_logic_vector(0 to 127) := (others => '0');
   signal keys_local : std_logic_vector(0 to 127) := (others => '0');
   signal clock_local : std_logic := '0';
   signal mode_local : std_logic := '0';
   signal reset_local : std_logic := '0';
   signal plaintext_local : std_logic_vector(0 to 63) := (others => '0');
   signal ad_local : std_logic_vector(0 to 63) := (others => '0');
   signal ad_next_local : std_logic;
   signal msg_next_local : std_logic; 
 	--Outputs
   signal tag_local : std_logic_vector(0 to 63);
   signal ciphertext_local : std_logic_vector(0 to 63);

   -- Clock period definitions
   constant clock_period : time := 1.6 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cilipadi PORT MAP (
          clock => clock_local,
          reset => reset_local,
          nonce => nonce_local,
          keys => keys_local,
          mode => mode_local,
           ad_next => ad_next_local,
           msg_next => msg_next_local,
	       tag => tag_local,
	       ciphertext => ciphertext_local,
	       plaintext => plaintext_local,
	       ad => ad_local          
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock_local <= '0';
		wait for clock_period/2;
		clock_local <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 5 ns;	

      wait for clock_period*3;

      -- insert stimulus here 
		
		 nonce_local <= x"00000000000000000000000000000000";
         keys_local  <= x"00000000000000000000000000000000";
         plaintext_local <= x"0000000000000000";
         ad_local <=x"0000000000000000";

      wait;
   end process;

END;
