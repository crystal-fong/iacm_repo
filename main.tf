provider "aws" {
  region = "us-west-2" # Specify the region you want to use
}

resource "aws_sqs_queue" "my_queue" {
  name                      = "my-queue"   # Name of the SQS queue
  delay_seconds             = 0            # Delay in seconds for message delivery
  max_message_size          = 262144       # Maximum message size in bytes
  message_retention_seconds = 345600       # Message retention period in seconds (default is 4 days)
  receive_wait_time_seconds = 0            # Wait time for receiving messages
  visibility_timeout_seconds = 30          # Visibility timeout for the queue

  tags = {
    Name = "my-queue"                     # Tags for the SQS queue
  }
}

output "queue_url" {
  value = aws_sqs_queue.my_queue.id        # Output the SQS queue URL
}
