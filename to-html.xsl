<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/contacts">
	    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	    <html lang="en">
		    <head>
		        <meta charset="utf-8">
		        <title>Contacts</title>
		        <meta name="description" content="A list of contacts."/>
		        <link rel="stylesheet" href="styles.css">
		        <script src="https://kit.fontawesome.com/f0323afdc1.js" crossorigin="anonymous"></script>
		    </head>
            <body>
                
            </body>
            <script src="main.js"></script>
        </html>
	</xsl:template>
	
</xsl:transform>
