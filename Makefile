% : %.vhdl
	nvc -a $<
	nvc -e $@
	nvc -r -w $@ --stop-time=100ns
	gtkwave $@.fst

clean:
	rm -r ./work

# wave %:
# 	nvc -r -w $@ --stop-time=100ns
# 	gtkwave %.fst

.PHONY: clean
