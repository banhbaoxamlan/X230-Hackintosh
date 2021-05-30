# Wireless

## INTEL WIRELESS (AX200, 7260AC, etc)

- Users with Intel cards can enjoy out of the box support for both Wireless and Bluetooth, see more here: [OpenIntelWireless](https://openintelwireless.github.io/)
- Enable the kexts for cards:
  - EFI/OC/Config.plist > Kernel > Add > Airportitlwm > Enabled = Yes
  - EFI/OC/Config.plist > Kernel > Add > IntelBluetoothInjector > Enabled = Yes
  - EFI/OC/Config.plist > Kernel > Add > IntelBluetoothFirmware > Enabled = Yes
- To enable the Bluetooth functions, cutting or taping over pin 51 on the card : https://imgur.com/EEF3urf

## DW1510

- Download file `10.14.6_IO80211Family.kext.zip`, extract and replace IO80211Family kext in **/S/L/E**
- Enable:
  - EFI/OC/Config.plist > Kernel > Add > BlueTooth_BCM > Enabled = Yes

**BONUS: REBRAND THE DW1510 AS APPLE AIRPORT EXTREME [HERE](https://prasys.info/2009/12/09/rebranding-broadcom-802-11abgn-cards-as-airport/)**
More information : [HERE](https://github.com/khronokernel/IO80211-Patches)

## BCM94352HMB (DW1550)

- Enable the kexts for cards:
  - EFI/OC/Config.plist > Kernel > Add > AirportBrcmFixup.kext > Enabled = Yes
  - EFI/OC/Config.plist > Kernel > Add > AirPortBrcmNIC_Injector > Enabled = Yes
  - EFI/OC/Config.plist > Kernel > Add > AirPortBrcm4360_Injector > Enabled = No
  - EFI/OC/Config.plist > Kernel > Add > BrcmBluetoothInjector.kext > Enabled = Yes
  - EFI/OC/Config.plist > Kernel > Add > BrcmFirmwareData.kext > Enabled = Yes
  - EFI/OC/Config.plist > Kernel > Add > BrcmPatchRAM3.kext > Enabled = Yes
