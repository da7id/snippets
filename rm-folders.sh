#!/bin/bash
for i in `seq -f "%03g" 001 105`;
do
	rm -r "SKU$i/wp-content" #need to prepare each install to have its specific wp-content uploaded
done    
