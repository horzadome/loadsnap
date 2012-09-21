echo ""
$separator
echo -e "\t\t\t Memory usage (MB)"
$separator
echo -e "`$freemem`"
echo ""
$separator
echo -e "\t\t CPU load ( last 5 intervals )"
$separator
echo -e "`$sarcommand |tail -n 5 `"