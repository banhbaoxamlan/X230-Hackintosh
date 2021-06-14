# ACPI

| Patch       | Remark                                                  |
| ----------- | ------------------------------------------------------- |
| SSDT-AC     | Patch to load AppleACPIACAdapter                        |
| SSDT-DEVICE | Fixing / Adding various devices for macOS compatibility |
| SSDT-EC     | Alow Reads/Write and Provide an Interface with Embedded Controller via YogaSMC |
| SSDT-HPET   | Patch HPET and fixup TIMR, RTC                          |
| SSDT-KBD    | Fix Trackpad and Trackpoint                             |
| SSDT-PM     | Enables Native Intel Power Managements (i5-3320M)       |
| SSDT-PNLF   | Enables Brightness Management in macOS                  |
| SSDT-PTWK   | Fix Sleep and Wake issues                               |
| SSDT-THINK  | Support YogaSMC                                         |
| SSDT-UIAC   | Mapping USB ports and USB Power                         |
| SSDT-XOSI   | Enables Windows-only functionality in macOS             |

> ## ACPI Patching

- Download and install [MaciASL](https://github.com/acidanthera/MaciASL/releases) if you do not have it already.
- Source SSDT-\*.dsl patch files are located in here.
- Refer to my `EFI` folder to see which patches are currently being used by me.
- Once you have the compiled ACPI patches, place them in `EFI/OC/ACPI/` and make sure to create matching entries within OpenCore's config.plist's `ACPI -> Add`.

### Hotpatching Notes

- Source ACPI patches are .dsl Edit these as needed.
- Compiled ACPI patches are .aml Once compiled, these belong to EFI/OC/ACPI.
- OpenCore Patches are patches for config.plist in their respective level.
