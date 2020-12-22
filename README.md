Kontrola, zda je XML dobře utvořený:
```bash
xmllint --noout valid-real-world-records.xml
```

Kontrola, zda je XML validní podle dané definice jazyka:
```bash
xmllint --noout --schema schema.xsd valid-real-world-records.xml
```

Validate and transform to HTML:
```bash
bash validate_all.sh
```

CSS validated by https://jigsaw.w3.org/css-validator/#validate_by_input.
HTML validated by https://validator.w3.org/nu/#textarea.

XML formatted by https://www.freeformatter.com/xml-formatter.html.
HTML formatted by https://www.freeformatter.com/html-formatter.html.

Escape URL links with https://www.freeformatter.com/html-escape.html.
 