
resource "apstra_rack_type" "rack_vJunos_Base" {
    name = "vJunos-rack"
    description = "Base design by Terraform for Apstra"
    fabric_connectivity_design = "l3clos"
    leaf_switches = {
        "vjunos_sh" = {
            logical_device_id = apstra_logical_device.vjunos_96_1g.id
            spine_link_count = 2
            spine_link_speed = "1G"
        }
    }
    generic_systems = {
        "server" = {
            count = 1
            logical_device_id = "AOS-1x1-1"
            links = {
                link = {
                    speed = "1G"
                    target_switch_name = "vjunos_sh"
                }
            }
        }
    }
}
resource "apstra_rack_type" "rack_vJunos_Base_MH" {
    name = "vJunos-rack-mh"
    description = "Base design by Terraform for Apstra for ESI LAG"
    fabric_connectivity_design = "l3clos"
    leaf_switches = {
        "vjunos_mh" = {
            logical_device_id = apstra_logical_device.vjunos_96_1g.id
            spine_link_count = 2
            spine_link_speed = "1G"
            redundancy_protocol = "esi"
        }
    }
    generic_systems = {
        "server" = {
            count = 1
            logical_device_id = "AOS-2x1-1"
            links = {
                link1 = {
                    speed = "1G"
                    target_switch_name = "vjunos_mh"
                    lag_mode = "lacp_active"
                    switch_peer = "first"
                }
                link2 = {
                    speed = "1G"
                    target_switch_name = "vjunos_mh"
                    lag_mode = "lacp_active"
                    switch_peer = "second"
                }
            }
        }
    }
}
