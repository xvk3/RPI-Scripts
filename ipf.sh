cat /var/log/ufw.log | grep -Eo "SRC=([0-9]{1,3}[\.]){3}[0-9]{1,3}" | awk '{gsub("SRC=", "");print}' | sort | uniq -c | sort -k1,1nr -k2
