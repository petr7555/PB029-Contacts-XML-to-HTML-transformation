#!/bin/bash
set -x

xmllint --noout --schema schema.xsd valid-empty.xml
xmllint --noout --schema schema.xsd valid-full-record.xml
xmllint --noout --schema schema.xsd valid-real-world-records.xml



