# Wireless

## DW1510

+ Download file `10.14.6_IO80211Family.kext.zip`, extract and replace IO80211Family kext in **/S/L/E**

+ Copy `Config.plist` and `SSDT-WIFI.aml` in **DW1510** folder to **EFI/OC/**

+ If you've tried other network-related Kernel Extensions before

  + Open System Preferences → Network, delete all ports, click on apply at the bottom right corner

  + Open Terminal, run:

    ```text
    open /Library/Preferences/SystemConfiguration
    ```

  + Then Delete

    + `com.apple.airport.preferences.plist`
    + `preferences.plist`
    + `NetworkInterfaces.plist`
    + `com.apple.network.identification.plist`
    + `com.apple.wifi.message-tracer.plist`
    + And all files containing `enX`, (`X` as an integer)

  + Reboot

BONUS: REBRAND THE DW1510 AS APPLE AIRPORT EXTREME [HERE](https://prasys.info/2009/12/09/rebranding-broadcom-802-11abgn-cards-as-airport/)

## BCM94352HMB (DW1550)/ BCM94360HMB

+ Download [AirportBrcmFixup](https://github.com/acidanthera/AirportBrcmFixup/releases/latest) and [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM/releases/latest), copy kexts to **EFI/OC/Kexts/**
  + AirportBrcmFixup.kext
  + BrcmBluetoothInjector.kext
  + BrcmFirmwareData.kext
  + BrcmPatchRAM3.kext
+ Detele `Bluetooth_Broadcom.kext`
+ Copy Config.plist in **DW1550** folder to **EFI/OC/**

## INTEL WIRELESS (AX200, 7260AC, etc)

See more here: ![OpenIntelWireless](https://openintelwireless.github.io/)