DefinitionBlock ("", "SSDT", 2, "X230", "HPET", 0)
{
    External (_SB.PCI0.LPC, DeviceObj)
    External (_SB.PCI0.LPC.HPET, DeviceObj)
    
    Name (_SB.PCI0.LPC.HPET._CRS, ResourceTemplate ()
    {
        IRQNoFlags ()
            {0}
        IRQNoFlags ()
            {8}
        Memory32Fixed (ReadWrite,
            0xFED00000,         // Address Base
            0x00000400,         // Address Length
            )
    })
}
