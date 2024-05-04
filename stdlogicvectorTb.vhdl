library ieee;
use ieee.std_logic_1164.all;

entity stdlogicvectorTb is
end entity;

architecture sim of stdlogicvectorTb is
  
  signal Slv1 : std_logic_vector(7 downto 0);                       -- 8-bit vector (7 downto 0)
  signal Slv2 : std_logic_vector(7 downto 0) := (others => '0');    -- default value for all bits = '0'
  signal Slv3 : std_logic_vector(7 downto 0) := (others => '1');    -- default value for all bits = '1'
  signal Slv4 : std_logic_vector(7 downto 0) := x"AA";              -- default value for all bits = x"AA" = 117
  signal Slv5 : std_logic_vector(0 to 7) := "11001110";             -- or we can do it in binary, and also we can use "to", just swapping the order
  signal Slv6 : std_logic_vector(7 downto 0) := "00000001";         -- how to iterate, see in process

begin

    process is
    begin

        -- Shift register
        wait for 10 ns;

        -- iteration over Slv6
        -- for i in 7 downto 1 loop     -- good, but hardcoding indices is never good, use attributes
        for i in Slv6'left downto Slv6'right + 1 loop
            Slv6(i) <= Slv6(i-1);       -- shift values to left
        end loop;

        -- Slv6(0) <= Slv6(7);             -- shift the value back to start
        Slv6(Slv6'right) <= Slv6(Slv6'left);

    end process;

end architecture;