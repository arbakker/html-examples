<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.1"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:gmd="http://www.isotc211.org/2005/gmd"
  xmlns:gco="http://www.isotc211.org/2005/gco"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:georss="http://www.georss.org/georss">
  <xsl:output method="text" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:variable name="title">
        <xsl:value-of select="//gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>
    </xsl:variable>
    <xsl:variable name="authors">
        <xsl:for-each select="//gmd:MD_DataIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty[gmd:role/gmd:CI_RoleCode/@codeListValue='principalInvestigator']">
            <xsl:value-of select="concat(gmd:individualName/gco:CharacterString, ', ')"/>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="pubDate" select="//gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:date/gmd:CI_Date[gmd:dateType/gmd:CI_DateTypeCode/@codeListValue='publication']/gmd:date/gco:Date" />
    <xsl:variable name="pubYear">
        <xsl:value-of select="substring-before($pubDate, '-')"/>
    </xsl:variable>
    <xsl:variable name="datasetEdition">
        <xsl:value-of select="//gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:edition/gco:CharacterString"/>
    </xsl:variable>
    <!-- FORMAT: “G.W. Hazeu, M. Vittek, R. Schuiling, J.D. Bulens, M.H. Storm, et al., (2023): Landelijk Grondgebruik Nederland 2018 (LGN2018). Version 1. 4TU.ResearchData. dataset. [https://doi.org/10.4121/8738f896-f49e-4ae7-8671-50ef893a2cee.v1 3]” -->
    <xsl:value-of select="concat($authors, '(', $pubYear,')', ': ', $title, '. Version ', $datasetEdition, '.')"/>
  </xsl:template>
</xsl:stylesheet>
