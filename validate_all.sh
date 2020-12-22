#!/bin/bash

schema=schema.xsd
transformation=to-html.xsl

valid_files=( valid-empty valid-full-record valid-real-world-records )
errors=0
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
		    	errors=$((errors+1))
		    fi  	
		    
		else
		    echo "Error: ${file_xml} was NOT successfully transformed to ${file_html}."
		    errors=$((errors+1))
		fi
		
	else
		echo "Error: ${file_xml} is NOT valid and will NOT be transformed to HTML."
		errors=$((errors+1))
	fi
	echo
done


invalid_files=( invalid-email-format invalid-phone-number-format invalid-missing-firstname invalid-other-service-name-format 
invalid-other-service-id-format invalid-unknown-field invalid-too-many-occurrences-of-emails invalid-unknown-email-purpose)
for file in "${invalid_files[@]}"
do
	echo "-----------------------${file}-----------------------"
	file_xml=${file}.xml
	
	if xmllint --noout $file_xml; then
		echo "Success: ${file_xml} is well formed."
		
		if xmllint --noout --schema $schema $file_xml; then
			echo "Error: ${file_xml} is valid but it should not be."
			errors=$((errors+1))		    
		else
		    echo "Success: ${file_xml} is invalid as expected."
		fi
		
	else
		echo "Error: ${file_xml} is NOT well formed."
		errors=$((errors+1))
	fi
	echo
done

echo "-----There have been ${errors} errors.-----"