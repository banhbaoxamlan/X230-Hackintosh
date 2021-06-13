DefinitionBlock ("", "SSDT", 2, "X230", "KBD", 0)
{
    External (_SB.PCI0.LPC.KBD, DeviceObj)
    
    Scope (_SB.PCI0.LPC.KBD)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If (!Arg2) { Return (Buffer(One) { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "Thinkpad_TrackPad",
            })
        }

        Name (RMCF, Package ()
        {
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 100,
                "BogusDeltaThreshY", 100,
                "Clicking", ">y",
                "DisableDeepSleep", ">y",
                "DragLockTempMask", 0x40004,
                "FakeMiddleButton", ">n",
                "HWResetOnStart", ">y",
                "PalmNoAction When Typing", ">y",
                "ScrollResolution", 800,
                "SmoothInput", ">y",
                "UnsmoothInput", ">y",
                "Thinkpad", ">y",
                "DivisorX", 1,
                "DivisorY", 1,
                "FingerZ", 47,
                "MaxTapTime", 100000000,
                "MomentumScrollThreshY", 16,
                "MouseMultiplierX", 8,
                "MouseMultiplierY", 8,
                "MouseScrollMultiplierX", 2,
                "MouseScrollMultiplierY", 2,
                "MultiFingerHorizontalDivisor", 4,
                "MultiFingerVerticalDivisor", 4,
                "Resolution", 3200,
                "ScrollDeltaThreshX", 10,
                "ScrollDeltaThreshY", 10,
            },
        })
    }
}