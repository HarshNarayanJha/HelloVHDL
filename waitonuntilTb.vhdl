entity waitonuntilTb is
end entity;

architecture sim of waitonuntilTb is
    signal CountUp      : integer := 0;
    signal CountDown    : integer := 10;

begin

    process is
    begin

        CountUp <= CountUp + 1;
        CountDown <= CountDown - 1;

        wait for 10 ns;
    end process;

    process is
    begin

        if CountUp > CountDown then
            report "CountUp is larger";
        elsif CountUp < CountDown then
            report "CountDown is larger";
        else
            report "Both are equal";
        end if;

        wait on CountUp, CountDown;

        -- report "CountUp = " & integer'image(CountUp) & " CountDown = " & integer'image(CountDown);

    end process;

end architecture;