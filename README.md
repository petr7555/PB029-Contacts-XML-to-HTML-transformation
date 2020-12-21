Kontrola, zda je XML dobře utvořený:
```bash
xmllint --noout valid-real-world-records.xml
```

Kontrola, zda je XML validní podle dané definice jazyka:
```bash
xmllint --noout --schema schema.xsd valid-real-world-records.xml
```