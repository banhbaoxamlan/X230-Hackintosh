DefinitionBlock ("", "SSDT", 2, "X230", "USBX", 0)
{
    External (_SB_.PCI0.LPC, DeviceObj)

    Scope (_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)
            Method (_DSM, 4, NotSerialized)
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer() { 0x03 })
                }

                Return (Package()
                {
                    "kUSBSleepPowerSupply", 5100,
                    "kUSBSleepPortCurrentLimit", 2100,
                    "kUSBWakePowerSupply", 5100,
                    "kUSBWakePortCurrentLimit", 2100
                })
            }
        }

    }
}