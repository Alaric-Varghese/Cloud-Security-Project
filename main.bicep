param publicIPAddresses_VPNGW_PIP_name string = 'VPNGW-PIP'
param publicIPAddresses_VPNGW_PIP2_name string = 'VPNGW-PIP2'
param virtualMachines_VM_cloudSecLab_name string = 'VM-cloudSecLab'
param routeTables_RouteTable_Private_name string = 'RouteTable-Private'
param sshPublicKeys_VM_cloudSecLab_key_name string = 'VM-cloudSecLab_key'
param networkSecurityGroups_NSG_Public_name string = 'NSG-Public'
param virtualNetworks_vnet_cloudSecLab_name string = 'vnet-cloudSecLab'
param networkSecurityGroups_NSG_Private_name string = 'NSG-Private'
param virtualNetworkGateways_VPN_Gateway_name string = 'VPN-Gateway'
param publicIPAddresses_VM_cloudSecLab_ip_name string = 'VM-cloudSecLab-ip'
param networkInterfaces_vm_cloudseclab420_z3_name string = 'vm-cloudseclab420_z3'
param networkSecurityGroups_VM_cloudSecLab_nsg_name string = 'VM-cloudSecLab-nsg'

resource sshPublicKeys_VM_cloudSecLab_key_name_resource 'Microsoft.Compute/sshPublicKeys@2024-11-01' = {
  name: sshPublicKeys_VM_cloudSecLab_key_name
  location: 'eastus'
  properties: {
    publicKey: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3Y9ODAR6dQ+dNJtU6ZeevOvrw798+97lReo732VqIc generated-by-azure'
  }
}

resource networkSecurityGroups_NSG_Private_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_NSG_Private_name
  location: 'eastus'
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_NSG_Public_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_NSG_Public_name
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'Allow-SSH-from-my-IP'
        id: networkSecurityGroups_NSG_Public_name_Allow_SSH_from_my_IP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '73.55.239.30'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_VM_cloudSecLab_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_VM_cloudSecLab_nsg_name
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'AllowMyIpAddressCustom8080Inbound'
        id: networkSecurityGroups_VM_cloudSecLab_nsg_name_AllowMyIpAddressCustom8080Inbound.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '73.55.239.30'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource publicIPAddresses_VM_cloudSecLab_ip_name_resource 'Microsoft.Network/publicIPAddresses@2024-05-01' = {
  name: publicIPAddresses_VM_cloudSecLab_ip_name
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '3'
  ]
  properties: {
    ipAddress: '48.217.52.24'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource publicIPAddresses_VPNGW_PIP_name_resource 'Microsoft.Network/publicIPAddresses@2024-05-01' = {
  name: publicIPAddresses_VPNGW_PIP_name
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '74.235.217.152'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource publicIPAddresses_VPNGW_PIP2_name_resource 'Microsoft.Network/publicIPAddresses@2024-05-01' = {
  name: publicIPAddresses_VPNGW_PIP2_name
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '172.174.77.225'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource routeTables_RouteTable_Private_name_resource 'Microsoft.Network/routeTables@2024-05-01' = {
  name: routeTables_RouteTable_Private_name
  location: 'eastus'
  properties: {
    disableBgpRoutePropagation: false
    routes: [
      {
        name: 'Route-Internet'
        id: routeTables_RouteTable_Private_name_Route_Internet.id
        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
    ]
  }
}

resource virtualMachines_VM_cloudSecLab_name_resource 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: virtualMachines_VM_cloudSecLab_name
  location: 'eastus'
  zones: [
    '3'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ls'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_VM_cloudSecLab_name}_OsDisk_1_6ea22b6b13934e669466b7ba70522d29'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_VM_cloudSecLab_name}_OsDisk_1_6ea22b6b13934e669466b7ba70522d29'
          )
        }
        deleteOption: 'Delete'
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_VM_cloudSecLab_name
      adminUsername: 'azureuser'
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/azureuser/.ssh/authorized_keys'
              keyData: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3Y9ODAR6dQ+dNJtU6ZeevOvrw798+97lReo732VqIc generated-by-azure'
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'AutomaticByPlatform'
          automaticByPlatformSettings: {
            rebootSetting: 'IfRequired'
          }
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_vm_cloudseclab420_z3_name_resource.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource networkSecurityGroups_VM_cloudSecLab_nsg_name_AllowMyIpAddressCustom8080Inbound 'Microsoft.Network/networkSecurityGroups/securityRules@2024-05-01' = {
  name: '${networkSecurityGroups_VM_cloudSecLab_nsg_name}/AllowMyIpAddressCustom8080Inbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '73.55.239.30'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_VM_cloudSecLab_nsg_name_resource
  ]
}

resource networkSecurityGroups_NSG_Public_name_Allow_SSH_from_my_IP 'Microsoft.Network/networkSecurityGroups/securityRules@2024-05-01' = {
  name: '${networkSecurityGroups_NSG_Public_name}/Allow-SSH-from-my-IP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '73.55.239.30'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_NSG_Public_name_resource
  ]
}

resource routeTables_RouteTable_Private_name_Route_Internet 'Microsoft.Network/routeTables/routes@2024-05-01' = {
  name: '${routeTables_RouteTable_Private_name}/Route-Internet'
  properties: {
    addressPrefix: '0.0.0.0/0'
    nextHopType: 'Internet'
  }
  dependsOn: [
    routeTables_RouteTable_Private_name_resource
  ]
}

resource virtualNetworks_vnet_cloudSecLab_name_gatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_vnet_cloudSecLab_name}/gatewaySubnet'
  properties: {
    addressPrefix: '10.0.255.0/27'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_cloudSecLab_name_resource
  ]
}

resource virtualNetworks_vnet_cloudSecLab_name_Subnet_Public 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_vnet_cloudSecLab_name}/Subnet-Public'
  properties: {
    addressPrefixes: [
      '10.0.1.0/24'
    ]
    networkSecurityGroup: {
      id: networkSecurityGroups_NSG_Public_name_resource.id
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_cloudSecLab_name_resource
  ]
}

resource networkInterfaces_vm_cloudseclab420_z3_name_resource 'Microsoft.Network/networkInterfaces@2024-05-01' = {
  name: networkInterfaces_vm_cloudseclab420_z3_name
  location: 'eastus'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_vm_cloudseclab420_z3_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.0.1.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_VM_cloudSecLab_ip_name_resource.id
            properties: {
              deleteOption: 'Delete'
            }
          }
          subnet: {
            id: virtualNetworks_vnet_cloudSecLab_name_Subnet_Public.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_VM_cloudSecLab_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource virtualNetworkGateways_VPN_Gateway_name_resource 'Microsoft.Network/virtualNetworkGateways@2024-05-01' = {
  name: virtualNetworkGateways_VPN_Gateway_name
  location: 'eastus'
  properties: {
    enablePrivateIpAddress: false
    ipConfigurations: [
      {
        name: 'default'
        id: '${virtualNetworkGateways_VPN_Gateway_name_resource.id}/ipConfigurations/default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_VPNGW_PIP_name_resource.id
          }
          subnet: {
            id: virtualNetworks_vnet_cloudSecLab_name_gatewaySubnet.id
          }
        }
      }
      {
        name: 'activeActive'
        id: '${virtualNetworkGateways_VPN_Gateway_name_resource.id}/ipConfigurations/activeActive'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_VPNGW_PIP2_name_resource.id
          }
          subnet: {
            id: virtualNetworks_vnet_cloudSecLab_name_gatewaySubnet.id
          }
        }
      }
    ]
    natRules: []
    virtualNetworkGatewayPolicyGroups: []
    enableBgpRouteTranslationForNat: false
    disableIPSecReplayProtection: false
    sku: {
      name: 'VpnGw1'
      tier: 'VpnGw1'
    }
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    enableBgp: false
    activeActive: true
    bgpSettings: {
      asn: 65515
      bgpPeeringAddress: '10.0.255.5,10.0.255.4'
      peerWeight: 0
      bgpPeeringAddresses: [
        {
          ipconfigurationId: '${virtualNetworkGateways_VPN_Gateway_name_resource.id}/ipConfigurations/default'
          customBgpIpAddresses: []
        }
        {
          ipconfigurationId: '${virtualNetworkGateways_VPN_Gateway_name_resource.id}/ipConfigurations/activeActive'
          customBgpIpAddresses: []
        }
      ]
    }
    vpnGatewayGeneration: 'Generation1'
    allowRemoteVnetTraffic: false
    allowVirtualWanTraffic: false
  }
}

resource virtualNetworks_vnet_cloudSecLab_name_resource 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: virtualNetworks_vnet_cloudSecLab_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    encryption: {
      enabled: false
      enforcement: 'AllowUnencrypted'
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'Subnet-Public'
        id: virtualNetworks_vnet_cloudSecLab_name_Subnet_Public.id
        properties: {
          addressPrefixes: [
            '10.0.1.0/24'
          ]
          networkSecurityGroup: {
            id: networkSecurityGroups_NSG_Public_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'Subnet-Private'
        id: virtualNetworks_vnet_cloudSecLab_name_Subnet_Private.id
        properties: {
          addressPrefixes: [
            '10.0.2.0/24'
          ]
          networkSecurityGroup: {
            id: networkSecurityGroups_NSG_Private_name_resource.id
          }
          routeTable: {
            id: routeTables_RouteTable_Private_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'gatewaySubnet'
        id: virtualNetworks_vnet_cloudSecLab_name_gatewaySubnet.id
        properties: {
          addressPrefix: '10.0.255.0/27'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_vnet_cloudSecLab_name_Subnet_Private 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_vnet_cloudSecLab_name}/Subnet-Private'
  properties: {
    addressPrefixes: [
      '10.0.2.0/24'
    ]
    networkSecurityGroup: {
      id: networkSecurityGroups_NSG_Private_name_resource.id
    }
    routeTable: {
      id: routeTables_RouteTable_Private_name_resource.id
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
    defaultOutboundAccess: false
  }
  dependsOn: [
    virtualNetworks_vnet_cloudSecLab_name_resource
  ]
}
