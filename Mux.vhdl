library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Since we can't connect the "pins" in Test Bench (Simulation) mode, we never defined ports in entity up until now
-- but now this Mux is a real component, and we place it inside another Test Bench (Sim)
entity Mux is
    port(
        -- Inputs
        Sig1    : in unsigned(7 downto 0);
        Sig2    : in unsigned(7 downto 0);
        Sig3    : in unsigned(7 downto 0);
        Sig4    : in unsigned(7 downto 0);

        Sel     : in unsigned(1 downto 0);

        -- Ouput
        Output : out unsigned(7 downto 0)

    );
end entity;

-- no longer sim, but rtl = Register Transfer Level
architecture rtl of Mux is
begin

    process(Sel, Sig1, Sig2, Sig3, Sig4) is
    begin

        case Sel is
            when b"00" =>
                Output <= Sig1;
            when b"01" =>
                Output <= Sig2;
            when b"10" =>
                Output <= Sig3;
            when b"11" =>
                Output <= Sig4;
            when others =>
                Output <= (others => 'X');
        end case;

    end process;
end architecture;
