entity sensitivitylistTb is
end entity;

architecture sim of sensitivitylistTb is

    signal CountUp      : integer := 0;
    signal CountDown    : integer := 10;

begin

    process is
    begin

        CountUp <= CountUp + 1;
        CountDown <= CountDown - 1;

        wait for 10 ns;

    end process;

    -- process triggered using Wait On
    process is
    begin

        if CountUp = CountDown then
            report "Process A: Jackpot";
        end if;

        wait on CountUp, CountDown;

    end process;

    -- same as the previous process, but the wait on part is taken care of by the sensitivity list
    -- i.e. the process is sensitive to the changes to CountDown and CountUp variables
    process(CountUp, CountDown) is
    begin

        if CountUp = CountDown then
            report "Process B: Jackpot";
        end if;

    end process;

end architecture;