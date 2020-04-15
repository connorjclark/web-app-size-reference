#!/bin/sh

# Use resource size instead of transfer size.
sed -i '' 's/transferSize/resourceSize/g' node_modules/lighthouse/lighthouse-core/computed/resource-summary.js

declare -a data=(
                # name url should_use_fresh_profile
                "Discord" "https://discordapp.com/channels/@me" false
                "example.com" "https://www.example.com" true
                "Facebook" "https://www.facebook.com/" false
                "GitHub Dashboard" "https://www.github.com" false
                "GitHub PR Review" "https://github.com/GoogleChrome/lighthouse/pull/10557/files" true
                "GitHub Signup" "https://www.github.com" true
                "Google Calendar" "https://calendar.google.com/calendar/r" false
                "Google Doc" "http://doc.new/" false
                "Google Sheets" "http://sheets.new/" false
                "Google" "https://www.google.com/" true
                "Hackernews" "https://news.ycombinator.com/" true
                "New York Times" "https://www.nytimes.com/" true
                "Reddit Frontpage" "https://www.reddit.com/" true
                "Stack Overflow" "https://stackoverflow.com/q/25176848" true
                "Twitter Dashboard" "https://twitter.com/home" false
                "YouTube" "https://www.youtube.com/watch?v=T6neti7pIFo" true
                )

# Close all Chromes then open debugging chrome with logged in state for the above sites.
# "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9111

for ((i=0; i<${#data[*]}; i=i+3));
do
  name="${data[i]}"
  url="${data[i+1]}"
  should_use_fresh_profile="${data[i+2]}"

  port_arg=""
  if [ "$should_use_fresh_profile" == false ];
  then
    port_arg="--port=9111"
  fi

  size=$(node node_modules/.bin/lighthouse "$url" "$port_arg" --disable-storage-reset --throttling-method provided --emulated-form-factor none --only-audits resource-summary --output json --quiet | jq '.audits["resource-summary"].details.items[] | select(.label == "Script").size')
  echo "$size $url $name"
done | sort -k1 -nr
