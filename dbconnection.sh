#!/bin/bash
for i in `seq -f "%03g" 001 105`;
do
	dbconnect SKU$i/*.sql SKU$i/wp-config.php
done    
