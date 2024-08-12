#!/usr/bin/env python3

import boto3
import json

def get_instances_by_tag(tag_key, tag_value):
    ec2 = boto3.client('ec2')
    response = ec2.describe_instances(
        Filters=[
            {
                'Name': f'tag:{tag_key}',
                'Values': [tag_value]
            },
            {
                'Name': 'instance-state-name',
                'Values': ['running']
            }
        ]
    )
    
    instances = []
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instances.append(instance['PublicIpAddress'])
    return instances

def main():
    web_1_2_ips = get_instances_by_tag('Name', 'web-server-1')
    web_3_4_ips = get_instances_by_tag('Name', 'web-server-3')
    web_5_6_ips = get_instances_by_tag('Name', 'web-server-5')

    inventory = {
        'all': {
            'hosts': web_1_2_ips + web_3_4_ips + web_5_6_ips
        },
        'web_1_2': {
            'hosts': web_1_2_ips
        },
        'web_3_4': {
            'hosts': web_3_4_ips
        },
        'web_5_6': {
            'hosts': web_5_6_ips
        }
    }

    print(json.dumps(inventory, indent=2))

if __name__ == "__main__":
    main()
