#!/usr/bin/env python3

import boto3
import json
import sys

def get_instances_by_name_patterns(name_patterns):
    ec2 = boto3.client('ec2')
    filters = [
        {
            'Name': 'instance-state-name',
            'Values': ['running']
        }
    ]
    
    # Build filters for name patterns
    name_filters = [{'Name': 'tag:Name', 'Values': [pattern]} for pattern in name_patterns]
    filters.extend(name_filters)
    
    try:
        response = ec2.describe_instances(Filters=filters)
    except Exception as e:
        print(f"Error fetching instances: {e}", file=sys.stderr)
        sys.exit(1)
        
    instances = []
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            public_ip = instance.get('PublicIpAddress')
            private_ip = instance.get('PrivateIpAddress')
            if public_ip:
                instances.append(public_ip)
            elif private_ip:
                instances.append(private_ip)
    return instances

def main():
    # Define all name patterns to match your instances
    name_patterns = ['*web-server*', '*VM*', '*BASITION*']
    
    instances_ips = get_instances_by_name_patterns(name_patterns)

    inventory = {
        'all': {
            'hosts': instances_ips
        }
    }

    print(json.dumps(inventory, indent=2))

if __name__ == "__main__":
    main()
