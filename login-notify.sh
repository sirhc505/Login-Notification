#!/bin/sh

# Change these two lines:

MY_HOSTNAME=`hostname -s`
SMTP_SERVER="smtp.uconn.edu:587"
# Comment out to not use
START_TLS="-S smtp-use-starttls"

SENDER="noreply-$MY_HOSTNAME@uconn.edu"
RECIPIENT="8603167617@txt.att.net"

if [ "$PAM_TYPE" != "close_session" ]; then
    SUBJECT="$MY_HOSTNAME"
    # Message to send, e.g. the current environment variables.
    MSG="SSH Login: $PAM_USER from $PAM_RHOST"
    echo "$MSG" | mailx -v -r "$SENDER" -s "$SUBJECT" $START_TLS -S smtp="$SMTP_SERVER" "$RECIPIENT"
fi