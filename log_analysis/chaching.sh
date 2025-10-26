grep "POST login.aspx" chaching.log | grep "401" | awk '{print $9}'
grep "POST login.aspx" chaching.log | grep "113.208.73.160" | grep "301" | awk '{print $8}'
grep "POST login.aspx" chaching.log | grep "113.208.73.160" | grep "401" | wc -l
grep "POST transfer.aspx" chaching.log | grep "113.208.73.160" | wc -l
grep "POST login.aspx" chaching.log | grep "tj969725" | awk '/301|200/{print $9}'
