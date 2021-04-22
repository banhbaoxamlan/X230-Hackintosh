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
| | | | DVMT Total Gfx Mem | `MAX` |

> ## WiFi and Bluetooth:

Replace factory Intel WiFi module with a macOS compatible one. Make sure that the card is of mPCIe form factor. I replaced it with the BCM94352HMB card.

**If your laptop did not come with WWAN, you can purchase additional antennas to add to your laptop. This is useful when using WiFi/Bluetooth cards that have 3 antennas.**  

- **BCM94360HMB** (ABGN+AC, BT 4.0, 3x3:3):
  - AzureWave AW-CB160H (Recommended)
  
- **BCM94352HMB** (ABGN+AC, BT 4.0, 2x2:2):
  - AzureWave AW-CE123H
  - Dell DW1550
  - Lenovo Lite-On WCBN606BH

- **Older models**
  - Atheros AR5B95
  - Dell DW1510
  - Dell DW1515

See more [`dortania/Wireless-Buyers-Guide`](https://dortania.github.io/Wireless-Buyers-Guide/). 