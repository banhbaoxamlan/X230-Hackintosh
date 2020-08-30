# ThinkPad X230 MacOS with OpenCore

macOS (Currently Catalina `10.15.6`) working on ThinkPad X230

<img src="https://raw.githubusercontent.com/banhbaoxamlan/X230-Hackintosh/master/OTHER/README/x230-catalina.png" alt="ThinkPad X230 Catalina" width="25%" align="right"/>**Status: Work In Progress**

[![ThinkPad](https://img.shields.io/badge/ThinkPad-X230-blue.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_X230.pdf) [![release](https://img.shields.io/badge/Download-latest-brightgreen.svg)](https://github.com/banhbaoxamlan/X230-Hackintosh/releases/latest) [![OpenCore](https://img.shields.io/badge/OpenCore-0.6.0-blue.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest) [![MacOS Catalina](https://img.shields.io/badge/macOS-10.15.6-brightgreen.svg)](https://www.apple.com/macos/catalina/)

**DISCLAIMER:** Read the entire README before you start. I am not responsible for any damages you may cause.

- To install macOS follow the guides provided by [Dortania](https://dortania.github.io/getting-started/)
- Useful tools by [CorpNewt](https://github.com/corpnewt) and [headkaze](https://github.com/headkaze/Hackintool)
- Complete EFI is available in the [releases](https://github.com/banhbaoxamlan/X230-Hackintosh/releases/latest) page
- Please don't clone or download the master branch for daily use

## Hardware

| Specifications      | Detail                                      |
| :------------------ | :------------------------------------------ |
| Computer model	    | Lenovo ThinkPad X230 (Type: 2325)           |
| Processor           | Intel Core i5-3320M (2C4T, 2.6 / 3.3GHz, 3MB) |
| Memory              | Micron 16GB (8x2) DDR3L 1867MHz, dual-channel |
| Hard Disk           | WD Blue 3D 250GB WDS250G2B0A      |
| Integrated Graphics | Intel HD Graphics 4000                      |
| Display      | 12.5" HD (1366x768) IPS - LG LP125WH2-SLB1 |
| ThinkLight | Yes |
| Audio support | Realtek ALC3202 (Layout-id: `18`) |
| Ethernet | Intel 82579LM Gigabit Network Connection (Lewisville) |
| Wireless Card       | Intel Centrino Advanced-N 6205           |
| Bluetooth | Broadcom Bluetooth 4.0 `2070B0` |
| Keyboard | 6-row, ThinkVantage button, spill-resistant, multimedia Fn keys, LED backlight |
| Dock                | ThinkPad UltraBase Series 3                 |

Recomended Upgrade: [UPGRADE.md](https://github.com/banhbaoxamlan/X230-Hackintosh/blob/master/OTHER/README/UPGRADE.md)

## Main Software

| Component      | Version           |
| :------------- | :---------------- |
| MacOS Catalina | 10.15.6 (19G2021) |
| OpenCore       | 0.6.0             |

## Kernel Extensions

| Kext                | Version |
| :------------------ | :------ |
| AppleALC            | 1.5.1   |
| Bluetooth_Broadcom  | 1.0.0   |
| EFICheckDisabler    | 0.5.0   |
| IntelMausi          | 1.0.3   |
| Lilu                | 1.4.6   |
| USBInjectAll        | 0.7.5   |
| VirtualSMC          | 1.1.5   |
| VoodooPS2Controller | 2.1.6   |
| WhateverGreen       | 1.4.1   |

## UEFI Drivers

| Driver          | Version           |
| :-------------- | :---------------- |
| HfsPlus.efi     | OcBinaryData      |
| OpenRuntime.efi | OpenCorePkg 0.6.0 |


## Status
<details>
<summary><strong>What's working :white_check_mark:</strong></summary>

  - [x] Battery Percentage
  - [x] Bluetooth
  - [x] Brightness
  - [x] Camera
  - [x] CPU Power Management
  - [x] Dock Support `ThinkPad UltraSeries 3`
  - [x] GPU Intel HD 4000 Graphics QE/CI
  - [x] Intel Ethernet
  - [x] Keyboard `Volume and brightness hotkeys`
  - [x] Sleep/Wake
  - [x] Sound `Automatic headphone detection, mute, volume controls fully working`
  - [x] Touchpad `1-4 fingers swipe works`
  - [x] TrackPoint  `Works perfectly. Just like on Windows or Linux`

</details>

<details>
<summary><strong>What's not working :warning:</strong></summary>

  - [ ] Fingerprint Reader
  - [ ] VGA
  - [ ] SD Card Reader

</details>

<details>
<summary><strong>Bug tracker :heavy_exclamation_mark:</strong></summary>

  - [ ] Trackpoint not working after wake from sleep

</details>


## BIOS settings

### Modified BIOS!!!

A simple method to install a modified BIOS is available [here](https://github.com/n4ru/1vyrain/) (no external programmer required).

<details>
<summary><strong>Settings :100:</strong></summary>

| Main | Sub #1                                 | Sub #2 | Sub #3 | Setting |
| :------------ | :----------- | ------------- | ------------- | ------------- |
| Config | Network | Wake On Lan |  | Disabled |
|  | Serial ATA (SATA) | Mode |  | AHCI |
| Advanced | System Agent (SA) configuration | Graphics Configuration | DVMT Pre-Allocated | 128MB |
|  |  |  | DVMT Total Gfx Mem | MAX |
| Security | Security Chip |  |  | Disabled |
|  | Memory Protection | Execution Prevention |  | Enabled |
|  | Anti-Theft | Current Setting |  | Disabled |
|  |  | Computrace | Current Setting | Disabled |
|  | Secure Boot |  |  | Disabled |
| Startup | UEFI/Legacy Boot |  |  | UEFI Only |
|  |  | CSM Support |  | Disabled |

</details>


### Generate your own SMBIOS

For setting up the SMBIOS info, use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)

Run GenSMBIOS, pick option 1 for downloading MacSerial and Option 3 for selecting out SMBIOS

MacBookPro10,2

Open `Config.plist`, find PlatformInfo >> Generic

The `Serial` part gets copied to SystemSerialNumber.

The `Board Serial` part gets copied to MLB.

The `SmUUID` part gets copied to SystemUUID.

**Reminder that you want either an invalid serial or valid serial numbers but those not in use, you want to get a message back like: "Invalid Serial" or "Purchase Date not Validated"** [Apple Check Coverage](https://checkcoverage.apple.com/)

### CPU Power Management

Recommended additional steps to improve battery life with optimized CPU power management:

- Open Terminal, copy and paste the following command:

  ```
  curl -o ~/ssdtPRGen.sh https://raw.githubusercontent.com/Piker-Alpha/ssdtPRGen.sh/master/ssdtPRGen.sh
  chmod +x ~/ssdtPRGen.sh
  ./ssdtPRGen.sh
  ```

- A customized `SSDT.aml` for your specific machine will now be in the directory /Users/yourusername/Library/ssdtPRGen

- Rename to `SSDT-PM.aml` , and copy to EFI/OC/ACPI/

- Open `Config.plist`, find ACPI >> Add, `SSDT-PM.aml` Enabled set True

- Reboot

### WIFI

Inbuilt Intel WiFi won't work out of box.

There are some work arounds with BIOS modified:

* **BCM94360HMB** (ABGN+AC, BT 4.0, 3x3:3):

  * AzureWave AW-CB160H (Recomended)
  
* **BCM94352HMB** (ABGN+AC, BT 4.0, 2x2:2):
  * AzureWave AW-CE123H
  * Dell DW1550
  * Lenovo Lite-On WCBN606BH

* **Older models** 

  * Atheros AR5B95
  * Dell DW1510
  * Dell DW1515

For a detailed description see [WIRELESS](https://github.com/banhbaoxamlan/X230-Hackintosh/tree/master/OTHER/WIRELESS)

## Support me <3

The project is made for free, but you can buy me a coffee if you want

[![donate](https://img.shields.io/badge/-buy%20me%20a%20coffee-green)](https://paypal.me/thebinhluong0519)

## Credits

- [Apple](https://www.apple.com) for macOS
- [Acidanthera](https://github.com/acidanthera) for all the kexts/utilities that they made
- [Rehabman](https://github.com/RehabMan) and [Daliansky](https://github.com/daliansky) for the patches and guides and kexts
- [George Kushnir](https://github.com/n4ru) for modified BIOS
- [Dortania](https://github.com/dortania) for for the OpenCore Install Guide
