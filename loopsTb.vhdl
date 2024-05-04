entity loopsTb is
end entity;

architecture sim of loopsTb is
begin

    process is
    begin

        -- This is the start of the process thread

        report "Begin of Loop";

        loop
            report "Pikaboo!";
            wait for 10 ns;
            -- exit;
        end loop;

        report "Good Bye";
        wait;

        -- loopsTb back the start of the process
    end process;

end architecture;