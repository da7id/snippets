#!/bin/bash
for i in `seq -f "%03g" 001 105`;
do
	configpath=SKU$i/wp-config.php #sets config path for current iteration
	dbname=$(grep DB SKU${i}/wp-config.php | awk -F \' 'NR==1{ print $4 }');#no pattern to db naming convention, so execute check on wp-config file to get dbname for current iteration
	oldsite=$(mysql ${dbname} -BNe "select * from wp_options where option_name = 'home'" | awk '{print $3}') #also no rhyme or reason to the old site URL naming, so we have to SQL query to get it
	newsite=http://sku$i.hostgatordesign.com #this was nice and easy since the naming makes sense
	srdbsvar="srdbs --config='${configpath}' --search='${oldsite}' --replace='${newsite}'" #execution string for search and replace with the info needed
	eval $srdbsvar# execute it	
done    
