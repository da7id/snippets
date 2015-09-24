#!/bin/bash
for i in `seq -f "%03g" 001 105`;
do
	cp SKU100/wp-config.php SKU$i/
done    
