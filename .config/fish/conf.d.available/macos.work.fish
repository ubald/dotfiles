# MacOS for Work configuration

# DOESN'T SEEM TO EXIST source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# At work flag, to control some output
set -gx NSFW 1

rvm default

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ubald/bin/google-cloud-sdk/path.fish.inc' ]; . '/Users/ubald/bin/google-cloud-sdk/path.fish.inc'; end