#!/usr/bin/sh

curl -s -u hellwigashton@gmail.com:Ah52865!99 https://mail.google.com/mail/feed/atom | grep fullcount | sed 's/<[^0-9]*>//g'