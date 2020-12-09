# MAMEVERT

A tool get a list of all vertical games in MAME.

It requires ruby and nokogiri to parse XML so on Ubuntu you might need to go `sudo apt install ruby-nokogiri`


Usage: `mame -listxml | ./mamevert.rb > mamevert.txt`
