resource "apstra_logical_device" "vjunos_96_1g" {
    name = "vJunos-switch"
    panels = [ {
        columns = 96
        rows = 1
        port_groups = [ {
            port_count = 96
            port_speed = "1G"
            port_roles = ["superspine", "spine", "leaf", "access", "generic"]
        }]
    }]
}
