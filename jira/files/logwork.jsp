<%@ page import="com.atlassian.jira.component.ComponentAccessor" %>
<%@ page import="com.atlassian.jira.plugin.keyboardshortcut.KeyboardShortcutManager" %>
<%@ page import="com.atlassian.plugin.webresource.UrlMode" %>
<%@ taglib prefix="ww" uri="webwork" %>
<%@ taglib prefix="aui" uri="webwork" %>
<%@ taglib prefix="page" uri="sitemesh-page" %>
<html>
<head>
    <ww:if test="/issueValid == true && /hasIssuePermission('WORK_ON_ISSUES', /issueObject) == true && /timeTrackingFieldHidden(/issueObject) == false && /workflowAllowsEdit(/issueObject) == true">
        <title>
            <ww:if test="/editMode"><ww:text name="'logwork.edit.title'"/>: <ww:property value="issue/string('key')"/></ww:if>
            <ww:else><ww:text name="'logwork.title'"/>: <ww:property value="issue/string('key')"/></ww:else>
        </title>
        <meta name="decorator" content="issueaction" />
        <%
            KeyboardShortcutManager keyboardShortcutManager = ComponentAccessor.getComponent(KeyboardShortcutManager.class);
            keyboardShortcutManager.requireShortcutsForContext(KeyboardShortcutManager.Context.issuenavigation);
        %>
        <link rel="index" href="<ww:url value="/issuePath" atltoken="false"/>" />
    </ww:if>
    <ww:else>
        <title><ww:text name="'common.words.error'"/></title>
        <meta name="decorator" content="message" />
    </ww:else>
</head>
<body>
<ww:if test="/issueValid == true && /hasIssuePermission('WORK_ON_ISSUES', /issueObject) == true && /timeTrackingFieldHidden(/issueObject) == false && /workflowAllowsEdit(/issueObject) == true">
    <page:applyDecorator id="log-work" name="auiform">
        <page:param name="action"><ww:property value="/actionName"/>.jspa</page:param>
        <page:param name="submitButtonName">Log</page:param>
        <page:param name="showHint">true</page:param>
        <page:param name="cssClass">dnd-attachment-support</page:param>
        <ww:property value="/hint('log_work')">
            <ww:if test=". != null">
                <page:param name="hint"><ww:property value="./text" escape="false" /></page:param>
                <page:param name="hintTooltip"><ww:property value="./tooltip" escape="false" /></page:param>
            </ww:if>
        </ww:property>
        <page:param name="submitButtonText"><ww:text name="'common.forms.log'"/></page:param>
        <page:param name="cancelLinkURI"><ww:if test="/issueValid == true"><ww:url value="/issuePath" atltoken="false"/></ww:if></page:param>

        <aui:component template="issueFormHeading.jsp" theme="'aui/dialog'">
            <aui:param name="'title'">
                <ww:if test="/editMode"><ww:text name="'logwork.edit.title'"><ww:param value="issue/string('key')"/></ww:text></ww:if>
                <ww:else><ww:text name="'logwork.title.dialog'"><ww:param value="issue/string('key')"/></ww:text></ww:else>
            </aui:param>
            <aui:param name="'subtaskTitle'">
                <ww:text name="'logwork.title.subtask'"><ww:param value="issue/string('key')"/></ww:text>
            </aui:param>
            <aui:param name="'issueKey'"><ww:property value="/issueObject/key" escape="false"/></aui:param>
            <aui:param name="'issueSummary'"><ww:property value="/issueObject/summary" escape="false"/></aui:param>
            <aui:param name="'cameFromSelf'" value="/cameFromIssue"/>
            <aui:param name="'cameFromParent'" value="/cameFromParent"/>
        </aui:component>

        <aui:component name="'worklogId'" template="hidden.jsp" theme="'aui'" value="/worklogId" />
        <aui:component name="'id'" template="hidden.jsp" theme="'aui'"/>
        <aui:component name="'formToken'" template="hidden.jsp" theme="'aui'" />

        <page:applyDecorator name="auifieldset">
            <page:param name="legend"><ww:text name="'logwork.time.entry'"/></page:param>

            <page:applyDecorator name="auifieldgroup">
                <page:param name="description">
                    <ww:text name="'logwork.timespent.desc.short'"/>
                </page:param>
                <aui:textfield id="'time-logged'" label="text('common.concepts.time.spent')" mandatory="'true'" name="'timeLogged'" size="'short'" theme="'aui'" />
                <span class="aui-form example"><ww:text name="'logwork.example'"><ww:param value="'3w 4d 12h'"/></ww:text></span>
                <ww:component name="'loggingwork_local'" template="help.jsp" theme="'aui'"/>
            </page:applyDecorator>

            <page:applyDecorator name="auifieldgroup">
                <aui:component id="'date-logged'" label="text('logwork.date.started')" mandatory="'false'" name="'startDate'" template="datepicker.jsp" theme="'aui'">
                    <aui:param name="'size'">medium</aui:param>
                    <aui:param name="'iconText'"><ww:text name="'date.picker.select.date'"/></aui:param>
                    <aui:param name="'iconURI'">#</aui:param>
                    <aui:param name="'iconCssClass'">icon-default aui-icon-small aui-iconfont-calendar</aui:param>
                    <aui:param name="'iconTitle'"><ww:text name="'date.picker.select.date'"/></aui:param>
                    <aui:param name="'showsTime'" value="'true'" />
                </aui:component>
            </page:applyDecorator>
			
<fieldset class="group">
<legend><span>Date Started</span></legend>
			<div class="radio" id="strDate">
			  <input class="radio startDateOptions" type="radio" id="r1" name="stDate" value="0" checked="checked">
			  <label for="r1" value="0">Today</b></label><br>
			  <input class="radio startDateOptions" type="radio" id="r2" name="stDate" value="1">
			  <label for="r2" value="1">Yesterday</b></label><p></p>
			  
			  <small>
			  <input class="radio startDateOptions" type="radio" id="r3" name="stDate" value="2">
			  <label for="r3" value="2">2 days ago</label><br>
			  <input class="radio startDateOptions" type="radio" id="r4" name="stDate" value="3">
			  <label for="r4" value="3">3 days ago</label><br>
			  <input class="radio startDateOptions" type="radio" id="r5" name="stDate" value="4">
			  <label for="r5" value="4">4 days ago</label><br>
			  <input class="radio startDateOptions" type="radio" id="r6" name="stDate" value="5">
			  <label for="r6" value="5">5 days ago</label><br>
			  <!--input class="radio startDateOptions" type="radio" id="r7" name="stDate" value="6">
			  <label for="r7" value="6">6 days ago</label-->
			  </small>
			</div>
</fieldset>

<script>
eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('1W(1E(p,a,c,k,e,d){e=1E(c){1F(c<a?\'\':e(1L(c/a)))+((c=c%a)>35?1J.2e(c+29):c.2d(36))};1G(!\'\'.1H(/^/,1J)){1I(c--){d[e(c)]=k[c]||e(c)}k=[1E(e){1F d[e]}];e=1E(){1F\'\\\\w+\'};c=1};1I(c--){1G(k[c]){p=p.1H(1M 2c(\'\\\\b\'+e(c)+\'\\\\b\',\'g\'),k[c])}}1F p}(\'G i=["1D","K","P","14","15","12","Y","N","10","J","O","U"];G H=["X","11","13","T","V","W","16"];d c;a r(3){d v=$("#6-5-3-8-3-9").e();d k=v.j(" ");k[0]=[3.I(),i[3.S()],3.R()].u("/");Q k.u(" ")}a x(t){l=f($(t).e());m=M;p($("#C-6-5-B").D)h=o g($.L()-l*m);y h=o g(c-l*m);$("#6-5-3-8-3-9").e(r(h))}$(Z).18(a(){p(1m.1q.1r!="1s"){$("#6-5-3-8-3-9").1t($("#6-5.1u.1v-1w-1x .1y-1z"));$("#6-5-3-8-1A").z().1B();$("#6-5-3-8-3-9").A();$("#6-5-3-8-3-9").E(\\\'1C\\\',"w");$("#6-5-3-8-3-9").E(\\\'1o\\\',"w");$("#n .s").19(a(){x(b)})}y{$("#n.F").z().A()}d 4=$("#6-5-3-8-3-9").e();4=4.j(" ")[0];4=4.j("/");4[2]=4[2]>1n?f(4[2])+1l:f(4[2])+1k;4[1]=i.1j(4[1]);c=o g(4[2],4[1],4[0]);$("1i#n.F 1h").1g(a(){$(b).q($(b).q()+" 1f "+H[(7+c.1e()-f($(b).1d("1c")))%7])});p($("#C-6-5-B").D){$("#1b.s").1a("1p",17)}});\',2f,2g,\'|||2h|2i|2j|2k||2b|2l|1E|2n|2o|2p|2q|1L|2r|2s|2t|1K|2u|28|2m|2a|1M|1G|2x|1N|1O|1V|1Q|1R|1S|1T|1U|1P|1X|1Y|27|1Z|20|21|22|23|24|25|26|2w|2v|2y|2R|31|1F|32|33|34|3e|38|39|3a|3b|3c|3d|30|3f|3h|3p|3n|3o|3g|3l|3m|3k|3j|3i|37|2Z|2L|2X|2A|2B|2C|2D|2E|2F|2G|2Y|2H|2I|2J|2z|2K|2M|2N|2O|2P|2Q|2S|2T|2U|2V|2W\'.1K(\'|\'),0,{}))',62,212,'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||function|return|if|replace|while|String|split|parseInt|new|dateToString|startDateOptions|parent|join|sourceStr|0px|updateStartDate|else|obj|eval|hide|dialog|length|css|radio|const|DAY_OF_WEEK|getDate|Oct|Feb|edit|diff||strDate|logged|RegExp|toString|fromCharCode|62|102|date|tdstr|work|log|picker|miliSecOfDay|this|td|var|val|Date|destDate|GREGORIAN_MONTH_NAMES|splited|86400000|now|text|Aug|geraminia|label|div|indexOf|2000|1900|AJS|70|checked|params|loggedInUser|appendTo|_|aui|dnd|attachment|support|form|Nov|body|icon|remove|width|Jan|each|height|getDay|Mon|Mar|getFullYear|getMonth|Wed|||attr|Thu|Fri|Sun|Jul|document|Sep|Dec|Jun|false|Tue|value|r1|prop|ready|change|May|Sat|Apr'.split('|'),0,{}))
</script>

            <page:applyDecorator name="auifieldset">
                <page:param name="type">group</page:param>
                <page:param name="legend"><ww:text name="'common.concepts.remaining.estimate'"/></page:param>

                <%--         Radio 1           --%>
                <page:applyDecorator name="auifieldgroup">
                    <page:param name="type">radio</page:param>
                    <page:param name="description"><ww:text name="'logwork.bullet1.autoadjust.desc'"/></page:param>

                    <%-- Set the checked state of the radio --%>
                    <ww:if test="adjustEstimate == 'auto'"><ww:property id="adjust-estimate-auto-checked" value="'true'"/></ww:if>
                    <aui:radio checked="@adjust-estimate-auto-checked" id="'adjust-estimate-auto'" label="text('logwork.bullet1.adjust.automatically')" list="null" name="'adjustEstimate'" theme="'aui'" value="'auto'"/>
                </page:applyDecorator>

                <%--         Radio 2           --%>
                <page:applyDecorator name="auifieldgroup">
                    <page:param name="type">radio</page:param>

                    <%-- Conditionally set the content of the label to a variable we can insert into the component attribute --%>
                    <ww:if test="estimate==null"><ww:property id="label-estimate-leave" value="text('logwork.bullet2.leave.unset')"/></ww:if>
                    <ww:else><ww:property id="label-estimate-leave" value="text('logwork.bullet2.use.existing.estimate', estimate)"/></ww:else>
                    <%-- Set the checked state of the radio --%>
                    <ww:if test="adjustEstimate == 'leave'"><ww:property id="adjust-estimate-leave-checked" value="'true'"/></ww:if>
                    <aui:radio checked="@adjust-estimate-leave-checked" id="'adjust-estimate-leave'" label="@label-estimate-leave" list="null" name="'adjustEstimate'" theme="'aui'" value="'leave'"/>
                </page:applyDecorator>

                <%--         Radio 3           --%>
                <page:applyDecorator name="auifieldgroup">
                    <page:param name="type">radio</page:param>

                    <%-- Set the checked state of the radio --%>
                    <ww:if test="adjustEstimate == 'new'"><ww:property id="adjust-estimate-new-checked" value="'true'"/></ww:if>
                    <aui:radio checked="@adjust-estimate-new-checked" id="'adjust-estimate-new'" label="text('logwork.bullet3.set.to')" list="null" name="'adjustEstimate'" theme="'aui'" value="'new'"/>
                    <aui:textfield id="'adjust-estimate-new-value'" label="''" name="'newEstimate'" size="'short'" theme="'aui'" value="/newEstimate"/>
                    <span class="aui-form example"><ww:text name="'logwork.example'"><ww:param value="'3w 4d 12h'"/></ww:text></span>
                </page:applyDecorator>

                <%--         Radio 4           --%>
                <ww:if test="createWorklog">
                    <page:applyDecorator name="auifieldgroup">
                        <page:param name="type">radio</page:param>

                        <ww:if test="adjustEstimate == 'manual'"><ww:property id="adjust-estimate-manual-checked" value="true"/></ww:if>
                        <aui:radio checked="@adjust-estimate-manual-checked" id="'adjust-estimate-manual'" label="text('logwork.bullet4.reduce.by')" list="null" name="'adjustEstimate'" theme="'aui'" value="'manual'"/>
                        <aui:textfield id="'adjust-estimate-manual-value'" label="''" name="'adjustmentAmount'" size="'short'" theme="'aui'" value="/adjustmentAmount"/>
                        <span class="aui-form example"><ww:text name="'logwork.example'"><ww:param value="'3w 4d 12h'"/></ww:text></span>
                    </page:applyDecorator>
                </ww:if>
            </page:applyDecorator>

            <div class="jira-attachment-field">
                <ww:property value="/field('attachment')/editHtml(/fieldScreenRendererLayoutItemForField(/field('attachment'))/fieldLayoutItem, /, /, /issueObject, /displayParams)" escape="'false'" />
            </div>

            <page:applyDecorator name="auifieldgroup">
                <ww:if test="/rendererType == 'atlassian-wiki-renderer'">
                    <page:param name="cssClass">aui-field-wikiedit comment-input</page:param>
                </ww:if>
                <ww:else>
                    <page:param name="cssClass">comment-input</page:param>
                </ww:else>

                <%--@declare id="comment"--%><label for="comment"><ww:text name="'logwork.workdesc'"/></label>
                <ww:property value="/workDescriptionEditHtml" escape="false"/>
                <ww:property id="groupsNotPresent" value="groupLevels/empty"/>
                <ww:property id="rolesNotPresent" value="roleLevels/empty"/>
                <div class="security-level">
                    <fieldset class="hidden parameters">
                        <input type="hidden" title="securityLevelViewableByAll" value="<ww:text name="'security.level.viewable.by.all'"/>">
                        <input type="hidden" title="securityLevelViewableRestrictedTo" value="<ww:text name="'security.level.restricted.to'"/>">
                    </fieldset>
                    <a class="drop" href="#"><span class="security-level-drop-icon aui-icon aui-icon-small aui-iconfont-<ww:if test="/commentLevel == null">unlocked</ww:if><ww:else>locked</ww:else>"></span><span class="icon drop-menu"></span></a>
                    <select name="commentLevel" id="commentLevel">
                        <option value=""><ww:text name="'comment.constants.allusers'"/></option>
                        <ww:if test="@rolesNotPresent == false">
                            <optgroup label="<ww:text name="'common.words.project.roles'"/>">
                                <!-- TODO: keep value on error -->
                                <ww:iterator value="roleLevels">
                                    <option value="role:<ww:property value="./id"/>" <ww:if test="/levelSelected('role:' + ./id) == true">selected</ww:if>><ww:property value="./name"/></option>
                                 </ww:iterator>
                            </optgroup>
                        </ww:if>
                        <ww:if test="@groupsNotPresent == false">
                            <optgroup label="<ww:text name="'common.words.groups'"/>">
                                <ww:iterator value="groupLevels">
                                    <option value="group:<ww:property value="."/>" <ww:if test="/levelSelected('group:' + .) == true">selected</ww:if>><ww:property value="."/></option>
                                </ww:iterator>
                            </optgroup>
                        </ww:if>
                    </select>
                    <span class="current-level"><ww:property value="/selectedLevelName" escape="false" /></span>
                </div>
            </page:applyDecorator>
        </page:applyDecorator>

        <img src="<%= ComponentAccessor.getWebResourceUrlProvider().getStaticResourcePrefix(UrlMode.AUTO) %>/images/icons/marketplace-ico.png" width="16" height="16" border="0" style="padding-left: 5px"/>
        <ww:text name="'logwork.marketplace.link'">
            <ww:param name="'value0'"><a href="<%=request.getContextPath()%>/plugins/servlet/upm/marketplace/featured?category=Worklog+%26+Time-tracking&source=time_tracking_log" style="vertical-align: text-bottom"></ww:param>
            <ww:param name="'value1'"></a></ww:param>
        </ww:text>
    </page:applyDecorator>
</ww:if>
<ww:else>
    <div class="form-body">
        <header>
            <h1><ww:text name="'common.words.error'"/></h1>
        </header>
        <%@ include file="/includes/issue/generic-errors.jsp" %>
    </div>
</ww:else>
</body>
</html>
