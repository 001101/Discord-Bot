#!/bin/bash

if [ -z "$2" ]; then
  echo -e "WARNING!!\nYou need to pass the WEBHOOK_URL environment variable as the second argument to this script.\n" && exit
fi

echo -e "[Webhook]: Sending webhook to Discord...\\n";

echo -e "[Webhook]: Informing Testers...\\n";

WEBHOOK_DATA='{
  "username": "Travis",
  "content": "!notifyt '$1' 499915116826066944 499915455318982657",
  "avatar_url": "https://cdn.discordapp.com/attachments/497572862467768320/500299505875288064/TECH_NEWS_ICON_1080x1080_FINAL.jpg"
}'
# Content: "prefixWithCommand msg groupid chanid

(curl --fail --progress-bar -A "HC-Tester" -H Content-Type:application/json -H X-Author:"Lala Sabathil#7777" -d "$WEBHOOK_DATA" "$2" \
  && echo -e "\\n[Webhook]: Successfully sent the webhook.") || echo -e "\\n[Webhook]: Unable to send webhook."
