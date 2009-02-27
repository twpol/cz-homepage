<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		version="1.0">
	
	<xsl:param name="version" select="'dinamica'"/>
	
	<xsl:output method="html"
			doctype-public="-//W3C//DTD HTML 4.01//EN"
			doctype-system="http://www.w3.org/TR/html4/strict.dtd"
      omit-xml-declaration="yes"
			encoding="UTF-8"/>
	
	<xsl:strip-space elements="*"/>
	
	<!-- Root document content -->
	<xsl:template match="/">
<html>
<xsl:text>&#10;</xsl:text>
<head>
<xsl:text>&#10;	</xsl:text>
	<title>ChatZilla FAQ</title>
  <xsl:text>&#10;	</xsl:text>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <xsl:text>&#10;	</xsl:text>
  <link rel="icon" type="image/png" href="../favicon.png"></link>
  <xsl:text>&#10;	</xsl:text>
  <link rel="stylesheet" type="text/css" href="../common/style/core.css"></link>
  <xsl:text>&#10;	</xsl:text>
  <link rel="stylesheet" type="text/css" href="../common/style/site.css"></link>
	<xsl:text>&#10;	</xsl:text>
	<link rel="stylesheet" type="text/css" href="../common/style/faq.css"></link>
	<!--<xsl:text>&#10;	</xsl:text>-->
	<!--<meta http-equiv="refresh" content="15"></meta>-->
	<xsl:text>&#10;	</xsl:text>
	<script type="text/javascript" src="../common/script/site.js">//</script>
	<xsl:text>&#10;</xsl:text>
</head>
<xsl:text>&#10;</xsl:text>
<body>
<xsl:text>&#10;	</xsl:text>
	<a name="top"></a>
	<xsl:text>&#10;	</xsl:text>
	<div id="header">
		<xsl:text>&#10;		</xsl:text>
    <script type="text/javascript">writeHeader();</script>
		<xsl:text>&#10;	</xsl:text>
	</div>
	<xsl:text>&#10;	</xsl:text>
	<div id="content">
		<xsl:text>&#10;		</xsl:text>
		<div class="contents-list">
			<xsl:text>&#10;			</xsl:text>
			<xsl:comment> Contents list </xsl:comment>
			<xsl:apply-templates mode="index"/>
			<xsl:text>&#10;		</xsl:text>
		</div>
		<xsl:text>&#10;		</xsl:text>
		<xsl:text>&#10;		</xsl:text>
		<xsl:comment> Main content </xsl:comment>
		<xsl:apply-templates/>
		<xsl:text>&#10;	</xsl:text>
	</div>
	<xsl:text>&#10;	</xsl:text>
	<div id="footer">
		<xsl:text>&#10;		</xsl:text>
    <script type="text/javascript">writeFooter();</script>
		<xsl:text>&#10;	</xsl:text>
	</div>
	<xsl:text>&#10;</xsl:text>
</body>
<xsl:text>&#10;</xsl:text>
</html>
	</xsl:template>
	
	<!-- Index generation: sections -->
	<xsl:template match="section" mode="index">
		<xsl:text>&#10;			</xsl:text>
		<h3><a>
			<xsl:attribute name="href">
				<xsl:text>#</xsl:text>
				<xsl:call-template name="get-section-name"/>
			</xsl:attribute>
			<xsl:number/>. <xsl:apply-templates select="title" mode="index"/>
		</a></h3>
		<xsl:text>&#10;			</xsl:text>
		<ul>
			<xsl:apply-templates select="entry" mode="index"/>
			<xsl:text>&#10;			</xsl:text>
		</ul>
	</xsl:template>
	
	<!-- index generation: entries -->
	<xsl:template match="entry" mode="index">
		<xsl:text>&#10;				</xsl:text>
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:text>#</xsl:text>
					<xsl:call-template name="get-entry-name"/>
				</xsl:attribute>
				<xsl:call-template name="get-entry-number"/>
				<xsl:text>. </xsl:text>
				<xsl:apply-templates select="question" mode="index"/>
			</a>
		</li>
	</xsl:template>
	
	<!-- Main content generation -->
	
	<!-- FAQ section heading -->
	<xsl:template match="section">
		<xsl:text>&#10;		</xsl:text>
		<h3 class="faq-section">
			<a>
				<xsl:attribute name="name">
					<xsl:text>section</xsl:text>
					<xsl:number/>
				</xsl:attribute>
			</a>
			<xsl:if test="@id">
				<a name="section_{@id}"></a>
			</xsl:if>
			<xsl:number/>. <xsl:apply-templates select="title"/>
		</h3>
		<xsl:apply-templates select="node()[local-name()!='entry' and local-name()!='title']"/>
		<xsl:text>&#10;		</xsl:text>
		<dl class="faq-entry">
			<xsl:apply-templates select="entry"/>
			<xsl:text>&#10;		</xsl:text>
		</dl>
	</xsl:template>
	
	<!-- FAQ entry -->
	<xsl:template match="entry">
		<xsl:apply-templates select="question|answer">
			<xsl:with-param name="entry-name">
				<xsl:call-template name="get-entry-name"/>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	
	<!-- Entry question -->
	<xsl:template match="question">
		<xsl:param name="entry-name"/>
		<xsl:text>&#10;			</xsl:text>
		<dt>
			<xsl:text>&#10;				</xsl:text>
			<a>
				<xsl:attribute name="name">
					<xsl:value-of select="$entry-name"/>
				</xsl:attribute>
				<xsl:call-template name="get-entry-number"/>
				<xsl:text>. </xsl:text>
				<xsl:apply-templates/>
			</a>
			<xsl:text>&#10;			</xsl:text>
		</dt>
	</xsl:template>
	
	<!-- Entry answer -->
	<xsl:template match="answer">
		<xsl:text>&#10;			</xsl:text>
		<dd>
			<xsl:apply-templates/>
			<xsl:text>&#10;			</xsl:text>
		</dd>
	</xsl:template>
	
	<!-- Formatting elements -->
	
	<!-- Untouched elements -->
	<xsl:template match="strong|em|ol|ul|li|table|thead|tfoot|tbody|tr|th|td">
		<xsl:call-template name="copy-element"/>
	</xsl:template>
	
	<xsl:template name="copy-element">
		<xsl:element name="{local-name(.)}">
			<xsl:for-each select="@*">
				<xsl:copy/>
			</xsl:for-each>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<!-- Special <br/> handling. -->
	<xsl:template match="br">
		<xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text>
	</xsl:template>
	
	<!-- p gets some formatting done to it -->
	<xsl:template match="p">
		<xsl:text>&#10;		</xsl:text>
		<xsl:call-template name="copy-element"/>
	</xsl:template>
	
	<!-- a with "faq" is a inter-FAQ link -->
	<xsl:template match="a">
		<xsl:choose>
			<xsl:when test="@faq">
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:text>#</xsl:text>
						<xsl:value-of select="@faq"/>
					</xsl:attribute>
					<xsl:apply-templates select="node()"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="copy-element"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- link is a special short-hand for links -->
	<xsl:template match="entry//link">
		<xsl:choose>
			<!-- If this is the first link with this key in this entry... -->
			<!-- (note: the generate-id(...) is needed, as normal equality
			      seems to be broken in XSLT -->
			<xsl:when test="generate-id(ancestor::entry//link[@key=current()/@key][1])=generate-id(current())">
				<xsl:apply-templates select="//links/link[@key=current()/@key]" mode="insert">
					<xsl:with-param name="link-prefix" select="@sprefix"/>
					<xsl:with-param name="link-suffix" select="@suffix"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="//links/link[@key=current()/@key]" mode="insert_other">
					<xsl:with-param name="link-prefix" select="@sprefix"/>
					<xsl:with-param name="link-suffix" select="@suffix"/>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="links/link">
	</xsl:template>
	
	<xsl:template match="links/link" mode="index">
	</xsl:template>
	
	<xsl:template match="links/link" mode="insert">
		<xsl:param name="link-prefix"/>
		<xsl:param name="link-suffix"/>
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
			<xsl:if test="@title">
				<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="$link-prefix">
				<xsl:value-of select="$link-prefix"/>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="$link-suffix">
				<xsl:value-of select="$link-suffix"/>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="links/link" mode="insert_other">
		<xsl:param name="link-prefix"/>
		<xsl:param name="link-suffix"/>
		<xsl:element name="em">
			<xsl:if test="$link-prefix">
				<xsl:value-of select="$link-prefix"/>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="$link-suffix">
				<xsl:value-of select="$link-suffix"/>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	
	<!-- tips, notes and warnings get annotated -->
	<xsl:template match="tip|note|warning">
		<xsl:text>&#10;				</xsl:text>
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:value-of select="local-name(.)"/>
			</xsl:attribute>
			<xsl:element name="img">
				<xsl:attribute name="class">icon</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:text>../common/image/faq-</xsl:text>
					<xsl:value-of select="local-name(.)"/>
					<xsl:text>.png</xsl:text>
				</xsl:attribute>
			</xsl:element>
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
	
	<xsl:template match="file|input|commandline|url">
		<tt>
			<xsl:apply-templates/>
		</tt>
	</xsl:template>
	
	<xsl:template match="command">
		<span class="command">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	
	<xsl:template match="menu">
		<span class="menu">
			<span class="menuitem">
				<xsl:value-of select="@name"/>
			</span>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	
	<xsl:template match="menu/menu">
		<span class="menuarrow"><xsl:text>&#x25BA;</xsl:text></span>
		<span class="menuitem">
			<xsl:value-of select="@name"/>
		</span>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="button">
		<span class="button">
			<xsl:value-of select="@name"/>
		</span>
	</xsl:template>
	
	<xsl:template match="screen">
		<xsl:if test="@label">
			<xsl:text>&#10;				</xsl:text>
			<h4 class="screen-label">
				<xsl:value-of select="@label"/>
			</h4>
		</xsl:if>
		<xsl:text>&#10;				</xsl:text>
		<p class="screen">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match="image">
		<xsl:element name="img">
			<xsl:attribute name="src">
				<xsl:text>../common/image/</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text>.png</xsl:text>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="bug">
	</xsl:template>
	
	<!-- common utilities -->
	
	<xsl:template name="get-section-name">
		<xsl:text>section</xsl:text>
		<xsl:choose>
			<xsl:when test="@id">
				<xsl:text>_</xsl:text>
				<xsl:value-of select="@id"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:number/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="get-entry-number">
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
	
	
<!--
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
	
	
	-->
	<!--
	<xsl:output method="xml"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		/> 
	-->
	
</xsl:stylesheet>
