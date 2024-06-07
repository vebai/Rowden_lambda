import boto3
import os
import logging
from botocore.exceptions import ClientError, BotoCoreError

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

def stop_instances():
    try:
        # Initialize EC2 client
        ec2 = boto3.client('ec2', region_name=aws_region)
        
        # Define filters for the instances
        filters = [{
            'Name': 'tag:Name',
            'Values': [f'*{string_tag}*']
        }]

        # Describe instances with the given filters
        response = ec2.describe_instances(Filters=filters)
        print(response)
        
        logger.info("Describe instances response: %s", response)
        
        instances_to_stop = []

        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                if instance['State']['Name'] == 'running':
                    instances_to_stop.append(instance['InstanceId'])

        if instances_to_stop:
            logger.info(f'Stopping instances: {instances_to_stop}')
            ec2.stop_instances(InstanceIds=instances_to_stop)
        else:
            logger.info('No instances to stop')

    except ClientError as e:
        logger.error(f"ClientError: {e}")
        raise
    except BotoCoreError as e:
        logger.error(f"BotoCoreError: {e}")
        raise
    except Exception as e:
        logger.error(f"An unexpected error occurred: {e}")
        raise

def lambda_handler(event, context):
	aws_region = os.environ.get("aws_region")
        string_tag = os.environ.get("string_tag")
	stop_instances()
