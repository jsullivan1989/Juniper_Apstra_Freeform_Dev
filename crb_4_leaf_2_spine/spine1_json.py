{
    "bgp": {
        "as_number": "65101",
        "neighbors": {
            "192.0.2.1": { "loopback": "192.168.1.1", "remote_as": "65001" },
            "192.0.2.5": { "loopback": "192.168.1.2", "remote_as": "65002" },
            "192.0.2.9": { "loopback": "192.168.1.3", "remote_as": "65003" },
            "192.0.2.13": { "loopback": "192.168.1.4", "remote_as": "65004" }
        },
        "router_id": "192.168.1.101"
    },
    "crb_enabled": true,
    "hostname": "spine-1",
    "location": "Sullivan_Labs",
    "role": "spine",
    "interfaces": {
        "ge-0/0/0": { "address": "192.0.2.0/31",  "irb": "no", "l3": "yes" },
        "ge-0/0/1": { "address": "192.0.2.4/31",  "irb": "no", "l3": "yes" },
        "ge-0/0/2": { "address": "192.0.2.8/31",  "irb": "no", "l3": "yes" },
        "ge-0/0/3": { "address": "192.0.2.12/31", "irb": "no", "l3": "yes" },
        "lo0":      { "address": "192.168.1.101/32", "irb": "no", "l3": "yes" }
    },
    "switch_options": {
        "rd": "192.168.1.101:1",
        "vrf_target": "1:1",
        "vtep_source": "lo0.0"
    },
    "has_ae_intf": false,
    "chassis_device_count": "2",
    "vlans": {
        "10": {
            "name": "v10", "rt": "10:10", "vni": "1010",
            "irb": {
                "unit": "10",
                "address": "192.168.10.2/24",
                "virtual_gateway": "192.168.10.1",
                "virtual_gateway_accept_data": true
            }
        },
        "20": {
            "name": "v20", "rt": "20:20", "vni": "1020",
            "irb": {
                "unit": "20",
                "address": "192.168.20.2/24",
                "virtual_gateway": "192.168.20.1",
                "virtual_gateway_accept_data": true
            }
        }
    }
}
