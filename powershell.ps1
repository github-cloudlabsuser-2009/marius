# Import the Azure module
Import-Module Az

# Define parameters
$resourceGroupName = "example-resources"
$location = "eastus"
$storageAccountName = "examplestorageacct"
$sku = "Standard_LRS"
$kind = "StorageV2"
$accessTier = "Hot"

# Login to Azure
Connect-AzAccount

# Create the resource group if it doesn't exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                     -Name $storageAccountName `
                     -Location $location `
                     -SkuName $sku `
                     -Kind $kind `
                     -AccessTier $accessTier