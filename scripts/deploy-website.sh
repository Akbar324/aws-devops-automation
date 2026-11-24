#!/bin/bash
set -e

WEBSITE=$(base64 -w 0 app/index.html)

COMMAND_ID=$(aws ssm send-command \
  --instance-ids "$INSTANCE_ID" \
  --document-name "AWS-RunShellScript" \
  --parameters "commands=['set -e','echo $WEBSITE | base64 -d > /home/ubuntu/website/index.html','curl -fsS http://localhost:8080/']" \
  --query 'Command.CommandId' \
  --output text)

echo "Deployment command ID: $COMMAND_ID"

aws ssm wait command-executed \
  --command-id "$COMMAND_ID" \
  --instance-id "$INSTANCE_ID"

aws ssm get-command-invocation \
  --command-id "$COMMAND_ID" \
  --instance-id "$INSTANCE_ID" \
  --query '{Status:Status,Output:StandardOutputContent,Error:StandardErrorContent}'

echo "Website deployment completed successfully"