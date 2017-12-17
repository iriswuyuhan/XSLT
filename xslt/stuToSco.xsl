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
        <xsl:for-each select="//课程成绩[@课程编号=$course and @成绩类型=$type]">
            <xsl:sort select="成绩/得分"/>
            <课程成绩 成绩性质="平时成绩" 课程编号="000001">
                <成绩>
                    <学号><xsl:value-of select="./学号"/></学号>
                    <得分><xsl:value-of select="./得分"/></得分>
                </成绩>
            </课程成绩>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>