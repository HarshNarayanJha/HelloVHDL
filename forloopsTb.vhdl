entity forloopsTb is
end entity;

architecture sim of forloopsTb is
begin

    process is
    begin

        -- This is the start of the process thread

        report "Begin of Loop";

        for i in 1 to 10 loop
            report "Counting = " & integer'image(i);
            wait for 10 ns;
        end loop;

        report "Good Bye";
        -- wait;

        -- forloopsTb back the start of the process
    end process;

end architecture;