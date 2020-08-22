DefinitionBlock ("", "SSDT", 2, "X230", "MCHCSBUS", 0)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.SMBU, DeviceObj)

    Scope (_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, Zero)
        }
    }

    Device (_SB.PCI0.SMBU.BUS0)
    {
        Name (_CID, "smbus")
        Name (_ADR, Zero)
        Device (DVL0)
        {
            Name (_ADR, 0x57)
            Name (_CID, "diagsvault")
            Method (_DSM, 4, NotSerialized)
            {
                If (!Arg2)
                {
                    Return (Buffer() { 0x57 })
                }

                Return (Package()
                {
                    "address", 0x57
                })
            }
        }
    }
}