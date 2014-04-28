#!/bin/bash
#
# Monit EXEC handler that sends monit notifications via SMS
#
# Depends on having `twilio-sms` installed and a config file in `/root/.twiliorc`
#
message="Monit: $MONIT_SERVICE - $MONIT_EVENT at $MONIT_DATE on host '$MONIT_HOST': $MONIT_DESCRIPTION."
echo $message | /usr/local/bin/twilio-sms -c /root/.twiliorc {{ monit_twilio_sms }}
