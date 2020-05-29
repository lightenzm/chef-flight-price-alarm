# chef-flight-price-alarm

The repo contains the Chef resources for deploying a 'Flight Price Alarm' application version.

## Deployment steps
With Chef-solo installed, the command 'sudo chef-solo -c ~/path/to/solo.rb -j ~/path/to/runlist.json' will:
* Install AWS-cli 
* Download and exatract the application tar 
* Install Python
* Install the application dependencies
* Run the application
