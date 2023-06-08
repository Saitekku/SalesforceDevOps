#!/bin/bash
#Install Salesforce CLI
npm install @salesforce/cli --global

#Install Plugin
echo 'y' | sf plugins install sfdx-git-delta

#Generate Delta
sf sgd source delta --to HEAD --from HEAD^ --output .

#Authenticate to environment
sf org login sfdx-url --sfdx-url-file authFile.json --alias orgAlias

#Run Deployment to authenticated environment
sf project deploy start --manifest package/package.xml --target-org orgAlias -l RunLocalTests --wait 60 --verbose
