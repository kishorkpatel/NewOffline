<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:output method="html"/>
	<xsl:param name="iterationNo"></xsl:param>
	<xsl:variable name="ANDROID">ANDROID</xsl:variable>
	<xsl:variable name="IOS">IOS</xsl:variable>
  <xsl:template match="/">
      <xsl:apply-templates/>
  </xsl:template>
  <xsl:variable name="IMG_TYPE" select="//TC/@imgType" />
  
  
  <xsl:template match="TC">
	
    <div id="panalHeader" style="padding: 5px;">
      <div id="logodate">
        <div id="logo" style="float: left;">
          <img alt="" src="images/logo.png" />
        </div>
        <div  style="font-size: 13px; color: #003399; float: right; margin-top: 5px;
                                  margin-right: 10px;">
          <div>
			<span id="divbackreport">
              <img src="Images/back-icon.png" title="Back to Summary Report" style="cursor:pointer" onclick="clickonBack()"></img>
            </span>
            <span id="spanfullview" title="Full View">
              <img src="Images/fullscreen-icon.png" style="cursor:pointer"></img>
            </span>
			<xsl:choose>
				<xsl:when test="@autoSelectFrame='1'">
					
					<span id="autoselectframe" title="Auto Select Frame"  style="color:#04B404">
					   <pre><b>Auto Frame</b></pre>
					</span>
					
				</xsl:when>
			</xsl:choose>	

          </div>
        </div>
        <div id="summary">
          <table style="text-align: left; margin-right: 10px;width:100%">
            <tr>
              <td class="attrname">Scenario</td>
			  <td>:</td>
			  <td align='left' colspan="5"><span><xsl:value-of select="@ScenarioName" /></span></td>
            </tr>
            <tr>
				<td class="attrname">Test Case</td>
				<td>:</td>
				<td><span><xsl:value-of select="@TCName" /></span></td>
				<td class="attrname">OS - Browser</td>
				<td>:</td>
				<!--td><span><xsl:value-of select="@OSVersion"/></span></td-->
				<td style="margin:0 !important">
					<xsl:choose>
					  <xsl:when test="contains(@OS,'WIN')">
						<img src="Images/windows.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@OSVersion"/>
							</xsl:attribute> 
						</img>
						<span style="margin-left:5px;vertical-align:middle" >
							<xsl:value-of select="@OSVersion"/>
						</span>
					  </xsl:when>
					  <xsl:when test="contains(@OS,'MAC')">
						<img src="Images/mac.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@OSVersion"/>
							</xsl:attribute>
						</img>
						<span style="margin-left:5px;vertical-align:middle">
							<xsl:value-of select="@OSVersion"/>
						</span>
					  </xsl:when>
					  <xsl:when test="contains(@OS,'LINUX')">
						<img src="Images/linux.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@OSVersion"/>
							</xsl:attribute> 
						</img>
						<span style="margin-left:5px;vertical-align:middle">
							<xsl:value-of select="@OSVersion"/>
						</span>
					  </xsl:when>
						<xsl:otherwise>
							<span>NA</span>
					  </xsl:otherwise>					  
					</xsl:choose>		
				
				</td>
				
				<td align='left'>
					<xsl:choose>
					  <xsl:when test="contains(@Browser,'CHROME')">
						<img src="Images/chrome.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@BrowserVersion"/>
							</xsl:attribute>
						</img>
						<span style="margin-left: 5px;vertical-align:middle">
							<xsl:value-of select="@BrowserVersion"/>
						</span>
					  </xsl:when>
					  <xsl:when test="contains(@Browser,'FIREFOX')">
						<img src="Images/mozilla_firefox.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@BrowserVersion"/>
							</xsl:attribute>
						</img>
						<span style="margin-left: 5px;vertical-align:middle">
							<xsl:value-of select="@BrowserVersion"/>
						</span>
					  </xsl:when>
					  <xsl:when test="contains(@Browser,'IEXPLORE')">
						<img src="Images/internet_explorer.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@BrowserVersion"/>
							</xsl:attribute>
						</img>
						<span style="margin-left: 5px;vertical-align:middle">
							<xsl:value-of select="@BrowserVersion"/>
						</span>
					  </xsl:when>		
					  <xsl:when test="contains(@Browser,'SAFARI')">
						<img src="Images/safari.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@BrowserVersion"/>
							</xsl:attribute>
						</img>
						<span style="margin-left: 5px;vertical-align:middle">
							<xsl:value-of select="@BrowserVersion"/>
						</span>
					  </xsl:when>
					  <xsl:otherwise>
						<span>NA</span>
					  </xsl:otherwise>
					</xsl:choose>					
                </td>
					
            </tr>
            <tr>
  				<td class="attrname">Test Case ID</td>
				<td>:</td>
				<td><span><xsl:value-of select="@ManualTCID" /></span></td>
				<td class="attrname">Mobile OS - Mobile Browser</td>
				<td>:</td>
				<td style="margin:0 !important">
					<xsl:choose>
					  <xsl:when test="contains(@MobileOS, 'ANDROID')">
						<img src="Images/android-icon.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="concat ($ANDROID, ' ', @MobileOSVersion)"/>
							</xsl:attribute> 
						</img>
						<span style="margin-left: 5px;vertical-align:middle" >
							
							<xsl:value-of select="concat ($ANDROID, ' ', @MobileOSVersion)"/>
						</span>
					  </xsl:when>
					  <xsl:when test="contains(@MobileOS, $IOS)">
						<img src="Images/ios-icon.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								
								<xsl:value-of select="concat($IOS, @MobileOSVersion)"/>
							</xsl:attribute>
						</img>
						<span style="margin-left: 5px;vertical-align:middle">
							<xsl:value-of select="concat ($IOS, ' ', @MobileOSVersion)"/>
						</span>
					  </xsl:when>
					  <xsl:otherwise>
						<span>NA</span>
					  </xsl:otherwise>
					</xsl:choose>		
				
				</td>
				
				<td style="margin:0 !important" >
					<xsl:choose>
					  <xsl:when test="contains(@MobileOS, 'ANDROID')">
						<img src="Images/chrome.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@MobileBrowser"/>
							</xsl:attribute> 
						</img>
						<span style="margin-left: 5px;vertical-align:middle" >
							<xsl:value-of select="@MobileBrowser"/>
						</span>
					  </xsl:when>
					  <xsl:when test="contains(@MobileOS, $IOS)">
						<img src="Images/safari.png" style="width:16px;height:16px;vertical-align:middle">
							<xsl:attribute name="title">
								<xsl:value-of select="@MobileBrowser"/>
							</xsl:attribute>
						</img>
						<span style="margin-left: 5px;vertical-align:middle">
							<xsl:value-of select="@MobileBrowser"/>
						</span>
					  </xsl:when>
					  <xsl:otherwise>
						<span>NA</span>
					  </xsl:otherwise>
					</xsl:choose>		
				
				</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="clear"></div>

	<div id="thediv" class="ie_scroll">
        <table class="tctable" style="table-layout: fixed; width: 99.5%; margin-right:5px;" cellspacing="0" id="tc_table">
          <colgroup>
            <!--col width="10%"/>
			<col width="22%"/>
            <col width="34%"/>
            <col width="21%"/>
            <col width="4%"/>
            <col width="9%"/-->
			<col width="4%"/>
			<col width="24%"/>
            <col width="34%"/>
            <col width="23%"/>
            <col width="4%"/>
            <col width="9%"/>
          </colgroup>
          <tr>
            <th style="border-left-width: 1px;">Line</th>
			<th>Test Case</th>          
            <th>Data</th>
            <th>Object</th>
            <th style="padding-left:0px">Status</th>
            <th>Execution Time</th>
          </tr>
          <xsl:variable name="tcID">tc_<xsl:value-of select="@TCSeqID" /></xsl:variable>
          <xsl:variable name="tcLogId"><xsl:value-of select="@TCName" />þ<xsl:value-of select="@TCSeqID" /></xsl:variable>
          <xsl:variable name="tcImageId">tc_<xsl:value-of select="@TCSeqID" /></xsl:variable>
          <xsl:choose>
            <xsl:when test="$iterationNo=-1">
              <xsl:for-each select="TCIteration">
                <xsl:call-template name="TCIterationTemplate">
                  <xsl:with-param name="rowId" select="$tcID" />
                  <xsl:with-param name="logId" select="$tcLogId" />
                  <xsl:with-param name="imageId" select="$tcImageId" />
                </xsl:call-template>
              </xsl:for-each>
            </xsl:when> 
            <xsl:otherwise>
              <xsl:for-each select="TCIteration[@IterationNo=$iterationNo]">
                <xsl:call-template name="TCIterationTemplate">
                  <xsl:with-param name="rowId" select="$tcID" />
                  <xsl:with-param name="logId" select="$tcLogId" />
                  <xsl:with-param name="imageId" select="$tcImageId" />
                </xsl:call-template>
              </xsl:for-each>       
            </xsl:otherwise>
          </xsl:choose>
        </table>
    </div>
  </xsl:template>

  <xsl:template name="TCIterationTemplate">
    <xsl:param name="rowId"></xsl:param>
    <xsl:param name="logId"></xsl:param>
    <xsl:param name="imageId"></xsl:param>
    
    <xsl:variable name="tcIterationID"><xsl:value-of select="$rowId"/>_<xsl:value-of select="@IterationNo" /></xsl:variable>
    <xsl:variable name="tcIterationLogId"><xsl:value-of select="$logId" />þ<xsl:value-of select="@IterationNo" /></xsl:variable>
    <xsl:variable name="tcIterationImageId"><xsl:value-of select="$rowId"/>_<xsl:value-of select="@IterationNo" /></xsl:variable>
    
    <tr id="{$tcIterationID}" onclick="LoadDetails(this);" title="tcIteration" logid="{$tcIterationLogId}">
     <!--td></td--> <!-- No Line Number for TC Iteration-->
	 <td style="margin-right:5px"></td>
	  <td>
        <img style="vertical-align:middle;" src="Images/TCIteration.png"/>
        <xsl:value-of select="@IterationNo" />
        <xsl:if test="@TCDataSetTag != ''">
          (<xsl:value-of select="@TCDataSetTag" />)
        </xsl:if>
      </td> 
      <td>
        <xsl:value-of select="@TCDataSetTag" />
      </td>
      <td/>
      <td>
        <xsl:choose>
          <xsl:when test="@Status='0'">
            <img src="Images/success.png"/>
          </xsl:when>
          <xsl:when test="@Status='-1'">
            <img src="Images/Not_Executed.png"/>
          </xsl:when>
          <xsl:when test="@Status='2'">
            <img src="Images/Defect.png"/>
          </xsl:when>
          <xsl:otherwise>
            <img src="Images/fail.png"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:value-of select="@ExecutionTime" />
      </td>
    </tr>
    <xsl:for-each select="Task">
      <xsl:choose>
        <xsl:when test="@ParentID != ''"></xsl:when>
        <xsl:when test="@IsSystemTask='true' and TaskIteration/Step/@Action ='IF'">
          <xsl:call-template name="TCStepConditionTemplate">
            <xsl:with-param name="rowId" select="$tcIterationID" />
            <xsl:with-param name="logId" select="$tcIterationLogId" />
            <xsl:with-param name="imageId" select="$tcIterationImageId" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="@IsSystemTask='true'">
          <xsl:call-template name="TCStepTemplate">
            <xsl:with-param name="rowId" select="$tcIterationID" />
            <xsl:with-param name="logId" select="$tcIterationLogId" />
            <xsl:with-param name="imageId" select="$tcIterationImageId" />
          </xsl:call-template>
        </xsl:when>        
        <xsl:otherwise>
          <xsl:call-template name="TaskTemplate">
            <xsl:with-param name="rowId" select="$tcIterationID" />
            <xsl:with-param name="logId" select="$tcIterationLogId" />
            <xsl:with-param name="imageId" select="$tcIterationImageId" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="TaskTemplate">
    <xsl:param name="rowId"></xsl:param>
    <xsl:param name="logId"></xsl:param>
    <xsl:param name="imageId"></xsl:param>
    
    <xsl:variable name="taskID"><xsl:value-of select="$rowId" />_<xsl:value-of select="@TaskSeq" /></xsl:variable>
    <xsl:variable name="taskLogId"><xsl:value-of select="$logId" />þ<xsl:value-of select="@Name" />þ<xsl:value-of select="@TaskSeq" /></xsl:variable>
    <xsl:variable name="taskImageId"><xsl:value-of select="$imageId" />_<xsl:value-of select="@TaskSeq" /></xsl:variable>
    
    <tr id="{$taskID}" onclick="LoadDetails(this);" title="task" logid="{$taskLogId}">
      <xsl:attribute name="class">child-of-<xsl:value-of select="$rowId"/></xsl:attribute>
	  
	  <!--xsl:call-template name="addLineNumber"/-->
	  <xsl:call-template name="addLineNumber">
		<xsl:with-param name="paramLineNo" select="@LineNumber" />
	  </xsl:call-template>
	  
      <td >
        <img src="Images/task.png"/>
        <b><xsl:value-of select="@Name" /></b>
      </td>
      <td/>
      <td/>
      <td>
        <xsl:choose>
          <xsl:when test="@Status='0'">
            <img src="Images/success.png"/>
          </xsl:when>
          <xsl:when test="@Status='-1'">
            <img src="Images/Not_Executed.png"/>
          </xsl:when>
          <xsl:when test="@Status='2'">
            <img src="Images/Defect.png"/>
          </xsl:when>
          <xsl:otherwise>
            <img src="Images/fail.png"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:value-of select="@ExecutionTime" />
      </td>
    </tr>
    <xsl:for-each select="TaskIteration">
      <xsl:call-template name="TaskIterationTemplate">
        <xsl:with-param name="rowId" select="$taskID" />
        <xsl:with-param name="logId" select="$taskLogId" />
        <xsl:with-param name="imageId" select="$taskImageId" />
      </xsl:call-template>
    </xsl:for-each>
 </xsl:template>

  <xsl:template name="TaskIterationTemplate">
    <xsl:param name="rowId"></xsl:param>
    <xsl:param name="logId"></xsl:param>
    <xsl:param name="imageId"></xsl:param>
    
    <xsl:variable name="tiID"><xsl:value-of select="$rowId" />_<xsl:value-of select="@IterationNo" /></xsl:variable>
    <xsl:variable name="taskIterationLogId"><xsl:value-of select="$logId" />þ<xsl:value-of select="@IterationNo" /></xsl:variable>
    <xsl:variable name="taskIterationImageId"><xsl:value-of select="$imageId" />_<xsl:value-of select="@IterationNo" /></xsl:variable>
    
    <tr id="{$tiID}" onclick="LoadDetails(this);" title="taskIteration" logid="{$taskIterationLogId}">
      <xsl:attribute name="class">child-of-<xsl:value-of select="$rowId"/></xsl:attribute>
	  	<td style="margin-right:12px"></td> <!-- No Line no. to be shown here. -->
      <td >
        <img src="Images/TaskIteration.png"/>
        <xsl:value-of select="@IterationNo" />
      </td>
      <td/>
      <td/>
      <td>
        <xsl:choose>
          <xsl:when test="@Status='0'">
            <img src="Images/success.png"/>
          </xsl:when>
          <xsl:when test="@Status='-1'">
            <img src="Images/Not_Executed.png"/>
          </xsl:when>
          <xsl:when test="@Status='2'">
            <img src="Images/Defect.png"/>
          </xsl:when>
          <xsl:otherwise>
            <img src="Images/fail.png"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:value-of select="@ExecutionTime" />
      </td>
    </tr>   
    <xsl:for-each select="Step">
      <xsl:choose>
        <xsl:when test="@Parent_ID != ''"></xsl:when>
        <xsl:when test="@Action='IF' or @Action ='ELSE IF' or @Action ='ELSE' or @Action ='END IF'">
          <xsl:call-template name="TaskStepConditionTemplate">
            <xsl:with-param name="rowId" select="$tiID" />
            <xsl:with-param name="logId"><xsl:value-of select="$taskIterationLogId" /></xsl:with-param>
            <xsl:with-param name="imageId" select="$taskIterationImageId" />
          </xsl:call-template>
        </xsl:when>        
        <xsl:otherwise>
          <xsl:call-template name="StepTemplate">
            <xsl:with-param name="rowId" select="$tiID" />        
            <xsl:with-param name="logId"><xsl:value-of select="$taskIterationLogId" /></xsl:with-param>
            <xsl:with-param name="imageId" select="$taskIterationImageId" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="StepTemplate">
    <xsl:param name="rowId"></xsl:param>
    <xsl:param name="logId"></xsl:param>
    <xsl:param name="imageId"></xsl:param>   
    
    <xsl:variable name="stepId">step_<xsl:value-of select="$rowId"/>_<xsl:value-of select="@StepSeq" /></xsl:variable>
    <xsl:variable name="stepImageId">step_<xsl:value-of select="$imageId"/>_<xsl:value-of select="@Id" /></xsl:variable>
    <xsl:variable name="stepLogId"><xsl:value-of select="$logId" />þ<xsl:value-of select="@Id" />þ<xsl:value-of select="@Action" /></xsl:variable>

    <tr id="{$stepId}" onclick="LoadDetails(this);" title="step" imageid="{$stepImageId}" imageType="{$IMG_TYPE}" logid="{$stepLogId}">
      <xsl:attribute name="class">child-of-<xsl:value-of select="$rowId"/></xsl:attribute>
	  <!--xsl:call-template name="addLineNumber"/-->

	   <xsl:call-template name="addLineNumber">
		<xsl:with-param name="paramLineNo" select="@LineNumber" />
	  </xsl:call-template>
      
		<xsl:choose>
			<xsl:when test="@ActionState='99'">
				<td style="border-left-width: 1px;text-decoration: line-through;color: purple; font-family: Verdana;">
					<xsl:value-of select="@Action" />
				</td>
			</xsl:when>
			<!--<xsl:when test="@ActionState='1'">		
				<td style="border-left-width: 1px;color: #3A75B0; font-family: Verdana;">
					<xsl:value-of select="@Action" />
				</td>
			</xsl:when>-->
			<xsl:otherwise>
				<td>
					<xsl:value-of select="@Action" />
				</td>
			</xsl:otherwise>
		</xsl:choose>
      
      <td style="word-wrap: break-word;">
        <xsl:for-each select="Param">
          <xsl:call-template name="ParamTemplate"/>
        </xsl:for-each>
      </td>
      <td>
        <xsl:value-of select="@object" />
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="@Status='0'">
            <img src="Images/success.png"/>
          </xsl:when>
          <xsl:when test="@Status='-1'">
            <img src="Images/Not_Executed.png"/>
          </xsl:when>
          <xsl:when test="@Status='2'">
            <img src="Images/Defect.png"/>
          </xsl:when>
          <xsl:otherwise>
            <img src="Images/fail.png"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:value-of select="@ExecutionTime" />
      </td>
    </tr>   
  </xsl:template>

  <xsl:template name="TaskStepConditionTemplate">
    <xsl:param name="rowId"></xsl:param>
    <xsl:param name="logId"></xsl:param>
    <xsl:param name="imageId"></xsl:param>
    
    <xsl:variable name="stepId">step_<xsl:value-of select="$rowId"/>_<xsl:value-of select="@StepSeq" /></xsl:variable>
    <xsl:variable name="stepImageId">step_<xsl:value-of select="$imageId"/>_<xsl:value-of select="@StepSeq" /></xsl:variable>
    <xsl:variable name="stepLogId"><xsl:value-of select="$logId" />þ<xsl:value-of select="@Id" />þ<xsl:value-of select="@Action" /></xsl:variable>

    <xsl:variable name="parentId"><xsl:value-of select="@Id" /></xsl:variable>
    
    <tr id="{$stepId}" onclick="LoadDetails(this);" title="step" imageid="{$stepImageId}" logid="{$stepLogId}" condition="condition">
      <xsl:attribute name="class">child-of-<xsl:value-of select="$rowId"/></xsl:attribute>
	  <!--xsl:call-template name="addLineNumber"/-->
	  <xsl:call-template name="addLineNumber">
		<xsl:with-param name="paramLineNo" select="@LineNumber" />
	  </xsl:call-template>
	  
      <td >
        <xsl:value-of select="@Action" /><xsl:call-template name="TaskStepExpressionTemplate"/>
      </td>     
      <td style="word-wrap: break-word;">
        <xsl:for-each select="Param">
          <xsl:call-template name="ParamTemplate"/>
        </xsl:for-each>
      </td>
      <td>
        <xsl:value-of select="@object" />
      </td>
      <td>
      </td>
      <td>
        <xsl:value-of select="@ExecutionTime" />
      </td>
    </tr>
    <xsl:for-each select="following-sibling::Step[@Parent_ID=$parentId]">
      <xsl:choose>
        <xsl:when test="@Action ='IF' or @Action ='ELSE IF' or @Action ='ELSE' or @Action ='END IF'">
          <xsl:call-template name="TaskStepConditionTemplate">
            <xsl:with-param name="rowId" select="$stepId" />
            <xsl:with-param name="logId" select="$logId" />
            <xsl:with-param name="imageId" select="$imageId" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="StepTemplate">
            <xsl:with-param name="rowId" select="$stepId" />
            <xsl:with-param name="logId" select="$logId" />
            <xsl:with-param name="imageId" select="$imageId" />
          </xsl:call-template>
        </xsl:otherwise>
       </xsl:choose>
     </xsl:for-each>
  </xsl:template>

  <xsl:template name="TCStepTemplate">
    <xsl:param name="rowId"></xsl:param>
    <xsl:param name="logId"></xsl:param>
    <xsl:param name="imageId"></xsl:param>
    
    <xsl:variable name="taskID"><xsl:value-of select="$rowId" />_<xsl:value-of select="@TaskSeq" /></xsl:variable>
    <xsl:variable name="taskLogId"><xsl:value-of select="$logId" />þ<xsl:value-of select="@Name" />þ<xsl:value-of select="@TaskSeq" />þ<xsl:value-of select="TaskIteration/@IterationNo" />þ<xsl:value-of select="TaskIteration/Step/@Id" />þ<xsl:value-of select="TaskIteration/Step/@Action" /></xsl:variable>
    <xsl:variable name="taskImageId">step_<xsl:value-of select="$imageId" />_<xsl:value-of select="@TaskSeq" />_<xsl:value-of select="TaskIteration/@IterationNo" />_<xsl:value-of select="TaskIteration/Step/@Id" /></xsl:variable>

    <xsl:variable name="parentId"><xsl:value-of select="@Id" /></xsl:variable>
    
    <tr id="{$taskID}" onclick="LoadDetails(this);" title="step" logid="{$taskLogId}" imageid="{$taskImageId}" imageType="{$IMG_TYPE}">
      <xsl:attribute name="class">child-of-<xsl:value-of select="$rowId"/></xsl:attribute>
	  <!--xsl:call-template name="addLineNumber"/-->
	  
		<!--xsl:call-template name="addLineNumber"/-->
	  <xsl:call-template name="addLineNumber">
		<xsl:with-param name="paramLineNo" select="TaskIteration/Step/@LineNumber" />
	  </xsl:call-template>
	  
	  <xsl:choose>
		<xsl:when test="(TaskIteration/Step[@ActionState='99'])">
			<td style="border-left-width: 1px;text-decoration: line-through;color: purple; font-family: Verdana;">
				<xsl:value-of select="TaskIteration/Step/@Action" />
			</td>
		</xsl:when>
		<!--<xsl:when test="(TaskIteration/Step[@ActionState='1'])">		
		  <td style="border-left-width: 1px;color: #3A75B0; font-family: Verdana;">
			<xsl:value-of select="TaskIteration/Step/@Action" />
			</td>
		</xsl:when>-->
		<xsl:otherwise>
			<td>
				<xsl:value-of select="TaskIteration/Step/@Action" />
			</td>
		</xsl:otherwise>		  
	  </xsl:choose>
      <td style="word-wrap: break-word;">
        <xsl:for-each select="TaskIteration/Step/Param">
          <xsl:call-template name="ParamTemplate"/>
        </xsl:for-each>
      </td>
      <td>
        <xsl:value-of select="TaskIteration/Step/@object" />
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="@Status='0'">
            <img src="Images/success.png"/>
          </xsl:when>
          <xsl:when test="@Status='-1'">
            <img src="Images/Not_Executed.png"/>
          </xsl:when>
          <xsl:when test="@Status='2'">
            <img src="Images/Defect.png"/>
          </xsl:when>
          <xsl:otherwise>
            <img src="Images/fail.png"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:value-of select="@ExecutionTime" />
      </td>
    </tr>
  </xsl:template>

  
  <xsl:template name="TCStepConditionTemplate">
    <xsl:param name="rowId"></xsl:param>
    <xsl:param name="logId"></xsl:param>
    <xsl:param name="imageId"></xsl:param>

    <xsl:variable name="taskID"><xsl:value-of select="$rowId" />_<xsl:value-of select="@TaskSeq" /></xsl:variable>
    <xsl:variable name="taskLogId"><xsl:value-of select="$logId" />þ<xsl:value-of select="@Name" />þ<xsl:value-of select="@TaskSeq" />þ<xsl:value-of select="TaskIteration/@IterationNo" />þ<xsl:value-of select="TaskIteration/Step/@Id" />þ<xsl:value-of select="TaskIteration/Step/@Action" /></xsl:variable>
    <xsl:variable name="taskImageId">step_<xsl:value-of select="$imageId" />_<xsl:value-of select="@TaskSeq" />_<xsl:value-of select="TaskIteration/@IterationNo" />_<xsl:value-of select="TaskIteration/Step/@StepSeq" /></xsl:variable>

    <xsl:variable name="parentId">
      <xsl:value-of select="@Id" />
    </xsl:variable>

    <tr id="{$taskID}" onclick="LoadDetails(this);" title="step" logid="{$taskLogId}" imageid="{$taskImageId}" condition="condition">
      <xsl:attribute name="class">child-of-<xsl:value-of select="$rowId"/></xsl:attribute>
      <!--xsl:call-template name="addLineNumber"/-->
	  
		<xsl:call-template name="addLineNumber">
			<xsl:with-param name="paramLineNo" select="TaskIteration/Step/@LineNumber" />
		</xsl:call-template>	
	  
	  <td >
        <xsl:value-of select="TaskIteration/Step/@Action" />
        <xsl:call-template name="TCStepExpressionTemplate"/>
      </td>
      <td style="word-wrap: break-word;">
        <xsl:for-each select="TaskIteration/Step/Param">
          <xsl:call-template name="ParamTemplate"/>
        </xsl:for-each>
      </td>
      <td>
        <xsl:value-of select="TaskIteration/Step/@object" />
      </td>
      <td>
      </td>
      <td>
        <xsl:value-of select="@ExecutionTime" />
      </td>
    </tr>
    <xsl:for-each select="following-sibling::Task[@ParentID=$parentId]">
      <xsl:choose>
        <xsl:when test="@IsSystemTask='true' and (TaskIteration/Step/@Action ='IF' or TaskIteration/Step/@Action ='ELSE IF' or TaskIteration/Step/@Action ='ELSE' or TaskIteration/Step/@Action ='END IF')">
          <xsl:call-template name="TCStepConditionTemplate">
            <xsl:with-param name="rowId" select="$taskID" />
            <xsl:with-param name="logId" select="$logId" />
            <xsl:with-param name="imageId" select="$imageId" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="@IsSystemTask='true'">
          <xsl:call-template name="TCStepTemplate">
            <xsl:with-param name="rowId" select="$taskID" />
            <xsl:with-param name="logId" select="$logId" />
            <xsl:with-param name="imageId" select="$imageId" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="TaskTemplate">
            <xsl:with-param name="rowId" select="$taskID" />
            <xsl:with-param name="logId" select="$logId" />
            <xsl:with-param name="imageId" select="$imageId" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="ParamTemplate">
   <xsl:value-of select="@Name" />(<xsl:value-of select="." />)
  </xsl:template>

  <xsl:template name="TaskStepExpressionTemplate">
    <xsl:if test="Param[. != '']">
      (<xsl:value-of select="." />)
    </xsl:if>
  </xsl:template>

  <xsl:template name="TCStepExpressionTemplate">
    <xsl:if test="TaskIteration/Step/Param[. != '']">
      (<xsl:value-of select="TaskIteration/Step/Param" />)
    </xsl:if>
  </xsl:template>
  
  <!-- Added this for showing line numbers -->
  <xsl:template name="addLineNumber">
	<xsl:param name="paramLineNo"></xsl:param>
	
	<td style="margin-right:5px; border-left-width: 1px;">
		<xsl:if test="$paramLineNo != ''">
          <xsl:value-of select="$paramLineNo" />
        </xsl:if>
	</td>
  </xsl:template>
  
</xsl:stylesheet>
