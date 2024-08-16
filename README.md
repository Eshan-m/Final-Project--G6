# Final-Project--G6

# Create the S3 Bucket [Name:group6-acs]
# Open a terminal in the network folder and run the following commands 
#       terraform init
#		terraform validate
#		terraform plan
#		terraform apply
# Open a terminal in the webserver folder and run the following commands
#       ssh-keygen -t rsa  -f web
#       terraform init
#		terraform validate
#		terraform plan
#		terraform apply


# Providing public access to s3 bucket
#
# Navigate to s3 objects
# Click on permissions tab
# Search for 'Block public access (bucket settings)'
# Click on 'Edit'
# Disable 'Block all public access'
# Save changes


# Providing public access to images in s3 bucket
#
# Navigate to s3 objects
# Go to specific image
# Click on permissions tab
# Click on 'Edit'
# Search for 'Everyone (public access)'
# Enable 'Read' access
# Save changes

# Automate Terraform Deployment
#
# Navigate to .github/workflow/deploy.yml
# Create a role in the AWS env which you need to deploy the resources
# Get the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
# Mention the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to automate the deployment
# Generate a Terraform Cloud user API token and store it as a GitHub secret (e.g. TF_API_TOKEN) on this repository




