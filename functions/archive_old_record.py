from azure.storage.blob import BlobServiceClient, ContentSettings
from azure.cosmos import CosmosClient
from datetime import datetime, timedelta, timezone
import json

# Initialize clients (replace with env vars or config in production)
cosmos_client = CosmosClient("COSMOS_DB_ENDPOINT", "COSMOS_DB_KEY")
database = cosmos_client.get_database_client("billing-db")
container = database.get_container_client("billing-records")

blob_service_client = BlobServiceClient.from_connection_string("AZURE_STORAGE_CONNECTION_STRING")
blob_container = blob_service_client.get_container_client("billing-archive")

def archive_old_records():
    cutoff = datetime.now(timezone.utc) - timedelta(days=90)
    query = "SELECT * FROM c WHERE c.created_date < @cutoff"
    items = container.query_items(
        query=query,
        parameters=[{"name": "@cutoff", "value": cutoff.isoformat()}],
        enable_cross_partition_query=True
    )

    for record in items:
        blob_client = blob_container.get_blob_client(f"{record['id']}.json")
        blob_client.upload_blob(
            json.dumps(record),
            overwrite=True,
            content_settings=ContentSettings(
                content_type='application/json',
                cache_control='public, max-age=86400'
            )
        )
        container.delete_item(record['id'], partition_key=record['partition_key'])

