DefinitionBlock ("", "SSDT", 2, "X230", "UTILS", 0)
{
    Scope (\)
    {
        Method (OSDW, 0, NotSerialized)
        {
            If (CondRefOf (\_OSI))
            {
                If (_OSI ("Darwin"))
                {
                    Return (One)
                }
            }

            Return (Zero)
        }
    }
}