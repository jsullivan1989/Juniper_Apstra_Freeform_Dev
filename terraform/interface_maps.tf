locals {
    if_map = [
        { // map panel 1 port 1 through panel 1 port 96 to ge-0/0/0 - ge-0/0/95
            ld_panel = 1
            ld_first_port = 1
            phy_prefix = "ge-0/0/"
            phy_first_port = 0
            count = 96
        }
    ]
    interfaces = [
        for i in range(96) : {
            logical_device_port     = "1/${i + 1}"
            physical_interface_name = "ge-0/0/${i}"
        }
    ]
}
