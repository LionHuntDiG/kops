#!/bin/bash

#Create S3 Bucket to store Kops State
aws s3api create-bucket --bucket kops-s3-bucket-2024  --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

# Create KOPS Cluster with 1 control plane with t3.medium and 5 worker nodes with t2.small

kops create cluster \
--name shan.kops-2024.io \
--zones us-west-2a \
--state s3://kops-s3-bucket-2024 \
--node-count 5 \
--master-size t3.medium \
-node-size t2.small \
--yes

