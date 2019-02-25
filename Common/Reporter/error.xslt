<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">   
      <xsl:apply-templates/>
  </xsl:template>

  <!--xsl:template match="Report">
    <xsl:apply-templates/>        
  </xsl:template-->

  <xsl:template match="Report">
	<xsl:variable name="varProjectName">
		<xsl:call-template name="escape-spl-chars">
			<xsl:with-param name="text" select="@ProjectName"/>
		</xsl:call-template>
	</xsl:variable>
	
    <div id="panalHeader" style="padding: 5px;">
       <div id="logodate">
          <div id="logo">
              <img alt="" src="images/logo.png" />
          </div>
          <div id="summary">
            <table>
              <tr>
                <td align='right' ><b>ProjectName : </b></td>
                <td align='left'>
                  <span><xsl:value-of select="$varProjectName" /></span>
                </td>
              </tr>
              <tr>
                <td align='right'><b>Release Number: </b></td>
                <td align='left'>
                  <span><xsl:value-of select="@ReleaseNumber" /></span>
                </td>
              </tr>
              <tr>
                <td align='right'><b>Build Number: </b></td>
                <td align='left'>
                  <span><xsl:value-of select="@BuildNumber" /></span>
                </td>
              </tr>
              <tr>
                <td align='right'><b>Host Name: </b></td>
                <td align='left'>
                  <span><xsl:value-of select="@HostName" /></span>
                </td>
              </tr>
			  <tr>
                <td align='right'><b>User Name: </b></td>
                <td align='left'>
                  <span><xsl:value-of select="@UserName" /></span>
                </td>
              </tr>
			  <tr>
                <td align='right'><b>Generated At: </b></td>
                <td align='left'>
                  <span><xsl:value-of select="@generatedAt" /></span>
                </td>
              </tr>			  
            </table>
          </div>
			<div id="ErrorHeader">
				<table>
				  <tr>
					<td align='left'>
					  <span>Execution aborted due to critical errors. Please check the error descriptions below for more details.</span>
					</td>
				  </tr>
				</table>
			</div>

		</div>
	</div>
		<div class="clear">
		  <br />
		</div>
		<!--div id="thediv" style="margin: 0px 0px 0px 0px; width: 100%; padding-left: 5px; padding-right: 0px; text-align: left;overflow: scroll;Auto: 82%">
		  <table id="tc_table" class="tctable" cellspacing="0" -->
			<!--tr>
			  <th style="border-left-width: 1px;">Test Case</th>          
			  <th style="width:25%">Scenario Name</th>
			  <th style="width:10%">Manual TC ID</th>
			  <th style="width:5%">Status</th>
			  <th style="width:9%; text-align:center">Execution Time</th>
			</tr-->
		<div>
			<xsl:apply-templates/>
		  <!--/table-->
		</div>
  </xsl:template>

  <xsl:template name="escape-spl-chars">
	<xsl:param name="text"/>
	<xsl:variable name="escBackSlash">
		<xsl:call-template name="replace-string">
			<xsl:with-param name="text" select="$text"/>
			<xsl:with-param name="replace" select='"\"'/>
			<xsl:with-param name="with" select='"\\"'/>
		</xsl:call-template>
	</xsl:variable>
	
	<xsl:variable name="escSingleQuote">
		<xsl:call-template name="replace-string">
			<xsl:with-param name="text" select="$escBackSlash"/>
			<xsl:with-param name="replace" select='"&apos;"'/>
			<xsl:with-param name="with" select='"\&apos;"'/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:value-of select="$escSingleQuote"/>
  </xsl:template>
  
  <xsl:template name="replace-string">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
      <xsl:when test="contains($text,$replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$with"/>
        <xsl:call-template name="replace-string">
          <xsl:with-param name="text"
                          select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="with" select="$with"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
   <!--xsl:template match="Error">
		<tr>
            <td align='right'>Error: </td>
            <td align='left'>
               <span><xsl:value-of select="Message/text()" /></span>
            </td>
        </tr>
		<tr>
            <td align='right'>Cause: </td>
            <td align='left'>
               <span><xsl:value-of select="Cause/text()" /></span>
            </td>
        </tr>
		<tr>
            <td align='right'>Description: </td>
            <td align='left'>
               <span><xsl:value-of select="Description/text()" /></span>
            </td>
        </tr>
  </xsl:template-->
  
  <xsl:template match="Error">
		<div id="ErrorDetails">
            <table>
              <tr>
                <td class='label'><b>Error : </b></td>
                <td align='left'>
                  <span><xsl:value-of select="Message/text()" /></span>
                </td>
              </tr>
              <tr>
                <td class='label'><b>Cause: </b></td>
                <td align='left'>
                  <span><xsl:value-of select="Cause/text()" /></span>
                </td>
              </tr>
              <tr>
                <td class='label'><b>Error Description: </b></td>
                <td align='left'>
                  <span><xsl:value-of select="Description/text()" /></span>
                </td>
              </tr>
            </table>
        </div>
	</xsl:template>
	
 </xsl:stylesheet>
