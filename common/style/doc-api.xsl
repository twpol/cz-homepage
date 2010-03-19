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
	<xsl:preserve-space elements="line"/>
	
	<!-- Root document content -->
	<xsl:template match="/">
<html>
<xsl:text>&#10;</xsl:text>
<head>
<xsl:text>&#10;	</xsl:text>
	<xsl:choose>
		<xsl:when test="./doc/scope">
			<title><xsl:value-of select="./doc/scope/@name"/> Scope - API - ChatZilla</title>
		</xsl:when>
		<xsl:when test="./doc/prototype">
			<title><xsl:value-of select="./doc/prototype/@name"/> Prototype - API - ChatZilla</title>
		</xsl:when>
		<xsl:when test="./doc/member/@prototype">
			<title><xsl:value-of select="./doc/member/@prototype"/>.<xsl:value-of select="./doc/member/@name"/> Member - API - ChatZilla</title>
		</xsl:when>
		<xsl:when test="./doc/member">
			<title><xsl:value-of select="./doc/member/@name"/> Function - API - ChatZilla</title>
		</xsl:when>
	</xsl:choose>
	<xsl:text>&#10;	</xsl:text>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<xsl:text>&#10;	</xsl:text>
	<link rel="icon" type="image/png" href="../../favicon.png"></link>
	<xsl:text>&#10;	</xsl:text>
	<link rel="stylesheet" type="text/css" href="../../common/style/core.css"></link>
	<xsl:text>&#10;	</xsl:text>
	<link rel="stylesheet" type="text/css" href="../../common/style/site.css"></link>
	<xsl:text>&#10;	</xsl:text>
	<link rel="stylesheet" type="text/css" href="../../common/style/doc.css"></link>
	<!--<xsl:text>&#10;	</xsl:text>-->
	<!--<meta http-equiv="refresh" content="15"></meta>-->
	<xsl:text>&#10;	</xsl:text>
	<script type="text/javascript" src="../../common/script/site.js">//</script>
	<xsl:choose>
		<xsl:when test="./doc/prototype">
			<xsl:text>&#10;	</xsl:text>
			<script type="text/javascript">
				sitePages.push({
					key: "root/developers/api/<xsl:value-of select="./doc/prototype/@name"/>",
					url: "developers/api/<xsl:value-of select="./doc/prototype/@name"/>",
					title: "<xsl:value-of select="./doc/prototype/@name"/>",
					showHeader: 1
				});
			</script>
		</xsl:when>
		<xsl:when test="./doc/member/@prototype">
			<xsl:text>&#10;	</xsl:text>
			<script type="text/javascript">
				sitePages.push({
					key: "root/developers/api/<xsl:value-of select="./doc/member/@prototype"/>",
					url: "developers/api/<xsl:value-of select="./doc/member/@prototype"/>",
					title: "<xsl:value-of select="./doc/member/@prototype"/>",
					showHeader: 1
				});
				sitePages.push({
					key: "root/developers/api/<xsl:value-of select="./doc/member/@prototype"/>/<xsl:value-of select="./doc/member/@name"/>",
					url: "developers/api/<xsl:value-of select="./doc/member/@prototype"/>.<xsl:value-of select="./doc/member/@name"/>",
					title: "<xsl:value-of select="./doc/member/@name"/>",
					showHeader: 1
				});
			</script>
		</xsl:when>
		<xsl:when test="./doc/member">
			<xsl:text>&#10;	</xsl:text>
			<script type="text/javascript">
				sitePages.push({
					key: "root/developers/api/<xsl:value-of select="./doc/member/@name"/>",
					url: "developers/api/<xsl:value-of select="./doc/member/@name"/>",
					title: "<xsl:value-of select="./doc/member/@name"/>",
					showHeader: 1
				});
			</script>
		</xsl:when>
	</xsl:choose>
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
		<xsl:choose>
			<xsl:when test="./doc/scope">
				<h2><xsl:value-of select="./doc/scope/@name"/> Scope</h2>
			</xsl:when>
			<xsl:when test="./doc/prototype">
				<h2><xsl:value-of select="./doc/prototype/@name"/> Prototype</h2>
			</xsl:when>
			<xsl:when test="./doc/member/@prototype">
				<h2><xsl:value-of select="./doc/member/@prototype"/>.<xsl:value-of select="./doc/member/@name"/> Member</h2>
			</xsl:when>
			<xsl:when test="./doc/member">
				<h2><xsl:value-of select="./doc/member/@name"/> Function</h2>
			</xsl:when>
		</xsl:choose>
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
	
	<!-- Document Kinds -->
	
	<!-- Scope documentation -->
	<xsl:template match="/doc/scope">
		<xsl:apply-templates select="prototypes"/>
		<xsl:apply-templates select="members"/>
	</xsl:template>
	
	<!-- Prototype documentation -->
	<xsl:template match="/doc/prototype">
		<xsl:apply-templates select="summary"/>
		<xsl:apply-templates select="syntax"/>
		<xsl:apply-templates select="remarks"/>
		<xsl:apply-templates select="members"/>
		<xsl:apply-templates select="seealso"/>
		<xsl:apply-templates select="code"/>
	</xsl:template>
	
	<!-- Member documentation -->
	<xsl:template match="/doc/member">
		<xsl:apply-templates select="summary"/>
		<xsl:apply-templates select="syntax"/>
		<xsl:apply-templates select="returns"/>
		<xsl:apply-templates select="remarks"/>
		<xsl:apply-templates select="seealso"/>
		<xsl:apply-templates select="code"/>
	</xsl:template>
	
	<!-- Components for each document kind -->
	
	<!-- Prototypes documentation -->
	<xsl:template match="scope/prototypes">
		<xsl:text>&#10;		</xsl:text>
		<h3>Prototypes</h3>
		<xsl:text>&#10;		</xsl:text>
		<table class="prototypes">
			<xsl:text>&#10;			</xsl:text>
			<thead>
				<xsl:text>&#10;				</xsl:text>
				<tr><th>Prototype</th><th>Summary</th></tr>
				<xsl:text>&#10;			</xsl:text>
			</thead>
			<xsl:text>&#10;			</xsl:text>
			<tbody>
				<xsl:for-each select="prototype">
					<tr>
						<td class="prototype"><a href="{@id}"><xsl:value-of select="@name"/></a></td>
						<td class="summary">
							<xsl:if test="@deprecated">
								<span class="summary-flag">Deprecated.</span><xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="@internal">
								<span class="summary-flag">Internal.</span><xsl:text> </xsl:text>
							</xsl:if>
							<xsl:apply-templates/>
						</td>
					</tr>
				</xsl:for-each>
			<xsl:text>&#10;			</xsl:text>
			</tbody>
		<xsl:text>&#10;		</xsl:text>
		</table>
	</xsl:template>
	
	<!-- Functions documentation -->
	<xsl:template match="scope/members">
		<xsl:text>&#10;		</xsl:text>
		<h3>Functions</h3>
		<xsl:text>&#10;		</xsl:text>
		<table class="members">
			<xsl:text>&#10;			</xsl:text>
			<thead>
				<xsl:text>&#10;				</xsl:text>
				<tr><th>Function</th><th>Summary</th></tr>
				<xsl:text>&#10;			</xsl:text>
			</thead>
			<xsl:text>&#10;			</xsl:text>
			<tbody>
				<xsl:for-each select="member">
					<tr>
						<td class="member"><a href="{@id}"><xsl:value-of select="@name"/></a></td>
						<td class="summary">
							<xsl:if test="@deprecated">
								<span class="summary-flag">Deprecated.</span><xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="@internal">
								<span class="summary-flag">Internal.</span><xsl:text> </xsl:text>
							</xsl:if>
							<xsl:apply-templates/>
						</td>
					</tr>
				</xsl:for-each>
			<xsl:text>&#10;			</xsl:text>
			</tbody>
		<xsl:text>&#10;		</xsl:text>
		</table>
	</xsl:template>
	
	<!-- Summary documentation -->
	<xsl:template match="summary">
		<xsl:text>&#10;		</xsl:text>
		<p class="summary">
			<xsl:if test="../@deprecated">
				<span class="summary-flag">Deprecated.</span><xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="../@internal">
				<span class="summary-flag">Internal.</span><xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<!-- Syntax documentation -->
	<xsl:template match="prototype/syntax">
		<xsl:text>&#10;		</xsl:text>
		<h3>Syntax</h3>
		<xsl:text>&#10;		</xsl:text>
		<p class="syntax"><span class="keyword">var</span><xsl:text> </xsl:text><span class="instance">object</span><xsl:text> = </xsl:text><span class="keyword">new</span><xsl:text> </xsl:text><xsl:value-of select="../@name"/><xsl:text>(</xsl:text>
		<xsl:for-each select="argument">
			<span class="argument"><xsl:value-of select="@name"/></span>
			<xsl:if test="position() != last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>);</xsl:text></p>
		<xsl:apply-templates select="." mode="arguments-table"/>
	</xsl:template>
	
	<xsl:template match="member/syntax">
		<xsl:text>&#10;		</xsl:text>
		<h3>Syntax</h3>
		<xsl:text>&#10;		</xsl:text>
		<p class="syntax"><xsl:if test="../@prototype"><span class="instance">object</span><span class="ident">.</span></xsl:if><span class="member"><xsl:value-of select="../@name"/></span><span class="ident">(</span>
		<xsl:for-each select="argument">
			<span class="argument"><xsl:value-of select="@name"/></span>
			<xsl:if test="position() != last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<span class="ident">);</span></p>
		<xsl:apply-templates select="." mode="arguments-table"/>
	</xsl:template>
	
	<xsl:template match="syntax" mode="arguments-table">
		<xsl:if test="argument">
			<xsl:text>&#10;		</xsl:text>
			<h3>Arguments</h3>
			<xsl:text>&#10;		</xsl:text>
			<table class="arguments">
				<xsl:text>&#10;			</xsl:text>
				<thead>
					<xsl:text>&#10;				</xsl:text>
					<tr><th>Argument</th><th>Summary</th></tr>
					<xsl:text>&#10;			</xsl:text>
				</thead>
				<xsl:text>&#10;			</xsl:text>
				<tbody>
					<xsl:for-each select="argument">
						<tr>
							<td class="argument"><xsl:value-of select="@name"/></td>
							<td class="summary">
								<xsl:if test="@deprecated">
									<span class="summary-flag">Deprecated.</span><xsl:text> </xsl:text>
								</xsl:if>
								<xsl:if test="@internal">
									<span class="summary-flag">Internal.</span><xsl:text> </xsl:text>
								</xsl:if>
								<xsl:apply-templates/>
							</td>
						</tr>
					</xsl:for-each>
				<xsl:text>&#10;			</xsl:text>
				</tbody>
			<xsl:text>&#10;		</xsl:text>
			</table>
		</xsl:if>
	</xsl:template>
	
	<!-- Returns documentation -->
	<xsl:template match="member/returns">
		<xsl:text>&#10;		</xsl:text>
		<h3>Returns</h3>
		<xsl:text>&#10;		</xsl:text>
		<p class="returns"><xsl:apply-templates/></p>
	</xsl:template>
	
	<!-- Remarks documentation -->
	<xsl:template match="remarks">
		<xsl:text>&#10;		</xsl:text>
		<h3>Remarks</h3>
		<xsl:for-each select="p">
			<xsl:text>&#10;		</xsl:text>
			<p class="remark"><xsl:apply-templates/></p>
		</xsl:for-each>
	</xsl:template>
	
	<!-- Prototype members documentation -->
	<xsl:template match="prototype/members">
		<xsl:text>&#10;		</xsl:text>
		<h3>Members</h3>
		<xsl:text>&#10;		</xsl:text>
		<table class="members">
			<xsl:text>&#10;			</xsl:text>
			<thead>
				<xsl:text>&#10;				</xsl:text>
				<tr><th>Member</th><th>Summary</th></tr>
				<xsl:text>&#10;			</xsl:text>
			</thead>
			<xsl:text>&#10;			</xsl:text>
			<tbody>
				<xsl:apply-templates/>
			<xsl:text>&#10;			</xsl:text>
			</tbody>
		<xsl:text>&#10;		</xsl:text>
		</table>
	</xsl:template>
	
	<xsl:template match="prototype/members/member">
		<xsl:text>&#10;				</xsl:text>
		<tr>
			<td class="member"><a href="{@id}"><xsl:value-of select="@name"/></a></td>
			<td class="summary">
				<xsl:if test="@deprecated">
					<span class="summary-flag">Deprecated.</span><xsl:text> </xsl:text>
				</xsl:if>
				<xsl:if test="@internal">
					<span class="summary-flag">Internal.</span><xsl:text> </xsl:text>
				</xsl:if>
				<xsl:apply-templates/>
			</td>
		</tr>
	</xsl:template>
	
	<!-- See-also documentation -->
	<xsl:template match="seealso">
		<xsl:text>&#10;		</xsl:text>
		<h3>See Also</h3>
		<xsl:apply-templates/>
	</xsl:template>
	
	<!-- Code documentation -->
	<xsl:template match="code">
		<xsl:text>&#10;		</xsl:text>
		<h3>Source Code</h3>
		<xsl:text>&#10;		</xsl:text>
		<div class="code">
			<xsl:apply-templates/>
			<xsl:text>&#10;		</xsl:text>
		</div>
	</xsl:template>
	
	<xsl:template match="code/line">
		<xsl:text>&#10;			</xsl:text>
		<div class="line">
			<!--<span class="line_number"><xsl:value-of select="@number"/></span>
			<xsl:text> </xsl:text>-->
			<span class="line_code"><xsl:apply-templates/></span>
		</div>
	</xsl:template>
	
	<xsl:template match="code/*/keyword|code/*/comment|code/*/string|code/*/regexp">
		<span class="{local-name(.)}"><xsl:apply-templates/></span>
	</xsl:template>
	
	<!-- Formatting elements -->
	
	<!-- Untouched elements -->
	<xsl:template match="b|i|u|tt">
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
					<xsl:text>../../common/image/doc-</xsl:text>
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
				<xsl:text>../../common/image/</xsl:text>
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
