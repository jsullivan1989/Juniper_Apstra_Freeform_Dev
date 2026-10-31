{
    "bgp": {
        "as_number": "65004",
        "neighbors": {
            "192.0.2.12": {
                "loopback": "192.168.1.101",
                "remote_as": "65101"
            },
            "192.0.2.14": {
                "loopback": "192.168.1.102",
                "remote_as": "65102"
            }
        },
        "router_id": "192.168.1.4"
    },
    "crb_enabled": false,
    "hostname": "leaf-4",
    "interfaces": {
        "ge-0/0/0": {
            "address": "192.0.2.13/31",
            "irb": "no",
            "l3": "yes"
        },
        "ge-0/0/1": {
            "address": "192.0.2.15/31",
            "irb": "no",
            "l3": "yes"
        },
        "ge-0/0/2": {
            "ethernet_switching": {
                "mode": "access",
                "vlan": "v20"
            },
            "irb": "no",
            "l3": "no"
        },
        "lo0": {
            "address": "192.168.1.4/32",
            "irb": "no",
            "l3": "yes"
        }
    },
    "location": "Sullivan_Labs",
    "role": "leaf",
    "switch_options": {
        "rd": "192.168.1.4:1",
        "vrf_target": "1:1",
        "vtep_source": "lo0.0"
    },
    "has_ae_intf": false,
    "chassis_device_count": "2",
    "vlans": {
        "20": {
            "interfaces": [
                "ge-0/0/2"
            ],
            "name": "v20",
            "rt": "20:20",
            "vni": "1020"
        }
    }
}
