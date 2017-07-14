
--create LZ_COUNTRY_CODE_GOOGLE table--
---------------------------------------

drop table if exists LZ_COUNTRY_CODE_GOOGLE;

create external table if not exists LZ_COUNTRY_CODE_GOOGLE 
(
Country_code string,
Country_code3 string,
Country_name string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
stored as TextFile
tblproperties ("skip.header.line.count"="1");

load data local inpath 'country_code_google.csv' overwrite into table LZ_COUNTRY_CODE_GOOGLE;

