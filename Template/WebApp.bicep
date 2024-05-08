@allowed(
  ['northeurope']
)
param location string = 'northeurope'

resource rg 'lab-rg1' = {
  name: 'lab-rg1'
  location: location
}

resource appPlan 'app-plan-lab-rg1' = {
  name: 'app-plan-lab-rg1'
  location: location
  kind: 'app'
  sku: {
    tier: 'Standard'
    size: 'S1'
  }
  dependsOn: [
    rg
  ]
}

resource webApp 'app-lab-rg1' = {
  name: 'app-lab-rg1'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appPlan.id
  }
  dependsOn: [
    appPlan
  ]
}
