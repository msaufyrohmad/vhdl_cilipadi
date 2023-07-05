library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity demux64 is
 port(
     demux_in : in std_logic_vector(0 to 63);
     demux_sel: in std_logic;
     demux_out1 : out std_logic_vector(0 to 63);
     demux_out2 : out std_logic_vector(0 to 63)
 );
end demux64;
 
architecture bhv of demux64 is
begin
process (demux_in,demux_sel) is
begin
 if (demux_sel='0') then
    demux_out1 <=demux_in;
 else
    demux_out2 <=demux_in;
 end if;
 
end process;
end bhv;
