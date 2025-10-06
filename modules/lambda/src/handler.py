def lambda_handler(event, context):
    print("Lambda triggered by S3 event:", event)
    return {"status": "success"}
