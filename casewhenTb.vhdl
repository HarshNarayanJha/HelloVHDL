library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity casewhenTb is
end entity;

architecture sim of casewhenTb is

    signal Sig1 : unsigned(7 downto 0) := x"AA";
    signal Sig2 : unsigned(7 downto 0) := x"BB";
    signal Sig3 : unsigned(7 downto 0) := x"CC";
    signal Sig4 : unsigned(7 downto 0) := x"DD";

    signal Sel : unsigned(1 downto 0) := b"00";

    signal Output1 : unsigned(7 downto 0);
    signal Output2 : unsigned(7 downto 0);

begin

    -- Stimuli for the selector signal
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

    -- MUX using if-then else statements
    process(Sel, Sig1, Sig2, Sig3, Sig4) is
    begin
        
        if Sel = b"00" then
            Output1 <= Sig1;
        elsif Sel = b"01" then
            Output1 <= Sig2;
        elsif Sel = b"10" then
            Output1 <= Sig3;
        elsif Sel = b"11" then
            Output1 <= Sig4;
        else    -- all 'X', 'U', '-' etc
            Output1 <= (others => 'X');
        end if;

    end process;

    -- MUX using case when statements
    process(Sel, Sig1, Sig2, Sig3, Sig4) is
    begin

        case Sel is
            when b"00" => 
                Output2 <= Sig1;
            when b"01" => 
                Output2 <= Sig2;
            when b"10" => 
                Output2 <= Sig3;
            when b"11" => 
                Output2 <= Sig4;
            when others =>
                Output2 <= (others => 'X');
        end case;

    end process;
end architecture;
