echo "1. How many different IP addresses reached the server?"
cat nginx.log | cut -d " " -f 1 | sort | uniq | wc -l
echo

echo "2. How many requests yielded a 200 code?"
cat nginx.log | cut -d '"' -f 3 | cut -d ' ' -f 2 | sort | uniq -c | sort -rn
echo

echo "3. How many requests yielded a 400 code?"
cat nginx.log | cut -d '"' -f 3 | cut -d ' ' -f 2 | sort | uniq -c | sort -rn
echo

echo "4. What IP address rang at the doorbell?"
cat nginx.log | grep "bell"
echo

echo "5. What version of the Googlebot visited the website?"
cat nginx.log | grep "Googlebot"
echo

echo "6. Which IP address attempted to exploit the Shellshock vulnerability?"
cat nginx.log | grep '() { :; };'
echo

echo "7. What was the most popular version of Firefox used for browsing the website?"
cat nginx.log | egrep -o "Firefox/.*" | sort | uniq -c
echo

echo "8. What is the most common HTTP method used?"
cat nginx.log | awk -F " " '{print $6}' | sort | uniq -c | sort -rn
echo

echo "9. What is the second most common HTTP method used?"
cat nginx.log | awk -F " " '{print $6}' | sort | uniq -c | sort -rn
echo

echo "10. How many requests were for \x04\x01\x00P\xC6\xCE\x0Eu0\x00?"
cat nginx.log | grep '\\x04\\x01\\x00P\\xC6\\xCE\\x0Eu0\\x00' | wc -l
echo
