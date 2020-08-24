DefinitionBlock ("", "SSDT", 2, "X230", "LID", 0)
{
    External (_SB.LID, DeviceObj)
    External (_SB.LID.XLID, MethodObj)
    External (_SB.PCI9.FNOK, IntObj)
    
    Scope (_SB.LID)
    {
        Method (_LID, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (\_SB.PCI9.FNOK == 1)
                {
                    Return (Zero)
                }
                Else
                {
                    Return (\_SB.LID.XLID())
                }
            }
            Else
            {
                Return (\_SB.LID.XLID())
            }
        }
    }
}