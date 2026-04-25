targetScope = 'subscription' // Critical: Tells Azure to look at the Sub level

param location string = 'eastus'
param resourceGroupName string = 'rg-meal-planner'

// 1. Create the Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

// 2. Deploy the Storage into that new group
module storageModule './storage.bicep' = {
  name: 'storageDeployment'
  scope: rg // This tells the module to land inside the RG we just created
  params: {
    location: location
  }
}
