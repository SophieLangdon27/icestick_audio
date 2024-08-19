DESIGN = hardwareblink
ROOT_DIR = /gb3-resources

.PHONY: build clean

build:
	yosys -l logs/yosys_log.txt -q yscript.ys
	nextpnr-ice40 -l logs/nextpnr_log.txt --hx1k --package tq144 --json build/$(DESIGN).json --pcf constraints/$(DESIGN).pcf --asc build/$(DESIGN).asc
	icetime -p constraints/$(DESIGN).pcf -P tq144 -d hx1k -t build/$(DESIGN).asc
	icepack build/$(DESIGN).asc build/$(DESIGN).bin

clean:
	rm -f build/*.json build/*.blif build/*.asc build/*.bin