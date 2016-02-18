## Google Compute Engine startup scripts

#### Notes:

Ideally these scripts can be added to the metadata (userdata) section of an instance template.

When this template is kicked off by an autoscaling instance group the new instances will execute the metadata section.

No need to use `sudo` in the scripts as metadata section is executed as root user.

All metadata execution logs are stored in `/var/log/startupscript.log`
