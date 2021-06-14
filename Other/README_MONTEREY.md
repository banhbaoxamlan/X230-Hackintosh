# MacOS Monterey on ThinkPad X230

- Thanks to [Dortania](https://github.com/dortania) with [OCLP](https://github.com/dortania/OpenCore-Legacy-Patcher), we can install and update to MacOS 12 Monterey on ThinkPad X230.

> ## Install

- Download [gibMacOS](https://github.com/corpnewt/gibMacOS).
- Open `gibMacOS.command`.
- Type `c` to change Catalog, then type `4` to `Developer`.
- Type `1` to select `macOS 12.0`.
- Open `Launchpad`, select the `InstallAssistant.pkg`.
- Format USB Drive as HFS+J with GPT partition table.
- Run the following script in Terminal:

```bash
sudo /Applications/Install\ macOS\ 12\ Beta.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume
```

**Change `MyVolume` to the name of your usb partiton**

- Find your flash drive along with its EFI partition

```bash
diskutil list
```

then

```bash
sudo diskutil mount /dev/diskNsN
```

**Change `diskNsN` with your EFI identifier number**

- Clone my repo with new `EFI-Monterry`.
- Copy the EFI folder and paste it in your USB partiton.

- Relax ... I will update soon.
