<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl" xmlns:xsltu="http://xsltunit.org/0/" exclude-result-prefixes="exsl" xmlns:xalan="http://xml.apache.org/xalan">
    <xsl:import href="parrot.xsl" />
    <xsl:import href="./xsltunit-0.2/xsltunit.xsl" />
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" xalan:indent-amount="4" />
    <xsl:template match="/">
        <xsltu:tests>

            <xsltu:test id="test-speedofeuropeanparrot">
                <xsl:variable name="source">
                    <parrot type="EUROPEAN" numberOfCoconuts="0" voltage="0" isNailed="false" />
                </xsl:variable>
                <xsl:call-template name="xsltu:assertEqual">
                    <xsl:with-param name="id" select="'SpeedOfEuropeanParrot'" />
                    <xsl:with-param name="nodes1">
                        <xsl:apply-templates select="exsl:node-set($source)/parrot" />
                    </xsl:with-param>
                    <xsl:with-param name="nodes2"><speed>12.0</speed></xsl:with-param>
                </xsl:call-template>
            </xsltu:test>

            <xsltu:test id="test-speedofafricanparrot_with_one_coconut">
                <xsl:variable name="source">
                    <parrot type="AFRICAN" numberOfCoconuts="1" voltage="0" isNailed="false" />
                </xsl:variable>
                <xsl:call-template name="xsltu:assertEqual">
                    <xsl:with-param name="id" select="'SpeedOfAfricanParrot_With_One_Coconut'" />
                    <xsl:with-param name="nodes1">
                        <xsl:apply-templates select="exsl:node-set($source)/parrot" />
                    </xsl:with-param>
                    <xsl:with-param name="nodes2"><speed>3.0</speed></xsl:with-param>
                </xsl:call-template>
            </xsltu:test>

            <xsltu:test id="test-speedofafricanparrot_with_two_coconuts">
                <xsl:variable name="source">
                    <parrot type="AFRICAN" numberOfCoconuts="2" voltage="0" isNailed="false" />
                </xsl:variable>
                <xsl:call-template name="xsltu:assertEqual">
                    <xsl:with-param name="id" select="'SpeedOfAfricanParrot_With_Two_Coconuts'" />
                    <xsl:with-param name="nodes1">
                        <xsl:apply-templates select="exsl:node-set($source)/parrot" />
                    </xsl:with-param>
                    <xsl:with-param name="nodes2"><speed>0.0</speed></xsl:with-param>
                </xsl:call-template>
            </xsltu:test>

            <xsltu:test id="test-speedofafricanparrot_with_no_coconuts">
                <xsl:variable name="source">
                    <parrot type="AFRICAN" numberOfCoconuts="0" voltage="0" isNailed="false" />
                </xsl:variable>
                <xsl:call-template name="xsltu:assertEqual">
                    <xsl:with-param name="id" select="'SpeedOfAfricanParrot_With_No_Coconuts'" />
                    <xsl:with-param name="nodes1">
                        <xsl:apply-templates select="exsl:node-set($source)/parrot" />
                    </xsl:with-param>
                    <xsl:with-param name="nodes2"><speed>12.0</speed></xsl:with-param>
                </xsl:call-template>
            </xsltu:test>

            <xsltu:test id="test-speednorwegianblueparrot_nailed">
                <xsl:variable name="source">
                    <parrot type="NORWEGIAN_BLUE" numberOfCoconuts="0" voltage="1.5" isNailed="true" />
                </xsl:variable>
                <xsl:call-template name="xsltu:assertEqual">
                    <xsl:with-param name="id" select="'SpeedNorwegianBlueParrot_nailed'" />
                    <xsl:with-param name="nodes1">
                        <xsl:apply-templates select="exsl:node-set($source)/parrot" />
                    </xsl:with-param>
                    <xsl:with-param name="nodes2"><speed>0.0</speed></xsl:with-param>
                </xsl:call-template>
            </xsltu:test>

            <xsltu:test id="test-speednorwegianblueparrot_not_nailed">
                <xsl:variable name="source">
                    <parrot type="NORWEGIAN_BLUE" numberOfCoconuts="0" voltage="1.5" isNailed="false" />
                </xsl:variable>
                <xsl:call-template name="xsltu:assertEqual">
                    <xsl:with-param name="id" select="'SpeedNorwegianBlueParrot_not_nailed'" />
                    <xsl:with-param name="nodes1">
                        <xsl:apply-templates select="exsl:node-set($source)/parrot" />
                    </xsl:with-param>
                    <xsl:with-param name="nodes2"><speed>18.0</speed></xsl:with-param>
                </xsl:call-template>
            </xsltu:test>

            <xsltu:test id="test-speednorwegianblueparrot_not_nailed_high_voltage">
                <xsl:variable name="source">
                    <parrot type="NORWEGIAN_BLUE" numberOfCoconuts="0" voltage="4" isNailed="false" />
                </xsl:variable>
                <xsl:call-template name="xsltu:assertEqual">
                    <xsl:with-param name="id" select="'SpeedNorwegianBlueParrot_not_nailed_high_voltage'" />
                    <xsl:with-param name="nodes1">
                        <xsl:apply-templates select="exsl:node-set($source)/parrot" />
                    </xsl:with-param>
                    <xsl:with-param name="nodes2"><speed>24.0</speed></xsl:with-param>
                </xsl:call-template>
            </xsltu:test>

        </xsltu:tests>
    </xsl:template>
</xsl:stylesheet>
