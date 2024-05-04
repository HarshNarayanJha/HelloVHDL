entity whileloopsTb is
end entity;

architecture sim of whileloopsTb is
begin

    process is
        variable i : integer := 0;      -- place to declare variables
    begin

        -- This is the start of the process thread
        
        while i < 10 loop
            report "Counting = " & integer'image(i);
            i := i + 1;
        -- wait for 10 ns;
        end loop;

        report "Good Bye";
        wait;

        -- whileloopsTb back the start of the process
    end process;

end architecture;