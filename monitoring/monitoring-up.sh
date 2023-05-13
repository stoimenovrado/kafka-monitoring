#!/bin/bash

echo "* Get the TF ..."
mkdir terraform
cd terraform
cp /vagrant/monitoring/main.tf .

echo "* Start the exporter ..."
terraform init
terraform apply -auto-approve
