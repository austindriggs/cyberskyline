echo "1. What IP address did "ftpuser" first log in from?"
cat vsftpd.log | grep ftpuser
echo

echo "2. What is the first directory that ftpuser created? "
cat vsftpd.log | grep ftpuser | grep -i mkdir | head -n 1
echo

echo "3. What is the last directory that ftpuser created?"
cat vsftpd.log | grep ftpuser | grep -i mkdir | tail -n 1
echo

echo "4. What file extension was the most used by ftpuser?"
cat vsftpd.log | grep ftpuser | grep 'OK UPLOAD' | awk -F ',' '{print $2 }' | awk -F "." '{print $2}' | sort | uniq -c | sort
echo

echo "5. What is the username of the other user in this log?"
cat vsftpd.log | awk '{print $8}' | sort | uniq 
echo

echo "6. What IP address did this other user log in from?"
cat vsftpd.log | grep jimmy
echo

echo "7. How many total bytes did this other user upload?"
cat vsftpd.log | grep jimmy | grep 'OK UPLOAD' | awk -F ',' '{print  $3 }' | awk '{s+=$1} END {print s}'
echo

echo "8. How many total bytes did ftpuser upload?"
cat vsftpd.log | grep ftpuser | grep 'OK UPLOAD' | awk -F ',' '{print  $3 }' | awk '{s+=$1} END {print s}'
echo

echo "9. How many total bytes did ftpuser download?"
cat vsftpd.log | grep ftpuser | grep 'OK DOWNLOAD' | awk -F ',' '{print  $3 }' | awk '{s+=$1} END {print s}'
echo

echo "10. Identify the IP address of the suspicious login (the login with no subsequent activity)"
cat vsftpd.log | grep 'OK LOGIN' | awk -F '"' '{print $2 }' | sort | uniq
echo
