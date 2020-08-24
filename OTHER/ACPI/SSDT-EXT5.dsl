DefinitionBlock ("", "SSDT", 1, "X230", "EXT5", 0)
{
    External (_SI._SST, MethodObj)

    Method (EXT5, 1, NotSerialized)
    {
        If (Arg0 == Zero)
        {
            \_SI._SST(One)
        }
    }
}
