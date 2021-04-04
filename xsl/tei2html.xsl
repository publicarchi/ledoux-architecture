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
                <link href="../css/edition.css" rel='stylesheet'/>
                <title><xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/></title>
                <script src="https://hypothes.is/embed.js" async="async"></script>
            </head>
            <body>
                <main>
                    <section>
                        <xsl:apply-templates select="text/front"/>
                    </section>
                    <section>
                        <xsl:apply-templates select="text/body"/>
                    </section>
                </main>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="titlePage">
        <header>
            <xsl:apply-templates/>
        </header>
    </xsl:template>
    
    <xsl:template match="titlePart[1]">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="titlePart">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="epigraph">
        <p class="epigraph"><xsl:apply-templates select="./*/node()"/></p>
    </xsl:template>
    
    <xsl:template match="docAuthor">
        <h2 class="docAuthor"><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="docImprint">
        <h3 class="docImprint"><xsl:value-of select="placeName"/></h3>
        <h3 class="docImprint"><xsl:value-of select="publisher"/></h3>
        <h3 class="docImprint"><xsl:value-of select="docDate"/></h3>
    </xsl:template>
    
    <xsl:template match="div">
        <section>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
        
    </xsl:template>
    
    <xsl:template match="fw[@type='runningHead']"/>
    
    <xsl:template match="fw[@type='pageNum']">
        <span class="pageNum">
            <xsl:apply-templates/>
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
    
    <xsl:template match="foreign | *[@xml:lang='lat']">
        <em class="foreign">
            <xsl:apply-templates/>
        </em>      
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="hi[@rend='superscript']">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>
    
    <xsl:template match="hi[@rend='capital']">
        <span class="capital"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="hi[@rend='italic']">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    
    <xsl:template match="hi[@rend='smallCap']">
        <span class="smallCap"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="soCalled">
        <em class="soCalled"><xsl:apply-templates/></em>
    </xsl:template>
    
    <xsl:template match="note[@type='nota']">
        <div class="nota"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="note">
        <!-- Affiche les notes entre crochets dans le texte -->
        <span class="note">
            <span class="noteLabel">
                <xsl:choose>
                    <xsl:when test="matches(@n, '\d')">
                        <xsl:value-of select="@n"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@n"/><xsl:text>. </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </span>
                <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="note/p">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="note[@type='nota']/label">
        <h6>
            <xsl:apply-templates/>
            <xsl:text>.</xsl:text>
        </h6>
    </xsl:template>
    
    <!-- 
ID Système: /Users/emmanuelchateau/publicarchi/ledouxSources/ledoux1804.tei.xml
Description: emph

ID Système: /Users/emmanuelchateau/publicarchi/ledouxSources/ledoux1804.tei.xml
Description: title

ID Système: /Users/emmanuelchateau/publicarchi/ledouxSources/ledoux1804.tei.xml
Description: hi

ID Système: /Users/emmanuelchateau/publicarchi/ledouxSources/ledoux1804.tei.xml
Description: sic

ID Système: /Users/emmanuelchateau/publicarchi/ledouxSources/ledoux1804.tei.xml
Description: l

ID Système: /Users/emmanuelchateau/publicarchi/ledouxSources/ledoux1804.tei.xml
Description: label

ID Système: /Users/emmanuelchateau/publicarchi/ledouxSources/ledoux1804.tei.xml
Description: space
 -->
    
</xsl:stylesheet>
