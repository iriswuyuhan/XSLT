<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="course1">000001</xsl:variable>

    <xsl:variable name="type1">平时成绩</xsl:variable>

    <!--如此来看，把各种成绩分开还是更简单-->
    <xsl:template match="/学生列表">
        <xsl:element name="课程成绩列表">
            <xsl:call-template name="courseSort">
                <xsl:with-param name="course" select="$course1"/>
                <xsl:with-param name="type" select="$type1"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template name="courseSort">
        <xsl:param name="course"/>
        <xsl:param name="type"/>
        <xsl:for-each select="//课程成绩[(@课程编号=$course) and (@成绩性质=$type)]">
            <xsl:sort select="成绩/得分"/>
            <xsl:element name="课程成绩">
                <xsl:attribute name="课程编号">
                    <xsl:value-of select="$course"/>
                </xsl:attribute>
                <xsl:attribute name="成绩类型">
                    <xsl:value-of select="$type"/>
                </xsl:attribute>
                <xsl:element name="成绩">
                    <xsl:element name="学号">
                        <xsl:value-of select="成绩/学号"/>
                    </xsl:element>
                    <xsl:element name="得分">
                        <xsl:value-of select="成绩/得分"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>