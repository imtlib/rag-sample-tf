import json

from domain.document_structure import DocumentStructure
from domain.obj_opensearch_page import OpenSearchPageObj


def lambda_handler(event, context):
    print(event)

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }