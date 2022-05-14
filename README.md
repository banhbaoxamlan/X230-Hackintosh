<h1 align="center">Hackintosh the Thinkpad X230</h1>

<p align="center">
    <a href="https://www.apple.com/">
        <img src="https://img.shields.io/badge/Catalina-10.15.7-red.svg"/></a>
    <a href="https://www.apple.com/macos/big-sur/">
        <img src="https://img.shields.io/badge/Big_Sur-11.6.5-purple.svg"></a>
    <a href="https://www.apple.com/macos/monterey/">
        <img src="https://img.shields.io/badge/Monterey-12.3.1-brown"></a>
    <a href="https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_X230.pdf">
        <img src="https://img.shields.io/badge/ThinkPad-X230-blue"/></a>
    <a href="https://github.com/acidanthera/OpenCorePkg">
        <img src="https://img.shields.io/badge/OpenCore-0.7.9-blue"/></a>
</p>

<p align="center">
    <a href="https://www.paypal.com/paypalme/thebinhluong0519">
        <img src="https://img.shields.io/badge/-Buy%20me%20a%20coffee-orange.svg"></a>
    <a href="https://www.buymeacoffee.com/karan1021">
        <img src="https://img.shields.io/badge/Donate%20prabhakaran-Buymeacoffee%20-FFF27D"></a>
    <a href="https://t.me/+KuAH5jUCAocwMzBl">
        <img src="https://img.shields.io/badge/Telegram-Channel-33A8E3"></a>
    
</p>

<p align="center">
    <a href="">
        <img src="/Other/Pics/X230.png" alt="Lenovo Thinkpad X230 macOS" width="400"> </a>
</p>

#### I am not responsible for any damages you may cause.

#### If my work here helped you. Please consider donating, it would mean a lot to me.

- Complete EFI packs are available in the releases page.
- I will try my best to keep the repo updated with the latest kexts and OpenCore version.
- Please **do not clone or download** the main branch for daily use: it may include **unstable code** just because it is my repository.
- This EFI is configured with Catalina, Big Sur and Monterey.
- With every EFI update you retrieve from here please remember to go through the post install guide.
- For MacOS Monterey - Please go through [README_MONTEREY](/Other/README_MONTEREY.md).

## Update

### Recent | [Changelog Archive](/Other/Changelog.md)

<details>
<summary><strong> SUMMARY </strong></summary>
<br>

> ### Non-Fuctional

| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| Fingerprint Reader                   | ❌   | `DISABLED` in BIOS to save power. |
| Wireless WAN                         | ❌   | `DISABLED` in BIOS to save power. |
| VGA Port                             | ❌   | Does not exist on real apple computers. |

> ### Video and Audio

| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| Full Graphics Accleration (QE/CI)    | ✅   | `WhateverGreen.kext`  |
| Audio Recording                      | ✅   | `AppleALC.kext` with Layout ID = 55 and `SSDT-HPET.aml`   |
| Audio Playback                       | ✅   | `AppleALC.kext` with Layout ID = 55 and `SSDT-HPET.aml`   |
| Automatic Headphone Output Switching | ✅   | `AppleALC.kext` with Layout ID = 55 and `SSDT-HPET.aml`   |
| Dock Audio Port                      | ✅   | `AppleALC.kext` with Layout ID = 55 and `SSDT-HPET.aml`   |

> ### Power, Charge, Sleep and Hibernation

| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| Battery Percentage Indication        | ✅   | `ECEnabler.kext`            | 
| iGPU Power Management                | ✅   | `XCPM`, enabled by [`SSDT-PM.aml`](https://github.com/Piker-Alpha/ssdtPRGen.sh) |
| S3 Sleep/ Hibernation Mode 3         | ✅   | `SSDT-PWTK.aml` |  |   
| Custom Charge Threshold              | ✅   | `SSDT-EC.aml`, [YogaSMC.kext](https://github.com/zhen-zen/YogaSMC), and [YogaSMCPane](https://github.com/zhen-zen/YogaSMC)|
| Fan Control                          | ✅   | `SSDT-EC.aml`, [YogaSMC.kext](https://github.com/zhen-zen/YogaSMC), and [YogaSMCPane](https://github.com/zhen-zen/YogaSMC)|
| Battery Life                         | ✅   | Native, comparable to Windows/Linux. |

> ### Input/ Output

| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| WiFi                                 | ✅   | `AirportItlwm.kext`  |
| Bluetooth                            | ✅   | `IntelBluetoothFirmware.kext`  |
| Ethernet                             | ✅   | `IntelMausi.kext`  |
| USB 2.0, USB 3.0                     | ✅   | `USBPorts.kext`    |
| USB Power Properties in macOS        | ✅   | `SSDT-EC-USBX.aml` |

> ### Display, TrackPad, TrackPoint, and Keyboard

| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| Brightness Adjustments | ✅  | `WhateverGreen.kext`, `SSDT-PNLF.aml` and `BrightnessKeys.kext`|
| TrackPoint             | ✅  | `VoodooPS2Controller.kext` |
| TrackPad               | ✅  | `VoodooPS2Controller.kext` |
| Built-in Keyboard      | ✅  | `VoodooPS2Controller.kext` |
| Multimedia Keys        | ✅  | `BrightnessKeys.kext` and [YogaSMC](https://github.com/zhen-zen/YogaSMC) |

> ### macOS Continuity

| Feature                              | Status | Dependency          |
| :----------------------------------- | ------ | ------------------- |
| iCloud, iMessage, FaceTime           | ✅   | Whitelisted Apple ID, Valid SMBIOS  |
| AirDrop                              | ✅   | Not tested  |
| Time Machine                         | ✅   | Native  |

</details>

<details>
<summary><strong> REFERENCES </strong></summary>
<br>

Read these before you start:

- [dortania's Hackintosh guides](https://github.com/dortania).
- [dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/).
- [dortania's OpenCore Post Install Guide](https://dortania.github.io/OpenCore-Post-Install/).
- [dortania/ Getting Started with ACPI](https://dortania.github.io/Getting-Started-With-ACPI/).
- [dortania/ opencore `multiboot`](https://github.com/dortania/OpenCore-Multiboot).
- [dortania/ `USB map` guide](https://dortania.github.io/OpenCore-Post-Install/usb/).
- [WhateverGreen Intel HD Manual](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md).
- `Configuration.pdf` and `Differences.pdf` in each `OpenCore` releases.

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

| Category  | THINKPAD X230            |
| --------- | ------------------------ |
| CPU       | Intel Core i5-3320M      |
| SSD       | Samsung 870 Evo 250GB    |
| Display   | 12.5' IPS HD (1366x1768) |
| WiFi & BT | Intel Wireless-AC 7260   |

- Refer to [X230-Platform_Specifications](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_X230.pdf) for possible stock ThinkPad X230 configurations.

</details>

<details>
<summary><strong> GETTING STARTED </strong></summary>
<br>

Before you do anything, please familiarize yourself with basic Hackintosh terminologies and the basic Hackintosh process by throughly reading Dortania guides as linked in `REFERENCES`

- Creating a macOS installer: refer to [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/)
- [**README-HARDWARE**](/Other/README_HARDWARE.md): Requirements before installing.
- [**README-OTHERS**](/Other/README_OTHERS.md): for post installation settings and other remarks.

</details>

<details>
<summary><strong> BENCHMARKS </strong></summary>
</br>

- macOS 11.4, EFI OpenCore 0.7.1

| CPU            | Single-Core | Multi-Core |
| :------------- | ----------: | ---------: |
| Cinebench R23  |             |       1576 |
| Geekbench 5    |         694 |       1421 |

| GPU            | OpenCL      | Metal      |
| :------------- | ----------: | ---------: |
| Geekbench 5    |        1028 |        193 |

</details>

# CONTACT

- Email: thebinhluong0519@gmail.com
- Email(Prabhakaran): prabha.karan.1021@gmail.com
- Telegram: +84 (867)-450-107
- Telegram(group): Click on the telegram button in the top

# Credits

- [Apple](https://www.apple.com) for macOS.
- [Acidanthera](https://github.com/acidanthera) for all the kexts/utilities that they made.
- [Rehabman](https://github.com/RehabMan) and [Daliansky](https://github.com/daliansky) for the patches and guides and kexts.
- [George Kushnir](https://github.com/n4ru) for modified BIOS.
- [Dortania](https://github.com/dortania) for for the OpenCore Install Guide.
- [simprecicchiani](https://github.com/simprecicchiani) for inspirational ThinkPad configurations.
- [zhen-zen](https://github.com/zhen-zen) for **YogaSMC**.
