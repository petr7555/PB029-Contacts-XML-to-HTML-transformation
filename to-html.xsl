<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:template match="/contacts">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <title>Contacts</title>
                <meta name="description" content="A list of contacts." />
                <link rel="stylesheet" href="styles.css" />
                <script src="https://kit.fontawesome.com/f0323afdc1.js" />
            </head>
            <body>
                <div class="container">
                    <header>
                        <h1>Contacts</h1>
                        <hr />
                    </header>
                    <div id="contacts">
                        <xsl:apply-templates select="*">
                            <xsl:sort select="concat(lastname,firstname)" order="ascending" />
                        </xsl:apply-templates>
                    </div>
                </div>
                <script src="main.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="contact">
        <div class="contact">
            <div class="vertical">
                <div class="horizontal">
                    <xsl:choose>
                        <xsl:when test="image-url">
                            <div class="contact-image">
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="image-url/text()" />
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        image of
                                        <xsl:value-of select="firstname/text()" />
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="lastname/text()" />
                                    </xsl:attribute>
                                </img>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <div class="image-placeholder">
                                <i class="fas fa-user-circle" />
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>
                    <div class="name">
                        <xsl:value-of select="lastname/text()" />, <xsl:value-of select="firstname/text()" />
                    </div>
                    <i class="fas fa-caret-down caret-icon" />
                </div>
                <xsl:apply-templates select="contact-details"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="contact-details">
    	<div class="contact-details">
    		<xsl:apply-templates select="phone-numbers"/>
    		<xsl:apply-templates select="emails"/>
    		<xsl:apply-templates select="links"/>
    		<xsl:apply-templates select="others"/>
    		<xsl:apply-templates select="addresses"/>
            <xsl:apply-templates select="notes"/>
        </div>
	</xsl:template>
	
	<xsl:template match="phone-numbers">
		<div class="phone-numbers">
            <div class="contact-icon">
                <i class="fas fa-phone" />
            </div>
            <div>
                <xsl:apply-templates select="phone-number"/>
            </div>
        </div>
        <hr />
	</xsl:template>
	
	<xsl:template match="phone-number">
        <div class="contact-item">
            <div class="phone-number"><xsl:value-of select="text()"/></div>
            <div class="purpose"><xsl:value-of select="@purpose"/></div>
        </div>
	</xsl:template>

   	<xsl:template match="emails">
        <div class="emails">
            <div class="contact-icon">
                <i class="fas fa-at" />
            </div>
            <div>
                <xsl:apply-templates select="email"/>
            </div>
        </div>
        <hr />
	</xsl:template>
	
	<xsl:template match="email">
        <div class="contact-item">
            <a class="value">
            	<xsl:attribute name="href">mailto:<xsl:value-of select="text()"/></xsl:attribute>
            	<xsl:value-of select="text()"/>
        	</a>
            <div class="purpose"><xsl:value-of select="@purpose"/></div>
        </div>
	</xsl:template>
	
   	<xsl:template match="links">
        <div class="links">
            <div class="contact-icon">
                <i class="fas fa-globe" />
            </div>
            <div>
            	<xsl:apply-templates select="link"/>
            </div>
        </div>
        <hr />
	</xsl:template>
	
	<xsl:template match="link">
        <div class="contact-item">
            <a class="value">
            	<xsl:attribute name="href"><xsl:value-of select="text()"/></xsl:attribute>
            	<xsl:value-of select="text()"/>
        	</a>
            <div class="purpose"><xsl:value-of select="@purpose"/></div>
        </div>
	</xsl:template>
	
   	<xsl:template match="others">
		<div class="others">
            <div class="contact-icon">
                <i class="fas fa-hashtag" />
            </div>
            <div>
            	<xsl:apply-templates select="other"/>
            </div>
        </div>
        <hr />
	</xsl:template>
	
	<xsl:template match="other">
        <div class="contact-item">
            <div><xsl:value-of select="name"/></div>
            <div class="id"><xsl:value-of select="id"/></div>
        </div>
	</xsl:template>
	
   	<xsl:template match="addresses">
		<div class="addresses">
            <div class="contact-icon">
                <i class="fas fa-home" />
            </div>
            <div>
            	<xsl:apply-templates select="address"/>
            </div>
        </div>
        <hr />
	</xsl:template>
	
	<xsl:template match="address">
		<div class="contact-item">
            <div>
                <span class="street"><xsl:value-of select="street"/></span>
				<xsl:text> </xsl:text> 
				<span class="house-number"><xsl:value-of select="house-number"/></span>
            </div>
            <div>
                <span class="city"><xsl:value-of select="city"/></span>, <span class="postcode"><xsl:value-of select="postcode"/></span>
            </div>
        </div>
	</xsl:template>
	
   	<xsl:template match="notes">
		<div class="notes">
            <div class="contact-icon">
                <i class="fas fa-pencil-alt" />
            </div>
            <div>
            	<xsl:apply-templates select="note"/>
            </div>
        </div>
	</xsl:template>
	
	<xsl:template match="note">
		<div class="contact-item">
            <p><xsl:value-of select="text()"/></p>
        </div>
	</xsl:template>
	
</xsl:stylesheet>