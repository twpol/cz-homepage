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
		<p class="syntax"><xsl:if test="../@prototype"><span class="instance">object</span>.</xsl:if><xsl:value-of select="../@name"/><xsl:text>(</xsl:text>
		<xsl:for-each select="argument">
			<span class="argument"><xsl:value-of select="@name"/></span>
			<xsl:if test="position() != last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>);</xsl:text></p>
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
			<!--<span class="line_number"><xsl:value-of select="@number"/></span>-->
			<span class="line_code"><xsl:apply-templates/></span>
		</div>
	</xsl:template>
	
	<xsl:template match="code/*/keyword|code/*/comment|code/*/string|code/*/regexp">
		<span class="{local-name(.)}"><xsl:apply-templates/></span>
	</xsl:template>
	
	<!-- Formatting elements -->
	
	<!-- Untouched elements -->
	<xsl:template match="b|i|u|tt|a">
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
	
</xsl:stylesheet>
