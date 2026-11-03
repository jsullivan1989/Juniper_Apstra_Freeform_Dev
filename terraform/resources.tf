# Spine/Leaf ASNs

resource "apstra_asn_pool" "leaf_asn" {
    name = "leaf-asn"
    ranges = [
        {
            first = 65000
            last = 65099
        }
    ]
}

resource "apstra_asn_pool" "spine_asn" {
    name = "spine-asn"
    ranges = [
        {
            first = 65100
            last = 65199
        }
    ]
}

# IP Pools 

resource "apstra_ipv4_pool" "loopbacks" {
    name = "loopback"
    subnets = [
        { network = "192.168.1.0/24"}
    ]
}

resource "apstra_ipv4_pool" "underlay_transport" {
    name = "underlay_transport"
    subnets = [
        { network = "192.0.2.0/24"}
    ]
}

resource "apstra_ipv4_pool" "dci_ranges" {
    name = "dci_ranges"
    subnets = [
        { network = "172.31.0.0/16"}
    ]
}


# VNI Pools

resource "apstra_vni_pool" "l2_vnis" {
    name = "l2-vni"
    ranges = [
        {
            first = 5000
            last  = 9999
        }
    ]
}

resource "apstra_vni_pool" "l3_vnis" {
    name = "l3-vni"
    ranges = [
        {
            first = 10000
            last  = 19999
        }
    ]
}
data "apstra_device_profile" "vJunos-switch" {
    name = "vJunos-switch"
}
resource "apstra_interface_map" "vjunos_96_1g_im" {
    name = "vJunos-IM"
    logical_device_id = apstra_logical_device.vjunos_96_1g.id
    device_profile_id =data.apstra_device_profile.vJunos-switch.id
    interfaces = flatten([local.interfaces])
}
