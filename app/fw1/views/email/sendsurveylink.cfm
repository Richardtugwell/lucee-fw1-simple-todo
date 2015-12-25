<cfoutput>
<p>We received a request to access the following survey</p>

<h4>#rc.survey.name#</h4>

<p>Here is your personal link to the survey. Please do not share it with anyone - otherwise your results will be over-written!</p>

<p>
	<a href="http://#CGI.http_host##buildURL(action = 'survey.render' , queryString = {token = rc.token } )#">http://#CGI.http_host##buildURL(action = 'main.confirmemail' , queryString = {token = rc.token } )#</a>
</p>
</cfoutput>