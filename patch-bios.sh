#!/bin/sh
#
#  Patch the ACPI tables for an Asus P8Z68-V GEN3 BIOS version 3603
#

echo "Extracting ACPI tables"

sudo cat /sys/firmware/acpi/tables/DSDT  > dsdt.dat
sudo cat /sys/firmware/acpi/tables/SSDT1 > ssdt1.dat
sudo cat /sys/firmware/acpi/tables/SSDT2 > ssdt2.dat
sudo cat /sys/firmware/acpi/tables/SSDT3 > ssdt3.dat

echo "Decompiling"

iasl -e ssdt1.dat -e ssdt2.dat -e ssdt3.dat -d dsdt.dat

echo "Patching"

patch < dsdt.patch

echo "Recompiling"

iasl -ve -tc dsdt.dsl
cp dsdt.aml dsdt.fixed

echo "Tidying up"

rm dsdt.???
rm ssdt?.???