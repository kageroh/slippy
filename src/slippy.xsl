<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml"
	encoding="utf-8"
	omit-xml-declaration="yes"
	doctype-system="about:legacy-compat"
	indent="yes"
	media-type="application/xhtml+xml" />

  <xsl:variable name="encoding" select="document('')//xsl:output/@encoding" />
  <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
  <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>

  <xsl:strip-space elements="*" />

  <xsl:template match="*">
	<xsl:element name="{ translate( local-name(), $upper, $lower ) }">
	  <xsl:copy-of select="@*" />
	  <xsl:apply-templates />
	</xsl:element>
  </xsl:template>

  <xsl:template match="br | param | hr | input | col | img | area | meta | link">
	<xsl:element name="{ translate(local-name(), $upper, $lower) }">
	  <xsl:copy-of select="@*" />
	</xsl:element>
  </xsl:template>

  <xsl:template match="head">
	<xsl:element name="{ translate(local-name(), $upper, $lower) }">
	  <xsl:copy-of select="@*" />
	  <meta charset="{$encoding}" />
	  <link rel="stylesheet" href="slippy-0.9.0.css" />
	  <link rel="stylesheet" href="slippy-dark.css" />
	  <link rel="stylesheet" href="highlighter/shCore.css" />
	  <link rel="stylesheet" href="highlighter/shThemeEclipse.css" />
	  <script src="jquery-1.4.2.min.js"></script>
	  <script src="jquery.history.js"></script>
	  <script src="slippy-0.9.0.js"></script>
	  <script src="highlighter/shCore.js"></script>
	  <script src="highlighter/shBrushBash.js"></script>
	  <script src="highlighter/shBrushCpp.js"></script>
	  <script src="highlighter/shBrushCSharp.js"></script>
	  <script src="highlighter/shBrushCss.js"></script>
	  <script src="highlighter/shBrushDelphi.js"></script>
	  <script src="highlighter/shBrushDiff.js"></script>
	  <script src="highlighter/shBrushGroovy.js"></script>
	  <script src="highlighter/shBrushJava.js"></script>
	  <script src="highlighter/shBrushJScript.js"></script>
	  <script src="highlighter/shBrushPhp.js"></script>
	  <script src="highlighter/shBrushPlain.js"></script>
	  <script src="highlighter/shBrushPython.js"></script>
	  <script src="highlighter/shBrushRuby.js"></script>
	  <script src="highlighter/shBrushScala.js"></script>
	  <script src="highlighter/shBrushSql.js"></script>
	  <script src="highlighter/shBrushVb.js"></script>
	  <script src="highlighter/shBrushXml.js"></script>
	  <xsl:apply-templates />
	  <script src="run.js"></script>
	</xsl:element>
  </xsl:template>

</xsl:stylesheet>
