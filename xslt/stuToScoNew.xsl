<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <xsl:element name="课程成绩列表">
            <xsl:for-each-group select="//课程成绩" group-by="@课程编号">
                <xsl:for-each-group select="current-group()" group-by="@成绩性质">
                    <xsl:element name="课程成绩">
                        <xsl:attribute name="课程编号">
                            <xsl:value-of select="@课程编号"/>
                        </xsl:attribute>
                        <xsl:attribute name="课程性质">
                            <xsl:value-of select="current-grouping-key()"/>
                        </xsl:attribute>
                        <xsl:for-each select="current-group()">
                            <xsl:sort select="成绩/得分"/>
                            <xsl:element name="成绩">
                                <xsl:element name="学号">
                                    <xsl:value-of select="成绩/学号"/>
                                </xsl:element>
                                <xsl:element name="得分">
                                    <xsl:value-of select="成绩/得分"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each-group>
            </xsl:for-each-group>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
