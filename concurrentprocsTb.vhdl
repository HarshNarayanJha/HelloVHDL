library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity concurrentprocsTb is
end entity;

architecture sim of concurrentprocsTb is

    signal Uns  : unsigned(5 downto 0) := (others => '0');
    signal Mul1 : unsigned(7 downto 0) := (others => '0');
    signal Mul2 : unsigned(7 downto 0) := (others => '0');
    signal Mul3 : unsigned(7 downto 0) := (others => '0');

begin

    process is
    begin

        Uns <= Uns + 1;

        wait for 10 ns;

    end process;

    -- process multiplying Uns by 4
    process is
    begin

        Mul1 <= Uns & "00";

        wait on Uns;
    end process;

    -- equivalent process using sensitivity list
    process(Uns) is
    begin
        Mul2 <= Uns & "00";

    end process;

    -- same using concurrent statements
    -- compiler makes a new process, sensitive to all the signals on RHS, same as wait or a sensitivity list
    -- CONVENTION: use wait statements only in test bench codes, not in production
    Mul3 <= Uns & "00";

end architecture;