#!/usr/bin/env bash

echo "
    ╔──────────────────────────────╗
    |   ☠ Create by Break_LOck ☠   |
    |           V1.0.2             |
    |         Port Scanner         |
    ╚──────────────────────────────╝
"  
echo "system: " ; cat /etc/*-release | head -n1
echo "User: $USER"
echo ""

echo -e "       https://github.com/Br3akLock ${NC}"

echo -e "   [!] This tool must be run as ROOT [!]${NC}"
echo ""
echo -e              "select an option : "
echo ""
echo -e "       [1] Nmap "
echo -e "       [2] Nikto "
echo -e "       [3] Hydra (SSH) "
echo -e "       [4] Hydra (FTP) "
echo -e "       [5] SqlMap (Avançado) "
echo -e "       [6] SqlMap (Space avançado) "
echo -e "       [99] Exit "
echo ""

read -p "root@$USER~# " vuln

if [[ "$vuln" -eq "1" ]]; then
	echo "Enter the ip you want to scan"
        read -p "IP~# " ip
	nmap -sC -sV -Pn -T4 $ip

elif [[ "$vuln" -eq "2" ]]; then
	echo "Enter the website you want to scan"
        read -p "IP~# " ip
        nikto -h $ip -C all

elif [[ "$vuln" -eq "3" ]]; then
	echo "Type the ip"
        read -p "IP~# "  ip
	echo "Enter user"
        read -p "User~# "  user
	echo "Enter the path to a Wordlist"
        read -p "WordList~# "  word
        hydra -l $user -P $word $ip -t 4 ssh

elif [[ "$vuln" -eq "4" ]]; then
	echo "Type the ip"
        read -p "IP~# "  ip
	echo "Enter user"
        read -p "User~# "  user
	echo "Enter the path to a Wordlist"
        read -p "WordList~# "  word
        hydra -l  $user -P $word ftp://$ip
elif [[ "$vuln" -eq "5" ]]; then
	echo "Enter the website you want to scan"
        read -p "IP~# "  ip
        sqlmap -u $ip --threads 10 --no-cast --risk 3 --level 3 --random-agent --forms --dbs --batch
elif [[ "$vuln" -eq "6" ]]; then
	echo "Enter the website you want to scan"
        read -p "IP~# "  ip
        sqlmap -u $ip --random-agent --skip-waf --batch -v3 --dbms=mysql --test-filter=generic --level 3 --risk 3 --string --tamper=space2comment --dbs
elif [[ "$vuln" -eq "99" ]]; then
	echo "leaving the tool"
else
        echo "Error: Option not found"
fi




