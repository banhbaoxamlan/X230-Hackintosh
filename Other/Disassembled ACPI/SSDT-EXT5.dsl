DefinitionBlock ("", "SSDT", 1, "X230", "EXT5", 0)
{
    External (_SB.PCI0.LPC.EC.HKEY.MMTS, MethodObj)
    External (_SB.PCI0.LPC.EC.LED1, IntObj)
    External (_SI._SST, MethodObj)

    Method (EXT5, 1, NotSerialized)
    {
        If (CondRefOf (\_SB.PCI0.LPC.EC.LED1))
        {
            If (Arg0 == Zero & \_SB.PCI0.LPC.EC.LED1 == One)
            {
                \_SB.PCI0.LPC.EC.HKEY.MMTS (0x02)
            }
        }

        If (Arg0 == Zero)
        {
            \_SI._SST(One)
        }
    }
}