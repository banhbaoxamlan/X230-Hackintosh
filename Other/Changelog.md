# Changelog
All notable changes to this project will be documented in this file.  
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## 2021-06-06
### Added
- `BlueTooth_BCM.kext` for ThinkPad Boardcom Bluetooth 4.0 module.
- `USBPorts.kext` for mapping usb ports.
- `SSDT-EC-USBX.aml` for USB Power.
### Changed
- `SSDT-DEVICE.aml` ALS0.
- `SSDT-HPET.aml` fixup TIMR, RTC, MATH, IPIC.
- Disabled `AppleXcpmExtraMsrs`.
- Enabled `DisableRtcChecksum`.
- Rename `SAT1 to SATA`, `EHC1 to EH01`, `EHC2 to EH02`, `XHCI to XHC`, `PXSX to ARPT`.
### Removed
- `_xcpm_bootstrap`.
- `IntelBluetoothFirmware.kext` and `IntelBluetoothInjector.kext`.
- `USBInjectAll.kext` no necessary since `USBPorts.kext` is used.

## [0.5-RC5] - 2021-06-03
### Added
- `AirportItlwm.kext` for support Intel Wireless.
- `BrightnessKeys.kext` to make brightness keys work in macOS.
- `ECEnabler.kext` for battery status.
- `VoodooSDHC.kext` for SD Card Reader work.
- `YogaSMC.kext` to have working Keyboard Function Keys and Fan reading.
- `RestrictEvents.kext`.
- `SSDT-DEVICE.aml` adding various virtual devices for macOS compatibility.
- `SSDT-EC.aml` and `SSDT-THINK.aml` for support YogaSMC.
### Changed
- Fix `SSDT-HPET.aml` now work correct to patch HPET for macOS Big Sur.
- Fix `SSDT-KBD.aml` accecpt Trackpoint and Trackpad , add `DisableDeepSleep` to fix Trackpoint not working after sleep.
- Fix `SSDT-PLNF.aml` now work correct with maximum backlight.
- Updated audio layout-id to `55` support for Dock Station Audio Port (UltraBase Series 3, Mini Dock Plus Series 3).
- Updated OpenCore 0.7.0 to the latest commit.
- Updated kexts to May 2021.
### Removed
- `EFICheckDisabler.kext`.
- `SSDT-ALS0.aml` and `SMCLightSensor.kext`, not need for Thinkpad X230.
- All patch for Battery and `SSDT-BAT0.aml`, no longer necessary since `ECEnabler.kext` is used.
- All patch for Keyboard Function, no longer necessary since `BrightnessKeys.kext` is used.