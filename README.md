# X230-Hackintosh

macOS (Currently Catalina `10.15.6`) for ThinkPad X230

**Status: Work In Progress**

[![ThinkPad](https://img.shields.io/badge/ThinkPad-X230-blue.svg)]() [![release](https://img.shields.io/badge/Download-latest-brightgreen.svg)](https://github.com/LuongTheBinh-bit/X230-OpenCore-Hackintosh/releases/latest) [![OpenCore](https://img.shields.io/badge/OpenCore-0.6.0-blue.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest) [![MacOS Catalina](https://img.shields.io/badge/macOS-10.15.6-brightgreen.svg)](https://img.shields.io/badge/macOS-10.15.6-brightgreen.svg)

- To install macOS follow the guides provided by [Dortania](https://dortania.github.io/getting-started/)
- Useful tools by [CorpNewt](https://github.com/corpnewt) and [headkaze](https://github.com/headkaze/Hackintool)



## Hardware

| Specifications      | Detail                                      |
| :------------------ | :------------------------------------------ |
| Computer model	    | Lenovo ThinkPad X230 (Type: 2325)           |
| Processor           | Intel Core i5-3320M (2 Cores, 4 Threads) |
| Memory              | Micron 8GB DDR3L 1867MHz     |
| Hard Disk           | WD Blue 3D 250GB WDS250G2B0A      |
| Integrated Graphics | Intel HD Graphics 4000                      |
| Monitor             | LG LP125WH2-SLB1 HD IPS 1366x768            |
| Sound Card          | Realtek ALC269VC (layout-id: 18)         |
| Wireless Card       | Intel Centrino Advanced-N 6205              |
| Bluetooth | Broadcom Bluetooth 4.0 |
| Dock                | ThinkPad UltraBase Series 3                 |

## Main Software

| Component      | Version |
| :------------- | :------ |
| MacOS Catalina | 10.15.6 |
| OpenCore       | 0.6.0   |

## Kernel Extensions

| Kext                | Version |
| :------------------ | :------ |
| AppleALC            | 1.5.1   |
| Bluetooth_Broadcom  |         |
| EFICheckDisabler    |         |
| IntelMausi          | 1.0.3   |
| Lilu                | 1.4.6   |
| USBInjectAll        | 0.7.5   |
| VirtualSMC          | 1.1.5   |
| VoodooInput         | 1.0.7   |
| VoodooPS2Controller | 2.1.6   |
| WhateverGreen       | 1.4.1   |

## UEFI Drivers

| Driver          | Version           |
| :-------------- | :---------------- |
| HfsPlus.efi     | OcBinaryData      |
| OpenRuntime.efi | OpenCorePkg 0.6.0 |

## Working

- [x] Battery Percentage
- [x] Bluetooth
- [x] Brightness
- [x] Camera
- [x] Dock Support `ThinkPad UltraSeries3 and MiniDock Series3`
- [x] CPU Power Management
- [x] GPU Intel HD 4000 Graphics QE/CI
- [x] Intel Ethernet
- [x] Keyboard `Volume and brightness hotkeys`
- [x] SD Card Reader `Fortunately, USB connected`
- [x] Sound `Automatic headphone detection, mute, volume controls fully working`
- [x] Touchpad `1-4 fingers swipe works`
- [x] TrackPoint  `Works perfectly. Just like on Windows or Linux`
- [x] USB Ports

## Not working

- [ ] Fingerprint Reader
- [ ] VGA

## Not tested

- [ ] DRM `Widevine, FairPlay`



## BIOS settings

### Modified BIOS!!!

A simple method to install a modified BIOS is available [here](https://github.com/n4ru/1vyrain/) (no external programmer required).

### BIOS settings

| Main | Sub #1                                 | Sub #2 | Sub #3 | Setting |
| :------------ | :----------- | ------------- | ------------- | ------------- |
| Config | Network | Wake On Lan |  | Disabled |
|  | Serial ATA (SATA) | Mode |  | AHCI |
| Advanced | System Agent (SA) configuration | Graphics Configuration | DVMT Pre-Allocated | 128MB |
|  |  |  | DVMT Total Gfx Mem | MAX |
| Security | Security Chip |  |  | Disabled |
|  | Memory Protection Execution Prevention |  |  | Enabled |
|  | Anti-Theft |  |  | Disabled |
|  |  | Computrace | Current Setting | Disabled |
|  | Secure Boot |  |  | Disabled |
| Startup | UEFI/Legacy Boot |  |  | UEFI Only |
|  |  | CSM Support |  | Disabled |

### Generate your own SMBIOS

For setting up the SMBIOS info, use [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)

Run GenSMBIOS, pick option 1 for downloading MacSerial and Option 3 for selecting out SMBIOS, Type MacBookPro10,2

Open Config.plist, find PlatformInfo>Generic

The `Type` part gets copied to SystemProductName.

The `Serial` part gets copied to SystemSerialNumber.

The `Board Serial` part gets copied to MLB.

The `SmUUID` part gets copied to SystemUUID.

### CPU Power Management

Recommended additional steps to improve battery life with optimized CPU power management:

- Open Terminal, copy and paste the following command:

  ```
  curl -o ~/ssdtPRGen.sh https://raw.githubusercontent.com/Piker-Alpha/ssdtPRGen.sh/master/ssdtPRGen.sh
  chmod +x ~/ssdtPRGen.sh
  ./ssdtPRGen.sh
  ```

- A customized SSDT.aml for your specific machine will now be in the directory /Users/yourusername/Library/ssdtPRGen

- Copy the file name SSDT.aml to OC/ACPI/ and reboot

### WIFI

Inbuilt Intel WiFi won't work out of box.

There are some work arounds with BIOS modified:

* **BCM94360HMB** (ABGN+AC, BT 4.0, 3x3:3):

  * AzureWave AW-CB160H (Recomended)
  * Alpha Networks WMC-AC01
  * Arcadyan WN8833B-AC
  * Gemtek WMDB-150AC
  * Unex DAXB-81
  * Wistron NeWeb DNXB-C1

* **BCM94352HMB** (ABGN+AC, BT 4.0, 2x2:2):

  * AzureWave AW-CE123H
  * Dell DW1550
  * HP TPC-Q013
  * Lenovo Lite-On WCBN606BH
  
* **Older models** 

  * Atheros AR5B95 (Drop support MacOS 10.14)
  * Dell DW1510 (Drop support MacOS 10.15)
  * Dell DW1515

## Support me

- PayPal: <https://www.paypal.me/thebinhluong0519>
- Ethereum: 0xC202255193D95979A7C937aA3CB5220FAD9E2aBe

## Credits

- [Apple](https://www.apple.com) for macOS
- [Acidanthera](https://github.com/acidanthera) for all the kexts/utilities that they made
- [Rehabman](https://github.com/RehabMan) for the patches and guides and kexts
- [George Kushnir](https://github.com/n4ru) for modified BIOS.
- [Dortania](https://github.com/dortania) for for the OpenCore Install Guide
