The `treetracker-base-image.json` file will create a snapshot image containing the necessary preinstalled bits for treetracker server systems. 

In order to use, copy the `variables.json.example` file to `variables.json` and add a DigitalOcean API key. Install Packer on your system and run:

packer build -var-file=variables.json treetracker-base-image.json

Packer will create a temporary droplet, run the configuration.sh shell script, perform a snapshot, and destroy the temporary droplet. 

The snapshot once created can be used to create new droplets with a standard configuration.
