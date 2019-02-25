<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="FirstName" select= "//table/@FirstFileName" />
<xsl:variable name="SecondName" select= "//table/@SecondFileName" />
  <xsl:template match="/">		
        <span style="font-size:16px">Difference between <b><xsl:value-of select="$FirstName"/></b>  and <b><xsl:value-of select="$SecondName"/></b></span>
		<br/><br/><br/>		
        <table border="1" class="tctable">
          <tr bgcolor="#9acd32">
            <th>Expected</th>
            <th>Actual</th>
          </tr>
          <xsl:for-each   select="//td">
            <tr>
              <td>
                <font color="green">
                  <xsl:value-of select="data[@type='expected']"/>
                </font>
              </td>
              <td>
                <font color="red">
                  <xsl:value-of select="data[@type='actual']"/>
                </font>
              </td>
            </tr>
          </xsl:for-each>
        </table>      
  </xsl:template>
</xsl:stylesheet>