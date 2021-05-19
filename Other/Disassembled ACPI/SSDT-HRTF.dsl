DefinitionBlock ("", "SSDT", 2, "X230", "HRTF", 0)
{
    External (OSDW, MethodObj)
    
    External (_SB.PCI0.LPC, DeviceObj)
    External (_SB.PCI0.LPC.PIC, DeviceObj)
    External (_SB.PCI0.LPC.RTC, DeviceObj)
    External (_SB.PCI0.LPC.TIMR, DeviceObj)
    External (_SB.PCI0.LPC.HPET, DeviceObj)
    External (\HPET, FieldUnitObj)

    Scope (_SB.PCI0.LPC.PIC)
    {
        Method (_STA, 0, NotSerialized)
        {
            If (\OSDW ())
            {
                Return (Zero)
            }
            
            Return (0x0F)
        }
    }

    Scope (_SB.PCI0.LPC.RTC)
    {
        Method (_STA, 0, NotSerialized)
        {
            If (\OSDW ())
            {
                Return (Zero)
            }
            
            Return (0x0F)
        }
    }

    Scope (_SB.PCI0.LPC.TIMR)
    {
        Method (_STA, 0, NotSerialized)
        {
            If (\OSDW ())
            {
                Return (Zero)
            }
            
            Return (0x0F)
        }
    }

    Scope (_SB.PCI0.LPC)
    {
        Device (IPIC)
        {
            Name (_HID, EisaId ("PNP0000"))
            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0020,
                    0x0020,
                    0x01,
                    0x02,
                    )
                IO (Decode16,
                    0x00A0,
                    0x00A0,
                    0x01,
                    0x02,
                    )
                IO (Decode16,
                    0x04D0,
                    0x04D0,
                    0x01,
                    0x02,
                    )
                IRQNoFlags ()
                    {2}
            })

            Method (_STA, 0, NotSerialized)
            {
                If (\OSDW ())
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (HPE0)
        {
            Name (_HID, EisaId ("PNP0103"))
            Name (_UID, Zero)
            Name (BUF0, ResourceTemplate ()
            {
                IRQNoFlags ()
                    {0}
                IRQNoFlags ()
                    {8}
                Memory32Fixed (ReadWrite,
                    0xFED00000,
                    0x00000400,
                    _Y24)
            })

            Method (_STA, 0, NotSerialized)
            {
                If (\OSDW ())
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)
            {
                CreateDWordField (BUF0, \_SB.PCI0.LPC.HPE0._Y24._BAS, HPT0)
                HPT0 = \HPET
                Return (BUF0)
            }
        }

        Device (RTC0)
        {
            Name (_HID, EisaId ("PNP0B00"))
            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0070,
                    0x0070,
                    0x01,
                    0x08,
                    )
            })

            Method (_STA, 0, NotSerialized)
            {
                If (\OSDW ())
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (TIM0)
        {
            Name (_HID, EisaId ("PNP0100"))
            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0040,
                    0x0040,
                    0x01,
                    0x04,
                    )
            })

            Method (_STA, 0, NotSerialized)
            {
                If (\OSDW ())
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }
}