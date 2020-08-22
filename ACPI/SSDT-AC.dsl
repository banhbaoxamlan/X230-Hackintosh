DefinitionBlock ("", "SSDT", 2, "X230", "AC", 0)
{
    External (_SB.PCI0.LPC.EC.AC, DeviceObj)

    Scope (\_SB.PCI0.LPC.EC.AC)
    {
        If (_OSI ("Darwin"))
        {
            Name (_PRW, Package()
            {
                0x18, 
                0x03
            })
        }
    }
}