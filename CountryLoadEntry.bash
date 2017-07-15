#!/bin/bash

#************************************************#
#          CountryLoadEntry.bash                 #
# written by Alexander Klishevskiy, July 5, 2017 #
#                                                #
#************************************************#

#declare script parameters
#SOURCEFILE="/home/cloudera/country_code_google.csv"
MAINSCRIPT="/home/cloudera/CountryLoadMain.bash"
HQLSCRIPT="/home/cloudera/LZ_COUNTRY_CODE_GOOGLE.hql"
OUTPUTFILE="/home/cloudera/LZ_CCG_EXTRACT.txt"
TABLENAME="LZ_COUNTRY_CODE_GOOGLE"
LOGFILE="/home/cloudera/CountryLoad.log"

#get current timestamp
get_ts ()
{
date +"%T"
}

#write to log
write_log () 
{
res=$(get_ts)' : '$1 
echo $res >> $2
echo $res
}

#read source file path from the command line argument
SOURCEFILE=$1
#echo $SOURCEFILE

#check if required argument is missed
if [ -z "${SOURCEFILE}" ] 
then
write_log 'Please specify script argument' $LOGFILE
write_log 'Sample: bash ./CountryLoadEntry.bash /home/cloudera/country_code_google.csv' $LOGFILE
else
if [ -f "${SOURCEFILE}" ]
then
write_log 'Start of CountryLoadMain.bash' $LOGFILE
#run main script
source $MAINSCRIPT
write_log 'End of CountryLoadMain.bash' $LOGFILE
else
write_log 'The argument is not valid or file does not exists in your file system.' $LOGFILE
fi
fi





