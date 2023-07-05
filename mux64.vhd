library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux64 is
	port (
		ain : in STD_LOGIC_VECTOR (0 to 63);
		bin : in STD_LOGIC_VECTOR (0 to 63);
		cin : in STD_LOGIC_VECTOR (0 to 63);
		din : in STD_LOGIC_VECTOR (0 to 63);
		muxout : out STD_LOGIC_VECTOR (0 to 63);
		selmux : in STD_LOGIC_VECTOR (0 to 1)
	);
end mux64;
architecture Behavioral of mux64 is
begin
	process (ain, bin, cin, din, selmux)
	begin
		-- use case statement
		case selmux is
			when "00" => muxout <= ain;
			when "01" => muxout <= bin;
			when "10" => muxout <= cin;
			when "11" => muxout <= din;
			when others => muxout <= x"0000000000000000";
		end case;
	end process;
end Behavioral;
