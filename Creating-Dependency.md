# Supported region

Currently all the six lambda regions AMI specific dependencies are already present for tensorflow 0.9.0. We need to use the below script only in case of new regions or different version of tensorflow.

# Adding New dependency for different region.

This [link](http://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html) shows the list of AMI used for different regions of AWS LAMBDA. To create deployment packages, we need to create dependency files with the corresponding AMI. Spin up the corresponding AMI and execute the follwing commands to create the deployment package. The script finally boots up a webserver from which you can down the dependency zip file.
 
Create a pull request in [this repository](https://github.com/anandanand84/aws-lambda-tensorflow-dependencies) to add the dependency for different version or region.  

You need to add your application specific file to this folder and zip the files in the folder to create the deployment package.

# Deployment Package dependency creation script

build.sh contains the script. You will need to edit it before running since the version of tensorflow is hardcoded currently

In particular, the TF_BINARY_URL property will need changing for whatever tensorflow version you want to use
