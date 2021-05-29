All notable changes to this project will be documented in this file.  
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

> ## 0.5
- Added `BrightnessKeys.kext` to make Brightness Keys work in macOS.
- Added `SSDT-EC.aml` and `SSDT-THINK.aml`: support for YogaSMC
- Added `ECEnabler.kext` for battery status, delete `SSDT-BAT0.aml` and all patch for battery (not need)
- Added `VoodooSDHC.kext` to SD Card Reader work
- Added `YogaSMC.kext` to have working Keyboard Function Keys and Fan reading
- Added `SSDT-DEVICE.aml` : adding various virtual devices for macOS compatibility
- Delete `SSDT-ALS0.aml` and `SMCLightSensor.kext`: not need for Thinkpad X230
- Updated `SSDT-HPET.aml`: work correct to patch HPET for macOS Big Sur
- Updated `SSDT-KBD.aml`: delete all patch for custom keymap func, add `DisableDeepSleep` to fix trackpoint not working after sleep
- Updated `SSDT-PLNF.aml`: now work correct with maximum backlight
- Updated OpenCore 0.7.0 to the latest commit
- Updated kexts to May 2021
