<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common"
     extension-element-prefixes="exsl" exclude-result-prefixes="exsl">

    <xsl:template match="parrot">
        <xsl:element name="speed">
        <xsl:choose>
            <xsl:when test="@type = 'EUROPEAN'">
                <xsl:call-template name="getBaseSpeed">
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="@type = 'AFRICAN'">
                <xsl:variable name="baseSpeed">
                    <xsl:call-template name="getBaseSpeed">
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="loadFactor">
                    <xsl:call-template name="getLoadFactor">
                    </xsl:call-template>
                </xsl:variable>

                <xsl:call-template name="max">
                    <xsl:with-param name="a" select="'0.0'" />
                    <xsl:with-param name="b" select="format-number(number($baseSpeed) - number($loadFactor) * number(@numberOfCoconuts), '#.0')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="@type = 'NORWEGIAN_BLUE'">
                <xsl:choose>
                    <xsl:when test="@isNailed = 'true'">0.0</xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="getBaseSpeedNorwegian">
                            <xsl:with-param name="voltage" select="@voltage" />
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                Should be unreachable
            </xsl:otherwise>
        </xsl:choose>

        </xsl:element>
    </xsl:template>

    <xsl:template name="getBaseSpeed">12.0</xsl:template>

    <xsl:template name="getLoadFactor">9.0</xsl:template>

    <xsl:template name="getBaseSpeedNorwegian">
        <xsl:param name="voltage" />

        <xsl:variable name="baseSpeed">
            <xsl:call-template name="getBaseSpeed">
            </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="min">
            <xsl:with-param name="a" select="'24.0'" />
            <xsl:with-param name="b" select="format-number(number($voltage) * number($baseSpeed), '#.0')" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="max">
        <xsl:param name="a" />
        <xsl:param name="b" />
        <xsl:choose>
            <xsl:when test="number($a) &gt;= number($b)"><xsl:value-of select="$a" /></xsl:when>
            <xsl:otherwise><xsl:value-of select="$b" /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="min">
        <xsl:param name="a" />
        <xsl:param name="b" />
        <xsl:choose>
            <xsl:when test="number($a) &lt;= number($b)"><xsl:value-of select="$a" /></xsl:when>
            <xsl:otherwise><xsl:value-of select="$b" /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
