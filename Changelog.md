# Changelog
All notable changes to this project will be documented in this file.  
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [0.5-RC5] - 2021-05-31
### Added
- `AirportItlwm.kext` for support Intel Wireless.
- `BrightnessKeys.kext` to make brightness keys work in macOS.
- `ECEnabler.kext` for battery status.
- `VoodooSDHC.kext` for SD Card Reader work.
- `YogaSMC.kext` to have working Keyboard Function Keys and Fan reading.
- `SSDT-DEVICE.aml` adding various virtual devices for macOS compatibility.
- `SSDT-EC.aml` and `SSDT-THINK.aml` for support YogaSMC.
### Changed
- Fix `SSDT-HPET.aml` now work correct to patch HPET for macOS Big Sur.
- Fix `SSDT-KBD.aml` accecpt Trackpoint and Trackpad , add `DisableDeepSleep` to fix Trackpoint not working after sleep.
- Fix `SSDT-PLNF.aml` now work correct with maximum backlight.
- Updated audio layout-id to `29`.
- Updated OpenCore 0.7.0 to the latest commit.
- Updated kexts to May 2021.
### Removed
- Deleted `SSDT-ALS0.aml` and `SMCLightSensor.kext`, not need for Thinkpad X230.
- Deleted all patch for Battery and `SSDT-BAT0.aml`, no longer necessary since `ECEnabler.kext` is used.
- Deleted all patch for Keyboard Function, no longer necessary since `BrightnessKeys.kext` is used.
