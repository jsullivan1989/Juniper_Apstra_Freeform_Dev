locals {
    leaf_spine_only = {
        for id, sys in data.apstra_datacenter_system.system :
        id => sys
        if contains (["leaf", "spine"], sys.attributes.role)
    }
}
resource "apstra_datacenter_blueprint" "sullivan_tf_dc" {
    name = "sullivan_tf_dc"
    template_id = apstra_template_rack_based.freeform_dc_vjunos.id
}
resource "apstra_datacenter_resource_pool_allocation" "spine_asn_assignment" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    role = "spine_asns"
    pool_ids     = [apstra_asn_pool.spine_asn.id]
}
resource "apstra_datacenter_resource_pool_allocation" "leaf_asn_assignment" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    role = "leaf_asns"
    pool_ids     = [apstra_asn_pool.leaf_asn.id]
}
resource "apstra_datacenter_resource_pool_allocation" "leaf_loopback_assignment" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    role = "leaf_loopback_ips"
    pool_ids     = [apstra_ipv4_pool.loopbacks.id]
}
resource "apstra_datacenter_resource_pool_allocation" "spine_loopback_assignment" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    role = "spine_loopback_ips"
    pool_ids     = [apstra_ipv4_pool.loopbacks.id]
}
resource "apstra_datacenter_resource_pool_allocation" "leaf_spine_underlay_p2p" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    role = "spine_leaf_link_ips"
    pool_ids     = [apstra_ipv4_pool.underlay_transport.id]
}
data "apstra_datacenter_systems" "all_systems" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
}
data "apstra_datacenter_system" "system" {
    for_each = data.apstra_datacenter_systems.all_systems.ids
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    id = each.key
}
resource "apstra_datacenter_device_allocation" "devices_im" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    for_each = local.leaf_spine_only
    node_name = each.value.attributes.label
    initial_interface_map_id = apstra_interface_map.vjunos_96_1g_im.id
}

resource "apstra_blueprint_deployment" "sullivan_tf_dc_commit" {
    blueprint_id = apstra_datacenter_blueprint.sullivan_tf_dc.id
    depends_on = [
        apstra_datacenter_resource_pool_allocation.spine_asn_assignment,
        apstra_datacenter_resource_pool_allocation.leaf_asn_assignment,
        apstra_datacenter_resource_pool_allocation.leaf_loopback_assignment,
        apstra_datacenter_resource_pool_allocation.spine_loopback_assignment,
        apstra_datacenter_resource_pool_allocation.leaf_spine_underlay_p2p,
        apstra_datacenter_device_allocation.devices_im
    ]
}
