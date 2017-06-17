Patch ASUS BIOS
===============

This repository contains a very simple patch for the ACPI DSDT tables for my
Asus P8Z86V Gen3 motherboard.

To use it, run `sudo ./patch-bios.sh`.  Root access is required to extract
the DSDT table.

If the patch was successful, the new ACPI tables are in `dsdt.fixed`. 
Installing this can be dangerous, but I assume if you've got this far, you
know what to do.

Please send any comments or suggestions to peter.hicks@poggs.co.uk.


