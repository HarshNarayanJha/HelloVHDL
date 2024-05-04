library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity signedunsignedTb is
end entity;

architecture sim of signedunsignedTb is

    signal UnsCnt   : unsigned(7 downto 0)  := (others => '0' );   -- aggregate assignment
    signal SigCnt   : signed(7 downto 0)    := (others => '0');

    signal Uns4     : unsigned(3 downto 0)  := "1000";
    signal Sig4     : signed(3 downto 0)    := "1000";

    signal Uns8     : unsigned(7 downto 0)  := (others => '0');
    signal Sig8     : signed(7 downto 0)    := (others => '0');

begin

    process is
    begin

        wait for 10 ns;

        -- Wrapping counter
        UnsCnt <= UnsCnt + 1;
        SigCnt <= SigCnt + 1;

        -- adding signals
        Uns8 <= Uns8 + Uns4;
        /* unsigned is added as expected
              1000      (zeroes as appened to start to become 00001000, then added)
        + 00000000
        -----------
          00001000  = 08
        */

        Sig8 <= Sig8 + Sig4;
        /* but signed is added while taking care of the sign bit
              1000      (1 is MSB and a sign bit, which is 1, hence the no. is -ve, hence ones are appened to become 11111000, then added)
        + 00000000
        -----------
          11111000
        + 00000000
        -----------
          11111000  = F8
        */

        -- hence the signed addition is done backwards

    end process;

end architecture;