#!/bin/bash

schema=schema.xsd
transformation=to-html.xsl

valid_files=( valid-empty valid-full-record valid-real-world-records )
for file in "${valid_files[@]}"
do
	echo "-----------------------${file}-----------------------"
	file_xml=${file}.xml
	file_html=${file}.html
	
	if xmllint --noout --schema $schema $file_xml; then
		echo "Success: ${file_xml} is valid and will be transformed to HTML."
		
		if xsltproc --output $file_html $transformation $file_xml; then
			echo "Success: ${file_xml} was successfully transformed to ${file_html}."
			
			if tidy -indent --indent-spaces 4 -quiet -modify -wrap 160 -ashtml -utf8 --drop-empty-elements no $file_html; then
			 	echo "Success: ${file_html} was successfully formatted."
			else
		    	echo "Error: ${file_html} was NOT successfully formatted."
		    fi  	
		    
		else
		    echo "Error: ${file_xml} was NOT successfully transformed to ${file_html}."
		fi
		
	else
		echo "Error: ${file_xml} is NOT valid and will NOT be transformed to HTML."
	fi
	echo
done
