# Monit2Twilio

A simple script to send Monit alerts to you via SMS with Twilio.

Monit only sends alert notifications via email out of the box, but also provides [a hook to execute a script](https://mmonit.com/monit/documentation/monit.html#action).  When executing the script, Monit sets a few environment variables about the alert.

This tiny script transforms those variables into a text message and pipes them to Twilio's [twilio-sms](https://www.twilio.com/labs/bash/sms) bash script for delivery.


## Usage

Put your Twilio credentials in [twiliorc](twiliorc) and upload it to the user's home directory (probably `root`, since Monit runs as `root`).

Upload [twilio-sms](twilio-sms.sh) and [monit2twilio](monit2twilio.sh) to `/usr/local/bin` and make them executable (e.g. `0755`).

Then, wire up any Monit alerts that you'd like:

    check file nginx.pid with path /var/run/nginx.pid
      if changed timestamp then exec "/usr/local/bin/monit2twilio" as uid root and gid root

There's also an Ansible playbook if you're so inclined.

Delightful!
