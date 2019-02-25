<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="BLN_INFO_LOG" select="//Report/@CreateInfoLog"/>
	<xsl:variable name="BLN_DEBUG_LOG" select="//Report/@CreateDebugLog"/>
	<xsl:variable name="BLN_ERROR_LOG" select="//Report/@CreateErrorLog"/>
	<xsl:variable name="TYPE" select="@Type"/>
	<xsl:variable name="ANDROID">ANDROID</xsl:variable>
	<xsl:variable name="IOS">IOS</xsl:variable>
	<xsl:variable name="lower">
		abcdefghijklmnopqrstuvwxyz
	</xsl:variable>
	<xsl:variable name="upper">
		ABCDEFGHIJKLMNOPQRSTUVWXYZ
	</xsl:variable>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Report">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Suite">
		<xsl:variable name="varSuiteName">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="@Name"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varDownloadVideoLink">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="translate(../@IsDownloadVideo,$upper,$lower)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varExecutionEnvironment">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="translate(../@ExecutionEnvironment,$upper,$upper)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varTotalTcCount">
			<xsl:value-of select="count(TCs/TC)"/>
		</xsl:variable>
		<xsl:variable name="varNETcCount">
			<xsl:value-of select="count(TCs/TC[@Status=-1])"/>
		</xsl:variable>
		<div class="container">
			<div id="logodate">
				<div id="logo">
					<img alt="" src="images/logo.png"/>
				</div>
				<div id="summary">
					<table style="width:100%">
						<tr>
							<td class="attrname">Test Suite</td>
							<td> : </td>
							<td align="left">
								<span>
									<xsl:value-of select="$varSuiteName"/>
								</span>
							</td>
							<td class="attrname">OS - Browser</td>
							<td class="attrname">:</td>
							<td style="margin:0 !important">
								<xsl:choose>
									<xsl:when test="contains(../@OS,'WIN')">
										<img src="Images/windows.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@OSVersion"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@OSVersion"/>
										</span>
									</xsl:when>
									<xsl:when test="contains(../@OS,'MAC')">
										<img src="Images/mac.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@OSVersion"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@OSVersion"/>
										</span>
									</xsl:when>
									<xsl:when test="contains(../@OS,'LINUX')">
										<img src="Images/linux.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@OSVersion"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@OSVersion"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span>NA</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td align="left">
								<xsl:choose>
									<xsl:when test="contains(../@Browser,'CHROME')">
										<img src="Images/chrome.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@BrowserVersion"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@BrowserVersion"/>
										</span>
									</xsl:when>
									<xsl:when test="contains(../@Browser,'FIREFOX')">
										<img src="Images/mozilla_firefox.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@BrowserVersion"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@BrowserVersion"/>
										</span>
									</xsl:when>
									<xsl:when test="contains(../@Browser,'IEXPLORE')">
										<img src="Images/internet_explorer.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@BrowserVersion"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@BrowserVersion"/>
										</span>
									</xsl:when>
									<xsl:when test="contains(../@Browser,'SAFARI')">
										<img src="Images/safari.png" style="width:width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@BrowserVersion"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@BrowserVersion"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span>NA</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="attrname">Execution Time</td>
							<td class="attrname"> : </td>
							<td align="left">
								<span>
									<xsl:value-of select="@ExecutionTime"/>
								</span>
							</td>
							<td class="attrname">Environment</td>
							<td class="attrname"> : </td>
							<td align="left">
								<span>
									<xsl:value-of select="$varExecutionEnvironment"/>
								</span>
							</td>
						</tr>
						<tr>
							<td class="attrname">Start Time</td>
							<td class="attrname"> : </td>
							<td align="left">
								<span>
									<xsl:value-of select="@StartTime"/>
								</span>
							</td>
							<td class="attrname">Mobile OS - Browser</td>
							<td class="attrname">:</td>
							<td style="margin:0 !important">
								<xsl:choose>
									<xsl:when test="contains(../@MobileOS, $ANDROID)">
										<img src="Images/android-icon.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="concat ($ANDROID, ' ', ../@MobileOSVersion)"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="concat ($ANDROID, ' ', ../@MobileOSVersion)"/>
										</span>
									</xsl:when>
									<xsl:when test="contains(../@MobileOS, $IOS)">
										<img src="Images/ios-icon.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="concat($IOS, ../@MobileOSVersion)"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="concat ($IOS, ' ', ../@MobileOSVersion)"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span>NA</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td style="margin:0 !important">
								<xsl:choose>
									<xsl:when test="contains(../@MobileOS, $ANDROID)">
										<img src="Images/chrome.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@MobileBrowser"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@MobileBrowser"/>
										</span>
									</xsl:when>
									<xsl:when test="contains(../@MobileOS, $IOS)">
										<img src="Images/safari.png" style="width:16px;height:16px;vertical-align:middle">
											<xsl:attribute name="title"><xsl:value-of select="../@MobileBrowser"/></xsl:attribute>
										</img>
										<span style="margin-left: 5px;vertical-align:middle">
											<xsl:value-of select="../@MobileBrowser"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span>NA</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="attrname">End Time</td>
							<td class="attrname"> : </td>
							<td align="left">
								<span>
									<xsl:value-of select="@EndTime"/>
								</span>
							</td>
							<td class="attrname">Mobile Environment</td>
							<td class="attrname">:</td>
							<td style="margin:0 !important" colspan="2">
								<span style="margin-left: 5px;vertical-align:middle">
									<xsl:value-of select="../@MobileExecutionEnvironment"/>
								</span>
							</td>
						</tr>
					</table>
				</div>
				<div id="total">
					<div id="divheader" class="header">
              Total Test Cases : <xsl:value-of select="$varTotalTcCount"/>
					</div>
					<div id="divpassed">
              Passed Cases: <xsl:value-of select="count(TCs/TC[@Status=0])"/>
					</div>
					<div id="divfailed">
              Failed Cases: <xsl:value-of select="count(TCs/TC[@Status=1])"/>
					</div>
					<div class="clear">
            </div>
					<div id="divnotexecuted">
              Not Executed: <xsl:value-of select="$varNETcCount"/>
					</div>
					<div id="divdefects">
              Defects: <xsl:value-of select="count(TCs/TC[@Status=2])"/>
					</div>
				</div>
				<span id="date" style="font-size:small;"/>
			</div>
		</div>
		<div class="clear"/>
		<div id="thediv" style="margin: 0px 0px 0px 0px; width: 100%; height:100%; padding-left: 5px; padding-right: 0px; text-align: left;overflow: auto">
			<table id="tc_table" class="tctable" cellspacing="0">
				<tr>
					<th style="border-left-width: 1px;">Test Case</th>
					<th style="width:15%">Acceptance Criteria/Scenario</th>
					<th style="width:15%">Story</th>
					<th style="width:15%">Epic</th>
					<th style="width:10%">Manual TC ID</th>
					<th style="width:5%">Status</th>
					<th style="width:9%; text-align:center">Execution Time</th>
					<xsl:if test="$varExecutionEnvironment='sauce' and $varDownloadVideoLink='true' and $varTotalTcCount > $varNETcCount">
						<th style="width:8%; text-align:center">Download Video</th>
					</xsl:if>
				</tr>
				<xsl:apply-templates/>
			</table>
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
					<xsl:with-param name="text" select="substring-after($text,$replace)"/>
					<xsl:with-param name="replace" select="$replace"/>
					<xsl:with-param name="with" select="$with"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="TCs">
		<xsl:for-each select="TC">
			<xsl:call-template name="TCTemplate"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="TCTemplate">
		<xsl:variable name="OUT_OF_SYNC">OUT OF SYNC</xsl:variable>
		<xsl:variable name="tcID">tc_<xsl:value-of select="@TCSeqId"/>
		</xsl:variable>
		<xsl:variable name="varDownloadVideoLink">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="translate(//Report/@IsDownloadVideo,$upper,$lower)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varExecutionEnvironment">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="translate(//Report/@ExecutionEnvironment,$upper,$lower)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varTcName">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="@TCName"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varScenarioName">
      <xsl:call-template name="escape-spl-chars">
        <xsl:with-param name="text" select="@BR"/>
      </xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varEpic">
      <xsl:call-template name="escape-spl-chars">
        <xsl:with-param name="text" select="@Epic"/>
      </xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varStory">
      <xsl:call-template name="escape-spl-chars">
        <xsl:with-param name="text" select="@Story"/>
      </xsl:call-template>
		</xsl:variable>
		<tr id="{$tcID}">
			<xsl:attribute name="class"><xsl:if test="@ExecutionTime='00:00:00.000'">
          disabled_row
        </xsl:if></xsl:attribute>
			<td style="border-left-width: 1px;">
				<img src="Images/testcase.png"/>
				<xsl:value-of select="$varTcName"/>
			</td>
			<td>
				<xsl:choose>
				<xsl:when test="@BRStatus='3'">
					<font color="red">
						<xsl:value-of select="$varScenarioName"/>
					</font>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$varScenarioName"/>
				</xsl:otherwise>
			</xsl:choose>
			</td>
			<td>
				<xsl:choose>
				<xsl:when test="@StoryStatus='3'">
					<font color="red">
						<xsl:value-of select="$varStory"/>
					</font>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$varStory"/>
				</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
				<xsl:when test="@EpicStatus='3'">
					<font color="red">
						<xsl:value-of select="$varEpic"/>
					</font>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$varEpic"/>
				</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:value-of select="@ManualTCId"/>
			</td>
			<td>
				<center>
					<xsl:choose>
						<xsl:when test="@Status=0">
							<img src="Images/success.png"/>
						</xsl:when>
						<!--xsl:when test="(@Status=-1) and (starts-with($varTcName,$OUT_OF_SYNC))">
            <img src="Images/Not_Executed.png"/>
          </xsl:when-->
						<xsl:when test="@Status=-1">
							<img src="Images/Not_Executed.png"/>
						</xsl:when>
						<xsl:when test="@Status=2">
							<img src="Images/Defect.png"/>
						</xsl:when>
						<xsl:otherwise>
							<img src="Images/fail.png"/>
						</xsl:otherwise>
					</xsl:choose>
				</center>
			</td>
			<td style="text-align:center;">
				<xsl:value-of select="@ExecutionTime"/>
			</td>
			<xsl:if test="$varExecutionEnvironment='sauce' and $varDownloadVideoLink='true' and @DownloadVideoLink!=''">
				<td style="text-align:center;" onclick='window.open("{@DownloadVideoLink}")'>
					<a id="anchortag" href="">Download</a>
					<!--<button id="anchortag"  onclick="LoadURL(@DownloadVideoLink)" value="Download" ></button>-->
				</td>
			</xsl:if>
		</tr>
		<xsl:for-each select="TCIteration">
			<xsl:call-template name="TCIterationTemplate">
				<xsl:with-param name="rowId" select="$tcID"/>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="TCIterationTemplate">
		<xsl:param name="rowId"/>
		<xsl:variable name="varTC">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="../@TCName"/>
			</xsl:call-template>
		</xsl:variable>
		<!--xsl:variable name="strURL">
		<xsl:value-of select="$varTC" />_<xsl:value-of select="../@RunId" />
	</xsl:variable-->
		<xsl:variable name="varScenarioName">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="../@BR"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="varEpic">
			<xsl:call-template name="escape-spl-chars">
				<xsl:with-param name="text" select="../@Epic"/>
			</xsl:call-template>
		</xsl:variable>
    <xsl:variable name="varStory">
      <xsl:call-template name="escape-spl-chars">
        <xsl:with-param name="text" select="../@Story"/>
      </xsl:call-template>
    </xsl:variable>
		<!-- </xsl:variable> -->
		<xsl:variable name="strURL">
			<xsl:value-of select="../@TCSeqId"/>
		</xsl:variable>
		<xsl:variable name="tcIterationID">
			<xsl:value-of select="$rowId"/>_<xsl:value-of select="@IterationNo"/>
		</xsl:variable>
		<xsl:variable name="tcIteration">
			<xsl:value-of select="@IterationNo"/>
		</xsl:variable>
		<tr id="{$tcIterationID}">
			<xsl:attribute name="onclick"><xsl:if test="@ExecutionTime!='00:00:00.000'">NavigateToTC('<xsl:value-of select="$strURL"/>','<xsl:value-of select="$tcIteration"/>','<xsl:value-of select="$BLN_INFO_LOG"/>', '<xsl:value-of select="$BLN_DEBUG_LOG"/>','<xsl:value-of select="$BLN_ERROR_LOG"/>','<xsl:value-of select="../@Type"/>','<xsl:value-of  select="$varScenarioName"/>','<xsl:value-of select="$varEpic"/>','<xsl:value-of select="$varStory"/>')
        </xsl:if></xsl:attribute>
			<xsl:attribute name="class"><xsl:if test="@ExecutionTime='00:00:00.000'">
          disabled_row
        </xsl:if>
        child-of-<xsl:value-of select="$rowId"/></xsl:attribute>
			<td style="border-left-width: 1px;">
				<img src="Images/TCIteration.png"/>
				<xsl:value-of select="@IterationNo"/>
				<xsl:if test="@TCDataSetTag != ''">
					<xsl:variable name="varTCDataSetTag">
						<xsl:call-template name="escape-spl-chars">
							<xsl:with-param name="text" select="@TCDataSetTag"/>
						</xsl:call-template>
					</xsl:variable>
          (<xsl:value-of select="$varTCDataSetTag"/>)
        </xsl:if>
			</td>
			<td>&#160;</td>
			<td>&#160;</td>
			<td>&#160;</td>
			<!--It is Tc Itertaiton row, no need to display scenarion name. added spaces insted of scenario name-->
			<td>&#160;</td>
			<!--It is Tc Itertaiton row, no need to display manul tc id. added spaces insted of manul tcid-->
			<td>
				<center>
					<xsl:choose>
						<xsl:when test="@Status=0">
							<img src="Images/success.png"/>
						</xsl:when>
						<xsl:when test="@Status=-1">
							<img src="Images/Not_Executed.png"/>
						</xsl:when>
						<xsl:when test="@Status=2">
							<img src="Images/Defect.png"/>
						</xsl:when>
						<xsl:otherwise>
							<img src="Images/fail.png"/>
						</xsl:otherwise>
					</xsl:choose>
				</center>
			</td>
			<td style="text-align:center;">
				<xsl:value-of select="@ExecutionTime"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
	