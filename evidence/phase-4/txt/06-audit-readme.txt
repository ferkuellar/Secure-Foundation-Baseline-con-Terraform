# Audit Module

## Purpose

Provide a minimum viable audit and security posture baseline for an AWS environment.

## Components

- CloudTrail trail for management events
- CloudTrail delivery to S3 and CloudWatch Logs
- AWS Config recorder and delivery channel
- VPC Flow Logs to CloudWatch Logs
- CloudWatch metric filter and alarm for sensitive IAM events

## Design Notes

- CloudTrail management events are enabled.
- Data events are intentionally not included in this baseline.
- AWS Config uses a service-linked role.
- VPC Flow Logs are enabled at VPC scope.
- The alarm is a minimal starter signal, not a complete detection program.

## Outputs

- cloudtrail_bucket_name
- cloudtrail_name
- cloudtrail_log_group_name
- config_bucket_name
- config_recorder_name
- flow_logs_log_group_name
- flow_log_id
- iam_changes_alarm_name
