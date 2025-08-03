#!/bin/bash
# watchingyou.sh reports failed logins, use of sudo, warnings and errors, usb and mounts
# we make two log files written by journalctl -f, one with just warnings and errors and the other all entries



# security1.log is entries of all errors and warnings in real-time starting when run
journalctl --priority=3..4 -f >> ~/Homework/security1.log & 


# security2.log is entries with all entries
journalctl -f >> ~/Homework/security2.log & 


# Next we sort and start keeping track of sudo, usb, mount, and falied password attempts
for i in {1..100}; do
  sleep 10  
  grep sudo ~/Homework/security2.log > watchsudo.log &   
  grep usb ~/Homework/security2.log > watchusb.log &   
  grep mount ~/Homework/security2.log > watchmount.log &   
  grep login ~/Homework/security2.log > watchlogin.log & 

  echo "Watchdog guards your pc, it's been $((i*10)) seconds. Press control+C to let him rest."
done
