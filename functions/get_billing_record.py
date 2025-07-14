import json
from azure.cosmos import CosmosClient, exceptions
from azure.storage.blob import BlobServiceClient

# Initialize Cosmos DB
cosmos_client = CosmosClient(endpoint="COSMOS_DB_ENDPOINT", key="COSMOS_DB_KEY")
database = cosmos_client.get_database_client("billing-db")
container = database.get_container_client("billing-records")

# Initialize Blob Storage
blob_service_client = BlobServiceClient.from_connection_string("AZURE_STORAGE_CONNECTION_STRING")
blob_container = blob_service_client.get_container_client("billing-archive")

def get_billing_record(record_id, partition_key):
    try:
        # Try reading from Cosmos DB
        response = container.read_item(item=record_id, partition_key=partition_key)
        return response
    except exceptions.CosmosResourceNotFoundError:
        # Fallback to Blob Storage
        blob_client = blob_container.get_blob_client(f"{record_id}.json")
        blob_data = blob_client.download_blob().readall()
        return json.loads(blob_data)

