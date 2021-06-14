# Post-Install

> ## CPU Power Management

- Open `EFI/OC/Config.plist` with any editor and navigate to `ACPI -> Delete`.
- Enable two patches `Drop CpuPm` and `Drop Cpu0Ist`.
- Save and reboot.
- Run the following script in Terminal:

```bash
curl -o ~/ssdtPRGen.sh https://raw.githubusercontent.com/Piker-Alpha/ssdtPRGen.sh/Beta/ssdtPRGen.sh && chmod +x ~/ssdtPRGen.sh && ~/ssdtPRGen.sh
```

and

```bash
open /Users/YOURUSERNAME/Library/ssdtPRGen
```

- Rename `ssdt.aml` to `SSDT-PM.aml` and replace the one in `EFI/OC/ACPI` with it.
- In Config, go to `ACPI -> Add` and re-enable `SSDT-PM.aml` if it is disabled.
- Disable 2 patches from `ACPI -> Delete` again.
- Save and reboot.

**You can install Intel Power Gadget to check.**

> ## Fully functioning multimedia Fn keys and Fan controling

- To have working Keyboard Function Keys (Fn) and Fan reading etc, you need to install the YogaSMCPane and the YogaSMC App.
- `YogaSMC.kext` is already included in the EFI so when yo go to releases tab, you download the [YogaSMC-App-Release.dmg](https://github.com/zhen-zen/YogaSMC/releases).

> ## Wireless and Bluetooth

- ### Enable Intel WLAN cards

  - Download [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases).
  - Copy `IntelBluetoothFirmware.kext` and `IntelBluetoothInjector.kext` to `/EFI/OC/Kexts`.
  - Open `/EFI/OC/Config.plist` with any editor.
  - Add the content of [#intel-wlan.plist](/EFI/OC/%23intel-wlan.plist).
  - Save and reboot.

- ### Enable non-natively supported Broadcom WLAN cards

  - Download [AirportBrcmFixup](https://github.com/acidanthera/AirportBrcmFixup/releases) and
   [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM/releases).
  - Copy `AirportBrcmFixup.kext`, `BrcmBluetoothInjector.kext`, `BrcmFirmwareData.kext` and `BrcmPatchRAM3.kext` to `/EFI/OC/Kexts`.
  - Open `/EFI/OC/Config.plist` with any editor.
  - Add the content of [#broadcom-wlan.plist](/EFI/OC/%23broadcom-wlan.plist).
  - Save and reboot.

- ### Original (Intel Centrino + ThinkPad BT module)

  - Open `/EFI/OC/Config.plist` with any editor.
  - Add the content of [#original-wlan.plist](/EFI/OC/%23original-wlan.plist).
  - Save and reboot.

> ## Enable Apple Services (iMessage/iCloud/FaceTime)

- Run the following script in Terminal:

```bash
git clone https://github.com/corpnewt/GenSMBIOS && cd GenSMBIOS && chmod +x GenSMBIOS.command && ./GenSMBIOS.command
```

- Type `1` to install MacSerial, then press ENTER.
- Type `3` to Generate SMBIOS, then press ENTER.
- Type `MacbookPro9,1`, then press ENTER.
- Open `/EFI/OC/Config.plist` with any editor and navigate to `PlatformInfo -> Generic`
- Add the script's last result to `MLB, SystemSerialNumber and SystemUUID`

```diff
<key>PlatformInfo</key>
<dict>
  <key>Generic</key>
  <array>
    </dict>
      <key>AdviseFeatures</key>
      <false/>
      <key>MaxBIOSVersion</key>
      <false/>
      <key>MLB</key>
+     <string>M0000000000000001</string>
      <key>ProcessorType</key>
      <integer>0</integer>
      <key>ROM</key>
      <data>ESIzRFVm</data>
      <key>SpoofVendor</key>
      <true/>
      <key>SystemMemoryStatus</key>
      <string>Auto</string>
      <key>SystemProductName</key>
      <string>MacBookPro9,1</string>
      <key>SystemSerialNumber</key>
+     <string>W00000000001</string>
      <key>SystemUUID</key>
+     <string>00000000-0000-0000-0000-000000000000</string>
      </dict>
   </array>
</dict>
```

- Save and reboot.

**NOTE: `We’re sorry, but this serial number isn’t valid` is fine and has personally worked and working for me and many others. `Purchase Date not Validated` can be a problem down the line if a legitimate machine with that PlatformInfo is activated.**

> ## Setup Hibernatemode & Sleep

- Open terminal, enter commands below one by one:
- Settings for AC:

```bash
sudo pmset -c standby 1
sudo pmset -c hibernatemode 0
```

- Setting for battery:

```bash
sudo pmset -b standby 1
sudo pmset -b standbydelayhigh 900
sudo pmset -b standbydelaylow 60
sudo pmset -b hibernatemode 25
```

- Settings for all:

```bash
sudo pmset -a acwake 0
sudo pmset -a lidwake 1
sudo pmset -a powernap 0
```

- To restore default system settings run `pmset restoredefaults` command.
- Hibernatemode supports values of 0, 3, or 25.
  - hibernatemode = 0 by default on desktops. The system will not back memory up to persistent storage. The system must wake from the contents of memory; the system will lose context on power loss.
  - hibernatemode = 3 by default on portables. The system will store a copy of memory to persistent storage (the disk), and will power memory during sleep. The system will wake from memory, unless a power loss forces it to restore from hibernate image.
  - hibernatemode = 25 is only settable via pmset. The system will store a copy of memory to persistent storage (the disk), and will remove power to memory. The system will restore from disk image. If you want "hibernation" - slower sleeps, slower wakes, and better battery life, you should use this setting.
