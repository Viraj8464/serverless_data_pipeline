import boto3
import os

def lambda_handler(event, context):
    client = boto3.client('databrew')
    job_name = os.environ['JOB_NAME']
    response = client.start_job_run(Name=job_name)
    print(f"Triggered DataBrew job: {job_name}")
    return response
