DefinitionBlock ("", "SSDT", 2, "X230", "KBD", 0)
{
    External (_SB_.PCI0.LPC.EC, DeviceObj)
    External (_SB_.PCI0.LPC.KBD, DeviceObj)
    
    Scope (_SB.PCI0.LPC.KBD)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package ()
            {
                "RM,oem-id", "LENOVO", 
                "RM,oem-table-id", "Thinkpad_TrackPad"
            })
        }

        Name (RMCF, Package ()
        {
            "Keyboard", Package ()
            {
                "Custom PS2 Map", Package ()
                {
                    Package (){}, 
                    "e038=e05b", 
                    "e037=64"
                },
                "Synaptics TouchPad", Package()
                {
                    "BogusDeltaThreshX", 100,
                    "BogusDeltaThreshY", 100,
                    "Clicking", ">y",
                    "DragLockTempMask", 0x40004,
                    "DisableDeepSleep", ">y",
                    "DynamicEWMode", ">n",
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
                }
            }
        })
    }
}