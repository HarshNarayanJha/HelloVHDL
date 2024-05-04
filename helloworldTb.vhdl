entity helloworldTb is
end entity;

architecture sim of helloworldTb is
begin

    process is
    begin

        -- This is the start of the process thread

        report "Hello World!!";

        wait;

        -- loops back the start of the process
    end process;

end architecture;