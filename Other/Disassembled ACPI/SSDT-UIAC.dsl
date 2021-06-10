DefinitionBlock ("", "SSDT", 2, "X230", "UIAC", 0)
{
    External (\_SB.PCI0.LPC, DeviceObj)

    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)
            Method (_DSM, 4, NotSerialized)
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply", 0x13EC,
                    "kUSBSleepPortCurrentLimit", 0x0834,
                    "kUSBWakePowerSupply", 0x13EC,
                    "kUSBWakePortCurrentLimit", 0x0834
                })
            }
        }
    }
    
    Device (UIAC)
    {
        Name (_HID, "UIA00000")

        Name (RMCF, Package()
        {
            // EH01 (8086_1e26)
            "EH01", Package()
            {
                "port-count", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "PR11", Package()
                      {
                          "name", Buffer() { "PR11" },
                          "UsbConnector", 255,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                      },
                },
            },
            // EH02 (8086_1e2d)
            "HUB2", Package()
            {
                "port-count", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HP22", Package()
                      {
                          "name", Buffer() { "HP22" },
                          "portType", 0,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                      },
                      "HP25", Package()
                      {
                          "name", Buffer() { "HP25" },
                          "portType", 0,
                          "port", Buffer() { 0x05, 0x00, 0x00, 0x00 },
                      },
                      "HP26", Package()
                      {
                          "name", Buffer() { "HP26" },
                          "portType", 0,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                      },
                },
            },
            // XHC (8086_1e31)
            "XHC", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HS01", Package()
                      {
                          "name", Buffer() { "HS01" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                      },
                      "HS02", Package()
                      {
                          "name", Buffer() { "HS02" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                      },
                      "HS03", Package()
                      {
                          "name", Buffer() { "HS03" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                      },
                      "HS04", Package()
                      {
                          "name", Buffer() { "HS04" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                      },
                      "SS01", Package()
                      {
                          "name", Buffer() { "SS01" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x05, 0x00, 0x00, 0x00 },
                      },
                      "SS02", Package()
                      {
                          "name", Buffer() { "SS02" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                      },
                      "SS03", Package()
                      {
                          "name", Buffer() { "SS03" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                      },
                      "SS04", Package()
                      {
                          "name", Buffer() { "SS04" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                      },
                },
            },
            // EH01 (8086_1e26)
            "HUB1", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HP18", Package()
                      {
                          "name", Buffer() { "HP18" },
                          "portType", 0,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                      },
                },
            },
            // EH02 (8086_1e2d)
            "EH02", Package()
            {
                "port-count", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "PR21", Package()
                      {
                          "name", Buffer() { "PR21" },
                          "UsbConnector", 255,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                      },
                },
            },
        })
    }
}
