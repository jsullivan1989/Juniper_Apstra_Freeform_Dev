{
    "bgp": {
        "as_number": "65003",
        "neighbors": {
            "192.0.2.8": {
                "loopback": "192.168.1.101",
                "remote_as": "65101"
            },
            "192.0.2.10": {
                "loopback": "192.168.1.102",
                "remote_as": "65102"
            }
        },
        "router_id": "192.168.1.3"
    },
    "crb_enabled": false,
    "hostname": "leaf-3",
    "interfaces": {
        "ae1": {
            "esi": {
                "auto_derivce": true,
                "redundancy": "all-active"
            },
            "ethernet_switching": {
                "mode": "access",
                "vlan": "v20"
            },
            "irb": "no",
            "l3": "no",
            "lag": {
                "mode": "active",
                "system_id": "00:00:00:00:22:33",
                "type": "lacp"
            }
        },
        "ge-0/0/0": {
            "address": "192.0.2.9/31",
            "irb": "no",
            "l3": "yes"
        },
        "ge-0/0/1": {
            "address": "192.0.2.11/31",
            "irb": "no",
            "l3": "yes"
        },
        "ge-0/0/2": {
            "ae_member_of": "ae1",
            "irb": "no",
            "l3": "no"
        },
        "lo0": {
            "address": "192.168.1.3/32",
            "irb": "no",
            "l3": "yes"
        }
    },
    "location": "Sullivan_Labs",
    "role": "leaf",
    "switch_options": {
        "rd": "192.168.1.3:1",
        "vrf_target": "1:1",
        "vtep_source": "lo0.0"
    },
    "has_ae_intf": true,
    "chassis_device_count": "2",
    "vlans": {
        "20": {
            "interfaces": [
                "ae1"
            ],
            "name": "v20",
            "rt": "20:20",
            "vni": "1020"
        }
    }
}
