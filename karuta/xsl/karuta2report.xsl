<?xml version="1.0"  encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&amp;#160;">
]>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" />
	<xsl:param name="lang">fr</xsl:param>
	<xsl:template match="/">
		<model>
			<xsl:apply-templates select='//asmRoot/asmUnitStructure'/>
		</model>
	</xsl:template>

	<xsl:template match="*[metadata/@semantictag='model-table']">
		<xsl:variable name="ref-init">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='ref-init']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<table>
			<xsl:if test="not($ref-init='')">
				<xsl:attribute name="ref-init"><xsl:value-of select="$ref-init"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select='asmUnitStructure'/>
		</table>
	</xsl:template>
	<xsl:template match="*[metadata/@semantictag='model-row']">
		<row>
			<xsl:apply-templates select='asmUnitStructure'/>
		</row>
	</xsl:template>
	<xsl:template match="*[metadata/@semantictag='model-cell']">
		<cell>
			<xsl:apply-templates select='asmUnitStructure'/>
		</cell>
	</xsl:template>
	
	<xsl:template match="*[metadata/@semantictag='text']">
		<xsl:variable name="style">
			<xsl:call-template name="style"/>
		</xsl:variable>
		<text>
			<xsl:if test="not($style='..')">
				<xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
			</xsl:if>
			<xsl:value-of select=".//asmContext[metadata/@semantictag='text-value']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</text>
	</xsl:template>

	<xsl:template match="*[metadata/@semantictag='node_resource']">
		<xsl:variable name="style">
			<xsl:call-template name="style"/>
		</xsl:variable>
		<xsl:variable name="ref">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='ref']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="nodetype">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='nodetype']/asmResource[@xsi_type='Get_Resource']/label[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="semtag">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='semtag']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="todisplay">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='todisplay']/asmResource[@xsi_type='Get_Resource']/label[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="select"><xsl:value-of select="$nodetype"/>.<xsl:value-of select="$semtag"/>.<xsl:value-of select="$todisplay"/></xsl:variable>
		<node_resource>
			<xsl:if test="not($ref='')">
				<xsl:attribute name="ref"><xsl:value-of select="$ref"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="not($select='..')">
				<xsl:attribute name="select"><xsl:value-of select="$select"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="not($style='..')">
				<xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
			</xsl:if>
		</node_resource>
	</xsl:template>

	<xsl:template match="*[metadata/@semantictag='for-each-person']">
		<xsl:variable name="ref-init">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='ref-init']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="select">
			<xsl:value-of select="asmContext[metadata/@semantictag='select']/asmResource[@xsi_type='Field']/text[@lang=$lang]"/>
		</xsl:variable>
		<for-each-person select='{$select}'>
			<xsl:if test="not($ref-init='')">
				<xsl:attribute name="ref-init"><xsl:value-of select="$ref-init"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select='asmUnitStructure'/>
		</for-each-person>
	</xsl:template>
	
	<xsl:template match="*[metadata/@semantictag='for-each-portfolio']">
		<xsl:variable name="ref-init">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='ref-init']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="select">
			<xsl:value-of select="asmContext[metadata/@semantictag='select']/asmResource[@xsi_type='Field']/text[@lang=$lang]"/>
		</xsl:variable>
		<for-each-portfolio select='{$select}'>
			<xsl:if test="not($ref-init='')">
				<xsl:attribute name="ref-init"><xsl:value-of select="$ref-init"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select='asmUnitStructure'/>
		</for-each-portfolio>
	</xsl:template>

	<xsl:template match="*[metadata/@semantictag='for-each-line']">
		<xsl:variable name="ref-init">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='ref-init']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<for-each-line>
			<xsl:if test="not($ref-init='')">
				<xsl:attribute name="ref-init"><xsl:value-of select="$ref-init"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select='asmUnitStructure'/>
		</for-each-line>
	</xsl:template>

	<xsl:template match="*[metadata/@semantictag='for-each-node']">
		<xsl:variable name="ref-init">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='ref-init']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="nodetype">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='nodetype']/asmResource[@xsi_type='Get_Resource']/label[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="semtag">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='semtag']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="select"><xsl:value-of select="$nodetype"/>.<xsl:value-of select="$semtag"/></xsl:variable>
		<for-each-node>
			<xsl:if test="not($ref-init='')">
				<xsl:attribute name="ref-init"><xsl:value-of select="$ref-init"/></xsl:attribute>
			</xsl:if>
			<xsl:attribute name="select"><xsl:value-of select="$select"/></xsl:attribute>
			<xsl:apply-templates select='asmUnitStructure'/>
		</for-each-node>
	</xsl:template>

	<xsl:template match="*[metadata/@semantictag='aggregate']">
		<xsl:variable name="style">
			<xsl:call-template name="style"/>
		</xsl:variable>
		<xsl:variable name="ref">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='ref']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="select">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='aggregationselect']/asmResource[@xsi_type='Field']/text[@lang=$lang]"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="type">
			<xsl:value-of select=".//asmContext[metadata/@semantictag='aggregatetype']/asmResource[@xsi_type='Get_Resource']/value"></xsl:value-of>
		</xsl:variable>
		<aggregate>
			<xsl:if test="not($ref='')">
				<xsl:attribute name="ref"><xsl:value-of select="$ref"/></xsl:attribute>
			</xsl:if>
			<xsl:attribute name="select"><xsl:value-of select="$select"/></xsl:attribute>
			<xsl:attribute name="type"><xsl:value-of select="$type"/></xsl:attribute>
			<xsl:if test="not($style='..')">
				<xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select='asmUnitStructure'/>
		</aggregate>
	</xsl:template>

	<xsl:template name="style">
		<xsl:variable name="padding-top">
			<xsl:value-of select=".//metadata-epm/@node-padding-top"/>
		</xsl:variable>
		<xsl:variable name="text-align">
			<xsl:value-of select=".//metadata-epm/@node-text-align"/>
		</xsl:variable>
		<xsl:variable name="font-style">
			<xsl:value-of select=".//metadata-epm/@node-font-style"/>
		</xsl:variable>
		<xsl:variable name="font-weight">
			<xsl:value-of select=".//metadata-epm/@node-font-weight"/>
		</xsl:variable>
		<xsl:variable name="font-size">
			<xsl:value-of select=".//metadata-epm/@node-font-size"/>
		</xsl:variable>
		<xsl:variable name="background-color">
			<xsl:value-of select=".//metadata-epm/@node-background-color"/>
		</xsl:variable>
		<xsl:variable name="color">
			<xsl:value-of select=".//metadata-epm/@node-color"/>
		</xsl:variable>
		<xsl:variable name="othercss">
			<xsl:value-of select=".//metadata-epm/@node-othercss"/>
		</xsl:variable>
		<xsl:if test="not(padding-top='')">padding-top:<xsl:value-of select="$padding-top"/>;</xsl:if>
		<xsl:if test="not(text-align='')">text-align:<xsl:value-of select="$text-align"/>;</xsl:if>
		<xsl:if test="not(font-style='')">font-style:<xsl:value-of select="$font-style"/>;</xsl:if>
		<xsl:if test="not(font-weight='')">font-weight:<xsl:value-of select="$font-weight"/>;</xsl:if>
		<xsl:if test="not($font-size='')">font-size:<xsl:value-of select="$font-size"/>;</xsl:if>
		<xsl:if test="not($background-color='')">background-color:<xsl:value-of select="$background-color"/>;</xsl:if>
		<xsl:if test="not($color='')">color:<xsl:value-of select="$color"/>;</xsl:if>
		<xsl:if test="not($othercss='')"><xsl:value-of select="$othercss"/></xsl:if>
	</xsl:template>

</xsl:stylesheet>

 