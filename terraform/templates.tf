resource "apstra_template_rack_based" "freeform_dc_vjunos" {
    name = "ff-dc-vjunos"
    asn_allocation_scheme = "unique"
    overlay_control_protocol = "evpn"
    rack_infos = {
        (apstra_rack_type.rack_vJunos_Base.id) = {
            count = 2
        }
        (apstra_rack_type.rack_vJunos_Base_MH.id) = {
            count = 1
        }
    }
    spine = {
        logical_device_id = apstra_logical_device.vjunos_96_1g.id
        count = 2
    }
}
