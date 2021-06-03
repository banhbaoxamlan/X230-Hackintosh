DefinitionBlock ("", "SSDT", 2, "X230", "HPET", 0)
{
    External (_SB_.PCI0.LPC, DeviceObj)

    Scope (_SB.PCI0.LPC)
    {
        Device (HPE0)
        {
            Name (_HID, EisaId ("PNP0103") )
            Name (_UID, Zero)
            Name (BUF0, ResourceTemplate ()
            {
                IRQNoFlags () { 0, 8, 11 }
                Memory32Fixed (ReadOnly,
                    0xFED00000,
                    0x00000400,
                    )
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