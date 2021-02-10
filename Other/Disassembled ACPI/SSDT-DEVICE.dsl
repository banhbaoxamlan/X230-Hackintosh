DefinitionBlock ("", "SSDT", 2, "X230", "DEVICE", 0)
{
    External (_SB.PCI0.LPC, DeviceObj)
    
    Scope (_SB.PCI0.LPC)
    {
        Device (PMCR)
        {
            Name (_HID, EisaId ("APP9876"))
            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0xFE000000,
                    0x00010000 
                    )

            })
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
    
    Scope (\_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
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

    External (_SB_.PCI0, DeviceObj)

    Scope (_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, Zero)
        }
    }

    External (_SB_.PCI0.SMBU, DeviceObj)

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
    
    External (_SB.PCI0.LPC, DeviceObj)

    Scope (_SB.PCI0.LPC)
    {
        Device (DMAC)
        {
            Name (_HID, EISAID("PNP0200"))

            Name (_CRS, ResourceTemplate()
            {
                IO (Decode16, 0x00, 0x00, 0x01, 0x20)
                IO (Decode16, 0x81, 0x81, 0x01, 0x11)
                IO (Decode16, 0x93, 0x93, 0x01, 0x0d)
                IO (Decode16, 0xc0, 0xc0, 0x01, 0x20)
                DMA (Compatibility, NotBusMaster, Transfer8_16) { 4 }
            })

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