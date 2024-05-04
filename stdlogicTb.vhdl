library ieee;                   -- import a library to use std_logic
use ieee.std_logic_1164.all;

entity stdlogicTb is

end entity;

architecture sim of stdlogicTb is
  
    signal Signal1 : std_logic := '0';
    -- '1': logic 1
    -- '0': logic 0
    -- 'Z': High impedence (allow other drivers to change)
    -- 'W': Weak signal, can't tell if 0 or 1
    -- 'L': Weak 0, pulldown
    -- 'H': Weak 1, pullup
    -- '-': Don't care
    -- 'U': Uninitialized
    -- 'X': Unknown, multiple drivers

    signal Signal2 : std_logic;
    signal Signal3 : std_logic;

begin

    process is
    begin

        wait for 10 ns;

        Signal1 <= not Signal1;

        report "Signal1 => " & std_logic'image(Signal1);

    end process;

    -- Driver A
    process is
    begin

        Signal2 <= 'Z';
        Signal3 <= '0';

        wait;

    end process;

    -- Driver B
    process(Signal1) is
    begin

        if Signal1 = '0' then
            Signal2 <= 'Z';
            Signal3 <= 'Z';
        else
            Signal2 <= '1';
            Signal3 <= '1';
        end if;

    end process;

end architecture;