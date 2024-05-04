entity waitsTb is
end entity;

architecture sim of waitsTb is
begin

    process is
    begin

        -- This is the start of the process thread

        report "Hello World!!";
        report "This is my First VHDL program";
        report "Gotta Learn Hardware";

        -- wait for 10 ns;     -- waitsTb for 10 ns

        -- loops back the start of the process
    end process;

end architecture;