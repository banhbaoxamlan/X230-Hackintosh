DefinitionBlock ("", "SSDT", 2, "X230", "XOSI", 0)
{
    Method (XOSI, 1)
    {
        Local0 = Package()
        {
            "Windows",
            "Windows 2001",
            "Windows 2001 SP2",
            "Windows 2006",
            "Windows 2006 SP1",
            "Windows 2006.1",
            "Windows 2009",
        }
        
        If (_OSI ("Darwin"))
        {
            Return (Ones != Match(Local0, MEQ, Arg0, MTR, 0, 0))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}