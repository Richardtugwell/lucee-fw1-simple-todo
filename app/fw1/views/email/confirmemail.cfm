<cfoutput>
<p>Thanks for registering with Intelligent Ranking</p>

<p>Please confirm your email address by clicking the following link:</p>

<p>
	<a href="http://#CGI.http_host##buildURL(action = 'main.confirmemail' , queryString = {token = rc.token } )#">http://#CGI.http_host##buildURL(action = 'main.confirmemail' , queryString = {token = rc.token } )#</a>
</p>
</cfoutput>