echo "1. How many total login attempts were made in this log?"
cat login.log | wc -l
echo

echo "2. How many unique usernames appear in this log?"
cat login.log | cut -f 3 | sort | uniq | wc -l
echo

echo "3. What is the username with the most login attempts?"
cat login.log | cut -f 3 | sort | uniq -c |sort -n
echo

echo "4. How many attempts were made for the username with the most login attempts?"
cat login.log | cut -f 3 | sort | uniq -c |sort -n
echo

echo "5. What is the date with the most login attempts?"
cat login.log | cut -f 1 | cut -d " " -f 1 | sort | uniq -c | sort -n
echo

echo "6. What is the username that had logins from the most unique IP addresses?"
cat login.log | cut -f 2,3 | sort | uniq | cut -f 2 | sort | uniq -c | sort -n
echo

