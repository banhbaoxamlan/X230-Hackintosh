# MacOS on ThinkPad X230

[![ThinkPad](https://img.shields.io/badge/ThinkPad-X230-blue.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_X230.pdf) [![MacOS Big Sur](https://img.shields.io/badge/macOS-Big_Sur-purple.svg)](https://www.apple.com/macos/big-sur/) [![release](https://img.shields.io/badge/Download-latest-brightgreen.svg)](https://github.com/banhbaoxamlan/X230-Hackintosh/releases/latest) [![OpenCore](https://img.shields.io/badge/OpenCore-0.6.6-blue.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest) [![donate](https://img.shields.io/badge/-buy%20me%20a%20coffee-orange)](https://www.paypal.com/paypalme/thebinhluong0519)

**DISCLAIMER:** READ THE ENTIRE README.MD BEFORE YOU START. I am not responsible for any damages you may cause.

> ## Introduction

<details>
<summary><strong> SUMMARY </strong></summary>
<br>

> ### Non-Fuctional:
| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| Fingerprint Reader   | ❌ | `DISABLED` in BIOS to save power.   |
| Wireless WAN         | ❌ | `DISABLED` in BIOS to save power.   |

> ### Working:
| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| Audio Playback/Recording             | ✅ | `AppleALC.kext` with Layout ID = 18 and `SSDT-HRTF.aml` |
| Automatic Headphone Output Switching | ✅ | `AppleALC.kext` with Layout ID = 18 and `SSDT-HRTF.aml` |
| Battery Life                         | ✅ | Native |
| Battery Percentage Indication        | ✅ | `SSDT-BATX.aml` |
| Brightness Adjustments               | ✅ | `WhateverGreen.kext`, `SSDT-PNLF.aml`, and `BrightnessKeys.kext` |
| CPU Power Management                 | ✅ | Generate your own `SSDT-PM.aml` with [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh) |
| Custom Charge Threshold              | ✅ | `SSDT-ECRW.aml`, [YogaSMC.kext and YogaSMCPane](https://github.com/zhen-zen/YogaSMC) |
| Ethernet                             | ✅ | `IntelMausi.kext` |
| Full Graphics Accleration (QE/CI)    | ✅ | `WhateverGreen.kext` |
| Fan Control                          | ✅ | `SSDT-ECRW.aml`, [YogaSMC.kext and YogaSMCPane](https://github.com/zhen-zen/YogaSMC)|
| Multimedia Keys                      | ✅ | `BrightnessKeys.kext` and [YogaSMC](https://github.com/zhen-zen/YogaSMC) |
| USB ports and Micro SD Card Reader   | ✅ |  Mapping|
| TrackPoint, TrackPad and Keyboard    | ✅ | `VoodooPS2Controller.kext` |

</details>

<details>
<summary><strong> REFERENCES </strong></summary>
<br>

* Read these before you start:
- [dortania's Hackintosh guides](https://github.com/dortania)
- [dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [dortania's OpenCore Post Install Guide](https://dortania.github.io/OpenCore-Post-Install/)
- [dortania/ Getting Started with ACPI](https://dortania.github.io/Getting-Started-With-ACPI/)
- [dortania/ opencore `multiboot`](https://github.com/dortania/OpenCore-Multiboot)
- [dortania/ `USB map` guide](https://dortania.github.io/OpenCore-Post-Install/usb/)
- [WhateverGreen Intel HD Manual](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md)
- `Configuration.pdf` and `Differences.pdf` in each `OpenCore` releases.

* ### No seriously, please read those.
</details> 

<details>
<summary><strong> REQUIREMENTS </strong></summary>
<br>

- A macOS machine(optional): to create the macOS installer.
- Flash drive, 12GB or more, for the above purpose.  
- Xcode works fine for editing plist files on macOS, but I prefer [PlistEdit Pro](https://www.fatcatsoftware.com/plisteditpro/).  
- [ProperTree](https://github.com/corpnewt/ProperTree) if you need to edit plist files on Windows.  
- [MaciASL](https://github.com/acidanthera/MaciASL), for patching ACPI tables and editing ACPI patches.
- [MountEFI](https://github.com/corpnewt/MountEFI) to quickly mount EFI partitions.  
- [IORegistryExplorer](https://developer.apple.com/downloads), for diagnosis.  
- [Hackintool](https://www.insanelymac.com/forum/topic/335018-hackintool-v286/), for diagnostic ONLY, Hackintool should not be used for patching, it is outdated.
- Patience and time, especially if this is your first time Hackintosh-ing.

</details> 

<details>
<summary><strong> HARDWARE </strong></summary>
<br>

| Category  | Component                            |
| --------- | ------------------------------------ |
| CPU       | [Intel Core i5-3320M](https://ark.intel.com/content/www/us/en/ark/products/64896/intel-core-i5-3320m-processor-3m-cache-up-to-3-30-ghz.html) |
| SSD       | Samsung 860 Evo 500GB |
| Display   | 12.5" IPS HD (1366x1768) |
| WiFi & BT | BCM94352HMB |
| WWAN      | None |

- Refer to [X230-Platform_Specifications](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_X230.pdf) for possible stock ThinkPad X230 configurations.

</details>

<details>
<summary><strong> GETTING STARTED </strong></summary>
<br>

Before you do anything, please familiarize yourself with basic Hackintosh terminologies and the basic Hackintosh process by throughly reading Dortania guides as linked in `REFERENCES`

- Creating a macOS installer: refer to [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/)
- [**README-HARDWARE**](https://github.com/banhbaoxamlan/X230-Hackintosh/blob/master/Other/README_HARDWARE.md): Requirements before installing. 

</details> 

> ## SUPPORT

<details>
<summary><strong> CREDITS </strong></summary>
<br>

- [Apple](https://www.apple.com) for macOS
- [Acidanthera](https://github.com/acidanthera) for all the kexts/utilities that they made
- [Rehabman](https://github.com/RehabMan) and [Daliansky](https://github.com/daliansky) for the patches and guides and kexts
- [George Kushnir](https://github.com/n4ru) for modified BIOS
- [Dortania](https://github.com/dortania) for for the OpenCore Install Guide
- [MSzturc](https://github.com/MSzturc) for ThinkpadAssistant
- [simprecicchiani](https://github.com/simprecicchiani) for inspirational ThinkPad configurations
- [zhen-zen](https://github.com/zhen-zen) for YogaSMC

</details>
