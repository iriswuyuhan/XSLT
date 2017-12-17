<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <xsl:element name="课程成绩列表">

            <xsl:element name="课程成绩">
                <xsl:attribute name="课程编号">
                    <xsl:value-of select="//学生/学生成绩/成绩详情/课程成绩列表/课程成绩/@课程编号"/>
                </xsl:attribute>
                <xsl:attribute name="成绩性质">
                    <xsl:value-of select="//学生/学生成绩/成绩详情/课程成绩列表/课程成绩/@成绩性质"/>
                </xsl:attribute>

                <xsl:for-each select="//学生">
                    <xsl:sort select="学生成绩/成绩详情/课程成绩列表/课程成绩/成绩/得分"/>
                    <xsl:element name="成绩">
                        <xsl:element name="学号">
                            <xsl:value-of select="学生成绩/成绩详情/课程成绩列表/课程成绩/成绩/学号"/>
                        </xsl:element>
                        <xsl:element name="得分">
                            <xsl:value-of select="学生成绩/成绩详情/课程成绩列表/课程成绩/成绩/得分"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>

            </xsl:element>

            <!--<xsl:element name="课程成绩">-->
                <!--<xsl:attribute name="课程编号">-->
                    <!--<xsl:value-of select="//学生/学生成绩/成绩详情/课程成绩列表/课程成绩[2]/@课程编号"/>-->
                <!--</xsl:attribute>-->
                <!--<xsl:attribute name="成绩性质">-->
                    <!--<xsl:value-of select="//学生/学生成绩/成绩详情/课程成绩列表/课程成绩[2]/@成绩性质"/>-->
                <!--</xsl:attribute>-->

                <!--<xsl:for-each select="//学生">-->
                    <!--<xsl:sort select="学生成绩/成绩详情/课程成绩列表/课程成绩[2]/成绩/得分"/>-->
                    <!--<xsl:element name="成绩">-->
                        <!--<xsl:element name="学号">-->
                            <!--<xsl:value-of select="学生成绩/成绩详情/课程成绩列表/课程成绩[2]/成绩/学号"/>-->
                        <!--</xsl:element>-->
                        <!--<xsl:element name="得分">-->
                            <!--<xsl:value-of select="学生成绩/成绩详情/课程成绩列表/课程成绩[2]/成绩/得分"/>-->
                        <!--</xsl:element>-->
                    <!--</xsl:element>-->
                <!--</xsl:for-each>-->

            <!--</xsl:element>-->

        </xsl:element>
    </xsl:template>
</xsl:stylesheet>