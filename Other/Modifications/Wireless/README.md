# Wireless

## DW1510

- Download file `10.14.6_IO80211Family.kext.zip`, extract and replace IO80211Family kext in **/S/L/E**
- Open `Config.plist`, enable:
  - `ACPI>>Add>>SSDT-WIFI.aml`
  - `Kernel>>Add>>BlueTooth_BCM.kext`

BONUS: REBRAND THE DW1510 AS APPLE AIRPORT EXTREME [HERE](https://prasys.info/2009/12/09/rebranding-broadcom-802-11abgn-cards-as-airport/)
More information : [HERE](https://github.com/khronokernel/IO80211-Patches)

## BCM94352HMB (DW1550)

- Download [AirportBrcmFixup](https://github.com/acidanthera/AirportBrcmFixup/releases/latest) and [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM/releases/latest), copy kexts to **EFI/OC/Kexts/**
  - AirportBrcmFixup.kext
  - BrcmBluetoothInjector.kext
  - BrcmFirmwareData.kext
  - BrcmPatchRAM3.kext
- Open `Config.plist`, enable:
  - `Kernel>>Add>>AirportBrcmFixup.kext`
  - `Kernel>>Add>>BrcmBluetoothInjector.kext`
  - `Kernel>>Add>>BrcmFirmwareData.kext`
  - `Kernel>>Add>>BrcmPatchRAM3.kext`

## INTEL WIRELESS (AX200, 7260AC, etc)

Now support stock WIFI card X230, see more here: [OpenIntelWireless](https://openintelwireless.github.io/)