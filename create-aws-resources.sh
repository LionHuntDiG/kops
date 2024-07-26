#!/bin/bash

# Create S3 Bucket to store Kops State

aws s3api create-bucket --bucket kops-s3-bucket-2024  --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

# install KOPS

curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops


# Create KOPS Cluster with 1 control plane with t3.medium and 5 worker nodes with t2.small

kops create cluster \
--name shan.kops-2024.io \
--zones us-west-2a \
--state s3://kops-s3-bucket-2024 \
--node-count 5 \
--master-size t3.medium \
-node-size t2.small \
--yes

