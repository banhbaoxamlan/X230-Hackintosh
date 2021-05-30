# Hardware and BIOS:

> ## BIOS Settings:

At the minimum, these BIOS settings must be made to install and run macOS without any problems:

| Main Menu | Sub 1         | Sub 2         | Sub 3        | Setting       |
| --------- | ------------- | ------------- |------------- | ------------- |
| Config    | Network       | Wake On Lan   |              | `Disabled`    |
|           | Serial ATA (SATA) | Mode      |              | `AHCI`        |
| Security  | Security Chip |               |              | `Disabled`    |
|           | Memory Protection | Execution Prevention |   | `Enabled`     |
|           | Anti-Theft    | Current Setting |            | `Disabled`    |
|           |               | Computrace    | Current Setting | `Disabled` |
|           | Secure Boot   |               |              | `Disabled`    |
| Startup   | UEFI/Legacy Boot |            |              | `UEFI Only`   |
|           |               | CSM Support   |              | `No`          |

> ## Modding the BIOS:

A simple method to install a modified BIOS is available [here](https://github.com/n4ru/1vyrain/) (no external programmer required).

> ## Modded BIOS Settings:
The following are further optimization settings that can be figured once your BIOS is modded.

> * These settings are universally recommended optimizations for your hackintosh:

| Main Menu | Sub 1 | Sub 2 | Sub 3 | Setting |
|-----------|-------|------ |------ |-------- |
| Advanced  | System Agent (SA) configuration | Graphics Configuration | DVMT Pre-Allocated	| `64M` |
| | | | DVMT Total Gfx Mem | `256MB` |