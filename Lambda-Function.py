import json
import boto3

# Initialize AWS clients
s3 = boto3.client('s3')
ses = boto3.client('ses')

# Set your SES sender and recipient email
SENDER_EMAIL = "ahmedhamdi.ah1997@gmail.com" 
RECIPIENT_EMAIL = "ahmedhamdi.ah1997@gmail.com"  

def lambda_handler(event, context):
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']

    # Check if the file is inside 'terraform/dev/'
    environment = "dev" if object_key.startswith("terraform/dev/") else "unknown"

    # Fetch metadata of the file
    response = s3.head_object(Bucket=bucket_name, Key=object_key)
    last_modified = response['LastModified'].strftime("%Y-%m-%d %H:%M:%S")

    # Create the email message
    subject = "Terraform State File Updated!"
    message_body = f"""
    Terraform state file updated!

    📌 Bucket: {bucket_name}
    📂 File: {object_key}
    ⏰ Time: {last_modified}
    🌍 Environment: {environment}
    """

    # Send email via SES
    response = ses.send_email(
        Source=SENDER_EMAIL,
        Destination={"ToAddresses": [RECIPIENT_EMAIL]},
        Message={
            "Subject": {"Data": subject},
            "Body": {"Text": {"Data": message_body}},
        },
    )

    print(f"Email sent! Message ID: {response['MessageId']}")

    return {
        'statusCode': 200,
        'body': json.dumps(f"Email sent! Message ID: {response['MessageId']}")
    }
