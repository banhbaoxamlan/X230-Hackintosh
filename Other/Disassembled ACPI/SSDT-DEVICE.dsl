DefinitionBlock ("", "SSDT", 2, "X230", "DEVICE", 0)
{   
    Scope (_SB)
    {
        Device (ALS0)
        {
            Name (_HID, "ACPI0008")
            Name (_CID, "smc-als")
            Name (_ALI, 0x012C)
            Name (_ALR, Package ()
            {
                Package ()
                {
                    0x64,
                    0x012C
                }
            })

            Method (_STA, 0, NotSerialized)  // _STA: Status
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
    External (_SB.PCI0.SMBU, DeviceObj)
    
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
    
    Scope (_SB.PCI0.SMBU)
    {
        Device (BUS0)
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
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }

                    Return (Package ()
                    {
                        "address", 
                        0x57
                    })
                }
            }
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