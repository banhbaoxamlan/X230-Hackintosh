# MacOS on ThinkPad X230

[![ThinkPad](https://img.shields.io/badge/ThinkPad-X230-blue.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_X230.pdf) [![MacOS Big Sur](https://img.shields.io/badge/macOS-Big_Sur-purple.svg)](https://www.apple.com/macos/big-sur/) [![release](https://img.shields.io/badge/Download-latest-brightgreen.svg)](https://github.com/banhbaoxamlan/X230-Hackintosh/releases/latest) [![OpenCore](https://img.shields.io/badge/OpenCore-0.6.6-blue.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest) [![donate](https://img.shields.io/badge/-buy%20me%20a%20coffee-orange)](https://www.paypal.com/paypalme/thebinhluong0519)

**DISCLAIMER:** READ THE ENTIRE README.MD BEFORE YOU START. I am not responsible for any damages you may cause.

## Introduction

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