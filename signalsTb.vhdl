entity signalsTb is
end entity;

architecture sim of signalsTb is
    -- declaretive region of the vhdl file

    -- Signals are alternative type of variables
    -- USECASE: Variables are local scoped, signalsTb can be accessed in any process.
    signal mysig : integer := 0;
begin

    process is
        variable myvar : integer := 0;
    begin

        mysig <= mysig + 1;     -- signal is updated here, but it won't reflect it's value until the wait statement is reached
        -- note that signal assignment is a bit different <= than normal variable assignment :=
        myvar := myvar + 1;
        
        report "mysig = " & integer'image(mysig) & " myvar = " & integer'image(myvar);
        
        wait for 10 ns;         -- the signal now updates, taking in the latest assignment, i.e. the latest assignment wins for signalsTb! 
    end process;

end architecture;