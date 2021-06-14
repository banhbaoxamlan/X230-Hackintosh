# Hardware and BIOS

> ## Display panels

- Recommended IPS sisplay:
  - LP125WH2-SLT1 (FRU: NA)
  - LP125WH2-SLB3 (FRU: 04W3919)

- For FHD or 2K display, you can use [nitrocaster's mod kit](https://nitrocaster.me/store/x220-x230-fhd-mod-kit.html) or buy a ThinkPad X230/330 with FHD/2K mod kit form [xyte.ch](https://www.xyte.ch/shop/x330-pricing/).

- By default, the framebuffer-patch for `HD` models is enabled in the config under `DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0)`.

- If your model uses a `FHD/2K` panel, you need replace `AAPL,ig-platform-id` to `04006601`.

> ## Keyboard

- Support both stock 6-row keyboard (optional LED backligh) or 7-row classic keyboard Xx20 series.
- With 7-row classic keyboard, you can follow this guide for work in X230: [Guide](https://www.thinkwiki.org/wiki/Install_Classic_Keyboard_on_xx30_Series_ThinkPads).

> ## Storage

- The primary drive bay accommodates 2.5-inch, 7mm drives and supports SATA III (6Gb/s) speeds. Recommended SSD: Samsung 870 Evo 2021.

- An mSATA SSD can be installed in the second MiniPCI Express slot that provides a SATA II (3Gb/s) interface. Recommended mSATA SSD: Samsung 860 Evo mSATA.

> ## WiFi and Bluetooth

- Make sure that the card is of mPCIe form factor. I replaced it with the DW1550 card.

**If your laptop did not come with WWAN, you can purchase additional antennas to add to your laptop. This is useful when using WiFi/Bluetooth cards that have 3 antennas.**

- The AzureWave AW-CB160H (BCM94360HMB) support BT 4.0 and 802.11a/g/n/ac. This works out of the box without additional kexts and has been stable.

**Thanks to [zxystd](https://github.com/zxystd) with [Open Intel Wireless](https://github.com/OpenIntelWireless/itlwm), now Built-in Intel Wireless can support for Hackintosh.**

- If you use combo BT+WIFI (AC7260, BCM94352HMB, etc), to enable the Bluetooth functions, you need to cut or tap over pin 51 on the card: [example](https://imgur.com/EEF3urf).

However, there exists other alternatives with better WiFi and Bluetooth standards, but additional kexts are required. See [`dortania/Wireless-Buyers-Guide`](https://dortania.github.io/Wireless-Buyers-Guide/).

> ## BIOS Settings

- At the minimum, these BIOS settings must be made to install and run macOS without any problems:

| Main Menu | Sub 1         | Sub 2         | Sub 3        | Setting       |
| --------- | ------------- | ------------- |------------- | ------------- |
| Config    | Network       | Wake On Lan   |              | `Disabled`    |
|           | USB           | USB UEFI BIOS Support |      | `Enabled`     |
|           |               | Always On USB |              | `Disabled`    |
|           | Serial ATA (SATA) | Mode      |              | `AHCI`        |
| Security  | Security Chip |               |              | `Disabled`    |
|           | Memory Protection | Execution Prevention |   | `Enabled`     |
|           | Anti-Theft    | Current Setting |            | `Disabled`    |
|           |               | Computrace    | Current Setting | `Disabled` |
|           | Secure Boot   |               |              | `Disabled`    |
| Startup   | UEFI/Legacy Boot |            |              | `UEFI Only`   |
|           |               | CSM Support   |              | `No`          |
|           | Boot Mode     |               |              | `Quick`       |

> ## Modding the BIOS

- A simple method to install a modified BIOS is available [here](https://github.com/n4ru/1vyrain/) (no external programmer required).

> ## Modded BIOS Settings

- The following are further optimization settings that can be figured once your BIOS is modded.

> ## These settings are universally recommended optimizations for your hackintosh

| Main Menu | Sub 1 | Sub 2 | Sub 3 | Setting |
|-----------|-------|------ |------ |-------- |
| Advanced  | System Agent (SA) configuration | Graphics Configuration | DVMT Pre-Allocated | `128MB` |
| | | | DVMT Total Gfx Mem | `MAX` |
