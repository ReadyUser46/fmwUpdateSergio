#!/bin/bash
#format terminal
#----------------------------------
green_light='\033[1;32m'
RED='\033[0;31m'
yellow='\033[1;33m'
NC='\033[0m' # No Color
#ght Renaming File...${NC}"printf "I ${RED}love${NC} Stack Overflow\n"
#----------------------------------

echo  -e "$RED *******************************************************************"
echo  -e "*                                                                 *"
echo  -e "*                                                                 *"
echo  -e "*                 @Author: Sergio Caballero                       *"
echo  -e "*                                                                 *"
echo  -e "*                                                                 *"
echo  -e "******************************************************************* ${NC}"


#                       *****************************
#                       *                           *
#                       *          Inputs           *
#                       *                           *
#                       *****************************



echo "Introduce los ultimos digitos de la IP(XXXX): "
read ipDigits
ip="15.83.${ipDigits:0:2}.${ipDigits:2}"
echo "Introduce los ultimos digitos de la release(XX.XX): "
read rlDigits


release="CRLALARS_12_20_$rlDigits"
echo "$release"

cd /drives/c/Users/caballes/Downloads

if [ -f "$release*" ]; then

	mv $release* Firmwares
fi

extension="WL.unsigned.fmw"
#extension="rfu.fmw"


#                       *****************************
#                       *                           *
#                       *         Connection        *
#                       *                           *
#                       *****************************


echo "Transfiriendo release $release.$extension a la printer $ip"
scp /drives/c/users/caballes/Downloads/Firmwares/$release.* root@$ip:/tmp/sergio
echo "archivo transferido $release.$extension"
echo "Instalando release $release.$extension en la printer $ip"
ssh root@$ip "cd /tmp/sergio; pwd; chmod 777 $release.*; echo "$release.sh"; ./$release.sh --full $release.$extension; reboot"
echo "Proceso terminado"


