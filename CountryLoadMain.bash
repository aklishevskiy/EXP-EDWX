#!/bin/bash


#run HQL script to create table in Hadoop and then populate it with the data from local file 
write_log 'Start running HQL script' $LOGFILE
hive -f $HQLSCRIPT >> $LOGFILE;
write_log "hive -f response code: $?" $LOGFILE

#querying the table and extract data in local file.
write_log 'Start querying Hive table' $LOGFILE
hive -S -e 'select * from '$TABLENAME > $OUTPUTFILE;
write_log "hive -S -e response code: $?" $LOGFILE

#querying total rows from Hadoop table
NUMOFROWS=$(hive -S -e 'select count(*) from LZ_COUNTRY_CODE_GOOGLE';)
#remove warning messages from hive response
NUMOFROWS=$(echo $NUMOFROWS| cut -d' ' -f 1)

#querying total rows from source file
NUMOFLINES=$(wc -l < $SOURCEFILE)

write_log "Number of lines in source file: $NUMOFLINES" $LOGFILE
write_log "Number of rows in Hadoop table: $NUMOFROWS" $LOGFILE









