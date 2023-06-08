#!/bin/bash
#Install Salesforce CLI
npm install sfdx-cli@latest --global

#Install Plugin
echo 'y' | sfdx plugins:install sfdx-git-delta

#Generate Delta
sfdx sgd:source:delta --to HEAD --from HEAD^ --output .

#Authenticate to environment
sfdx auth:sfdxurl:store -f authFile.json -a orgAlias

#Run Deployment to authenticated environment
sfdx force:source:deploy -x package/package.xml -u orgAlias -l RunLocalTests --wait 60 --verbose
