library ieee;
use ieee.std_logic_1164.all; 

entity mux64_21 is
  port (
        ain : in std_logic_vector(0 to 63);
        bin : in std_logic_vector(0 to 63);
        mux21out : out std_logic_vector(0 to 63);
        mux21_sel : in std_logic
end mux64_21;

architecture behaviour of mux64_21 is 
begin
  process (ain, bin, mux21_sel)
  begin
    if mux21_sel = '0' then
      mux21out <= ain;
    else
      mux21out <= bin;
    end if;
  end process;
end behaviour;