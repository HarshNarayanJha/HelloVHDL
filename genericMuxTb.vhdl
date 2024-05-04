library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity genericMuxTb is
end entity;

architecture sim of genericMuxTb is

    -- declare a const variable to hold the datawidth
    constant DataWidth : integer := 8;


    signal Sig1     : unsigned(DataWidth-1 downto 0) := x"AA";
    signal Sig2     : unsigned(DataWidth-1 downto 0) := x"BB";
    signal Sig3     : unsigned(DataWidth-1 downto 0) := x"CC";
    signal Sig4     : unsigned(DataWidth-1 downto 0) := x"DD";

    signal Sel      : unsigned(1 downto 0) := b"00";

    signal Output   : unsigned(DataWidth-1 downto 0);

begin

    -- Instance of the Mux with architecture rtl
    i_Mux : entity work.GenericMux(rtl)
        -- pass the DataWidth using generic maps to the GenericMux
        generic map(DataWidth => DataWidth)
        port map(
            Sel     => Sel,
            Sig1    => Sig1,
            Sig2    => Sig2,
            Sig3    => Sig3,
            Sig4    => Sig4,
            Output  => Output
        );

    -- Testbench process
    process is
    begin

        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        Sel <= Sel + 1;
        wait for 10 ns;
        
        Sel <= "UU";
        wait;

    end process;

end architecture;
