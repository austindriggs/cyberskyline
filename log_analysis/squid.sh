echo "1. In what year was this log saved?"
head squid.log
date -d @1286536308.779
echo

echo "2. How many milliseconds did the fastest request take?"
cat squid.log | awk '{print $2}' | sort -n
echo

echo "3. How many milliseconds did the longest request take?"
cat squid.log | awk '{print $2}' | sort -n
echo

echo "4. How many different IP addresses did the proxy service in this log?"
cat squid.log | awk '{print $3}' | sort | uniq | wc -l
echo

echo "5. How many GET requests were made?"
cat squid.log | awk '{print $6}' | sort | uniq -c
echo

echo "6. How many POST requests were made?"
cat squid.log | awk '{print $6}' | sort | uniq -c
echo

echo "7. What company created the antivirus used on the host at 192.168.0.224?"
cat squid.log | grep "192.168.0.224"
echo

echo "8. What URL is used to download an antivirus update?"
echocat squid.log | grep "192.168.0.224"
