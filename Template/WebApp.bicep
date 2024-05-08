@description('Azure Region')
@allowed(['northeurope'])
param location string

@description('The name of the App Service app.')
param appServiceAppName string

@description('Name of the App Service plan.')
param appServicePlanName string

@description('The name of the App Service plan SKU')
param appServicePlanSKUname string

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
   name: appServicePlanName
   location: location
   sku: {
      name: appServicePlanSKUname
   }
}

resource appServiceApp 'Microsoft.Web/sites@2023-01-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

@description('The default host name of the App Service app')
output appServiceAppHostName string = appServiceApp.properties.defaultHostName

