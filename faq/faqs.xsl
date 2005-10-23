<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	version="1.0">

<xsl:param name="version" select="'dinamica'"/>

<xsl:template match="/">
<html>
  <head>
    <title>ChatZilla FAQ</title>
    <link rel="stylesheet" title="non-dynamic"
          href="../default.css" type="text/css"/>
    <script src="../site.js"></script>
  </head>

  <body>
    <a name="top"></a>
    <script>writeHeader();</script>

    <div id="faq-index">
      <xsl:apply-templates mode="index"/>
    </div>

    <div id="faq-body">
      <xsl:apply-templates/>
    </div>

    <script>writeFooter();</script>

  </body>
</html>
</xsl:template>

<xsl:template match="section">
	<h3 class="faq-section">
		<xsl:choose>
			<xsl:when test="@id">
				<a name="{@id}"></a>
				<xsl:number/>. <xsl:apply-templates select="title"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:number/>. <xsl:apply-templates select="title"/>
			</xsl:otherwise>
		</xsl:choose>
	</h3>
	<xsl:apply-templates select="node()[local-name()!='entry' and local-name()!='title']"/>
	<dl class="faqs">
		<xsl:apply-templates select="entry"/>
	</dl>
</xsl:template>

<xsl:template name="get-entry-number">
<!--	<xsl:number level="multiple" format="1.1" count="section|entry"/> -->
	<xsl:number count="section"/>.<xsl:number count="entry"/>
</xsl:template>

<xsl:template name="get-entry-name">
	<xsl:choose>
		<xsl:when test="@id">
			<xsl:value-of select="@id"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="get-entry-number"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="entry">
	<dt class="question">
		<xsl:attribute name="id">
			<xsl:text>question-</xsl:text>
			<xsl:call-template name="get-entry-name"/>
		</xsl:attribute>
		<a>
			<xsl:attribute name="name">
				<xsl:call-template name="get-entry-name"/>
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:text>#</xsl:text>
				<xsl:call-template name="get-entry-name"/>
			</xsl:attribute>
			<xsl:call-template name="get-entry-number"/> <xsl:apply-templates select="question"/>
		</a>
	</dt>
	<dd class="answer">
		<xsl:attribute name="id">
			<xsl:text>answer-</xsl:text>
			<xsl:call-template name="get-entry-name"/>
		</xsl:attribute>
		<xsl:apply-templates select="answer"/>
		<p class="back"><a href="#top">Back to the top</a></p>
	</dd>
</xsl:template>

<xsl:template match="p/ul | p/screen | p/p | ol/*[local-name()!='li'] | ul/*[local-name()!='li'] ">
	<xsl:message terminate="yes">
		<xsl:text>The </xsl:text>
		<xsl:value-of select="local-name()"/>
		<xsl:text> element can't go inside </xsl:text>
		<xsl:value-of select="local-name(..)"/>
		<xsl:text> element!</xsl:text>
	</xsl:message>
</xsl:template>

<xsl:template match="a">
	<xsl:element name="{local-name(.)}">
		<xsl:for-each select="@*">
			<xsl:copy/>
		</xsl:for-each>
		<xsl:if test="contains(@href,'.xpi')">
			<xsl:attribute name="onclick">
				<xsl:text>installXPI(this,'</xsl:text>
				<xsl:choose>
					<xsl:when test="@title">
						<xsl:value-of select="normalize-space(@title)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(.)"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>');return false</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates select="node()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="tip|note|warning">
	<xsl:element name="p">
		<xsl:attribute name="class">
			<xsl:value-of select="local-name(.)"/>
		</xsl:attribute>
		<xsl:element name="strong">
			<xsl:if test="local-name(.)='tip'">
				<xsl:text>Tip: </xsl:text>
			</xsl:if>
			<xsl:if test="local-name(.)='note'">
				<xsl:text>Note: </xsl:text>
			</xsl:if>
			<xsl:if test="local-name(.)='warning'">
				<xsl:text>Warning: </xsl:text>
			</xsl:if>
		</xsl:element>
		<xsl:for-each select="@*">
			<xsl:copy/>
		</xsl:for-each>
		<xsl:apply-templates select="node()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="menu">
	<xsl:element name="b">
		<xsl:for-each select="@*">
			<xsl:copy/>
		</xsl:for-each>
		<xsl:apply-templates select="node()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="submenu">
	<xsl:text> &gt; </xsl:text>
</xsl:template>

<xsl:template match="p|ul|li|ol|b|i|tt|blockquote|strong|em|dfn|cite|abbr|kbd|dl|dd|dt|span|pre|br|img|table|tr|td|th|div|code">
	<xsl:element name="{local-name(.)}">
		<xsl:for-each select="@*">
			<xsl:copy/>
		</xsl:for-each>
		<xsl:apply-templates select="node()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="bug">
	<xsl:variable name="bug" select="string(.)"/>
	<a title="{document(concat('getbug.cgi/',$bug))/bug/title}"
			href="{concat('http://bugzilla.mozilla.org/show_bug.cgi?id=',$bug)}">
		<xsl:text>Bug #</xsl:text>
		<xsl:value-of select="$bug"/>
	</a>
</xsl:template>

<xsl:template match="input">
	<div class="input-header">Input</div>
	<div class="input"><xsl:apply-templates/></div>
</xsl:template>

<xsl:template match="output">
	<div class="output-header">Output</div>
	<div class="output"><xsl:apply-templates/></div>
</xsl:template>

<xsl:template match="fixme">
	<span class="fixme"><xsl:apply-templates/></span>
</xsl:template>

<xsl:template match="screen">
	<pre class="screen"><xsl:apply-templates/></pre>
</xsl:template>


<!-- index generation -->

<xsl:template match="section" mode="index">
	<h3><xsl:number/>. <xsl:apply-templates select="title"/></h3>
	<ul>
		<xsl:apply-templates mode="index" select="entry"/>
	</ul>
</xsl:template>

<xsl:template match="entry" mode="index">
	<li>
		<a>
		<xsl:attribute name="href">
			<xsl:text>#</xsl:text>
			<xsl:call-template name="get-entry-name"/>
		</xsl:attribute>
		<xsl:call-template name="get-entry-number"/> <xsl:apply-templates select="question" mode="index"/>
		</a>
	</li>
</xsl:template>


<!--
<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	/> 
-->

<xsl:output method="html"
	doctype-public="-//W3C//DTD HTML 4.01//EN"
	doctype-system="http://www.w3.org/TR/html4/strict.dtd"
	encoding="ISO-8859-1"
	/> 

</xsl:stylesheet>
