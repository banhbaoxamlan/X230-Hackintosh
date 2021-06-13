DefinitionBlock ("", "SSDT", 2, "X230", "XOSI", 0)
{
    Method (XOSI, 1, NotSerialized)
    {
        Local0 = Package ()
        {
            "Windows",
            "Windows 2001", 
            "Windows 2001 SP2",
            "Windows 2006",
            "Windows 2006 SP1",
            "Windows 2009", 
            "Windows 2012",
            "Windows 2015",
            "Windows 2018", 
            "Windows 2018.2", 
            "Windows 2019", 
            "Windows 2020", 
            "Microsoft Windows NT"
        }
        If (_OSI ("Darwin"))
        {
            Return ((Ones != Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}