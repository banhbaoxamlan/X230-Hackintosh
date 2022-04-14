DefinitionBlock ("", "SSDT", 2, "X230", "XOSI", 0)
{
    Method (XOSI, 1)
    {
        If (_OSI ("Darwin"))
        {
            If (Arg0 == "Windows 2012")
            {
                Return (Ones)
            }
            Else
            {
                Return (Zero)
            }
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}