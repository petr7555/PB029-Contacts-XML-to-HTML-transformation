## Second credit document for a PB029 Electronic Document Preparation course at Masaryk University.

To run on Mac:
- ```bash
  brew install tidy-html5
  ```
- Prefer `/user/local/bin/` over `/usr/bin/`, by prepending `PATH` in `~/.bash_profile`
  ```bash
  PATH="/usr/local/bin:$PATH"
  ```

Validate and transform to HTML:
```bash
bash validate_all.sh
```

Check if XML document is well formed:
```bash
xmllint --noout valid-real-world-records.xml
```

Check if XML is valid according to given schema:
```bash
xmllint --noout --schema schema.xsd valid-real-world-records.xml
```

CSS validated by https://jigsaw.w3.org/css-validator/#validate_by_input.
HTML validated by https://validator.w3.org/nu/#textarea.

XML formatted by https://www.freeformatter.com/xml-formatter.html.
HTML formatted by https://www.freeformatter.com/html-formatter.html.

Escape URL links with https://www.freeformatter.com/html-escape.html.
