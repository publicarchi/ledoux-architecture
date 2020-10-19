<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output encoding="UTF-8" indent="yes" method="html"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="TEI">
        <html>
            <head>
                <link href="css/edition.css" rel='stylesheet'/>
                <title><xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/></title>
                <script src="https://hypothes.is/embed.js" async="async"></script>
            </head>
            <body>
                <xsl:apply-templates select="text/body"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
        
    </xsl:template>
    
    <xsl:template match="fw[@type='runningHead']"/>
    
    <xsl:template match="fw[@type='pageNum']">
        <span>
           <xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
        
     <xsl:template match="persName | placeName | orgName">
         <span class="{local-name(.)}">
             <xsl:apply-templates/>
         </span>
     </xsl:template> 
    
    <xsl:template match="choice[abbr]">
        <xsl:apply-templates select="expan"/>
    </xsl:template>
    
    <xsl:template match="foreign">
        <emph class="foreign">
            <xsl:apply-templates/>
        </emph>      
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="note">
        <!-- Affiche les notes entre crochets dans le texte -->
        <span class="note"><xsl:text>[</xsl:text><xsl:value-of select="@n"/><xsl:text>. </xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text></span>
    </xsl:template>
    <xsl:template match="note/p">
        <span class="noteContent"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>
