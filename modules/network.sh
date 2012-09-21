echo ""
$separator
echo -e "\t\tNetwork (listen included)"
$separator
echo -e "Total connections\t: " `netstat -pntu |wc -l`
echo -e "HTTP connections\t: " `netstat -pntu |grep :$httpport |wc -l`
echo -e "MySQL connections\t: " `netstat -pntu |grep :$mysqlport |wc -l`
echo -e "SSH connections\t\t: " `netstat -pntu |grep :$sshport |wc -l`
echo -e "FTP connections\t\t: " `netstat -pntu |grep :$ftpport |wc -l`
echo -e "Bandwidth\t\t:"
echo -e "`$bandwidth`"