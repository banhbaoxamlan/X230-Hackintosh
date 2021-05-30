DefinitionBlock ("", "SSDT", 2, "X230", "DEVICE", 0)
{   
    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))

            Method (_DSM, 4, NotSerialized)
            {
                Return (Zero)
            }
            
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

    }

    External (_SB.PCI0, DeviceObj)

    Scope (_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, Zero)

            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}