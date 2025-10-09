import boto3
import json
import os

def lambda_handler(event, context):
    print("Event received:", json.dumps(event))
    
    client = boto3.client('databrew')
    job_name = "databrew-cleaning-project"  # same as in Terraform

    try:
        response = client.start_job_run(Name=job_name)
        print("Started DataBrew job:", response['RunId'])
    except Exception as e:
        print("Error starting job:", str(e))

    return {"status": "DataBrew job triggered"}
