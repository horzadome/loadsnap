$separator
echo "              Network (approx numbers - output not filtered properly)"
$separator
echo "Total connections : " `netstat -nap |wc -l`
echo "HTTP connections : " `netstat -nap |grep :80 |wc -l`
echo "MySQL connections : " `netstat -nap |grep :3306 |wc -l`
echo -e "Bandwidth :"
$bandwidth