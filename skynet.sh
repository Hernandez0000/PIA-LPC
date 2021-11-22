#!/bin/bash
#
#Equipos conectados a la red interna
date
echo '- - - - - - - - - - - - - - - - - - - - - - - -'
echo '                Menu Principal'
echo '- - - - - - - - - - - - - - - - - - - - - - - -'
echo '1. Net Discover'
echo '2. Actual User'
echo '3. Hostname'
echo '4. Exit '
read -p "Opcion [1-4]: " Opc
case $Opc in 
	1)
		which ifconfig && { echo "comando ifconfig existe..."
				    direccion_ip=`ifconfig |grep inet |grep -v "127.0.0.1" |awk '{print $2}' |grep -v "fe80" |grep -v "::1"`;
				    echo "Esta es tu direccion ip:" $direccion_ip;
				    subred=`ifconfig |grep inet |grep -v "127.0.0.1" |awk '{print $2}' |grep -v "fe80" |grep -v "::1" |awk -F. '{print $1"."$2"."$3"."}'`;
				    echo "Esta es tu subred: " $subred;
				    }\
				|| { echo "No existe el comando ifconfig...usando ip ";
				    direccion_ip=`ip addr show |grep inet |grep -v "127.0.0.1" |awk '{print $2}'`;
				    echo "Esta es tu direccion ip: " $direccion_ip
				    subred=`ip addr show |grep inet |grep -v "127.0.0.1" |awk '{print $2}'| awk -F. '{print $1"."$2"."$3"."}'`;
				    echo "Esta es tu subred: " $subred
				    }
		for ip in {1..60}
		do
			ping -q -c 4 ${subred}${ip} > /dev/null
			if [ $? -eq 0 ]
			then
				echo "Host responde: " ${subred}${ip}
			fi 
		done
	;;
	2)
		#Escaneo de puertos
		dir_ip=$1
		puertos="20,21,22,23,25,26,50,51,53,80,110,119,135,136,137,138,139,143,161,162,389,443,445,587,636,993,995,1025,1443,2082,2083,2077,2078,2086,2087,2095,2096,2525,3306,3389,5985,5986,8080,10000"
		[ $# -eq 0 ] && { echo "Modo de uso: $0 <direccion ip>"; exit 1; }
		IFS=,
		for port in $puertos
		do
			timeout 1 bash -c "echo > /dev/tcp/$dir_ip/$port > /dev/null 2>&1" &&\
			echo $dir_ip":"$port" is open"\
			||\
			echo $dir_ip":"$port" is closed"
		done
	;;
	3)
		echo "El nombre de su equipo es: "
		hostname
		echo " "
		echo "El nombre del ususario es: "
		whoami
		echo " "
		echo "Su sistema operativo es: "
		lsb_release -d
	;;
	4)
		exit
	;;
	*)
		exit
	;;
esac
