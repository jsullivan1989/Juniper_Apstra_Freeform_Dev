# Juniper_Apstra_Freeform_Dev
 

 
This is an ongoing repository of custom scripts and templates used for various Freeform Apstra templates for Juniper datacenters. 
 
## What's in here
 
- **JSON property sets**: per-device data 
- **Jinja templates**: builds the config by referencing property set data
- **Terraform**: Used to provision racks, resources, blueprints, VNIs, IP Pools, templates, logical-devices, and Interface Maps
- **GraphQL**: Infrastructure relationship based querying within Apstra
- **gNMIc**: Collects streaming telemetry from Spine/Leaf EVPN / VXLAN environments
- **Prometheus**: Stores data as time series and answers queries
- **Grafana**: Display layer.  Does not store anything, just asks Prometheus for data and draws it as dashboards, tables, gauges, and graphs.

## The lab
 
Lab requirements:
 
- containerlab with vJunos-switch (23.4R2-S2.1)
- Apstra 5.1 with offbox agents, running as its own VM
- admin credentials are just the containerlab defaults

 

 
![](images/floating-island.png)
 

