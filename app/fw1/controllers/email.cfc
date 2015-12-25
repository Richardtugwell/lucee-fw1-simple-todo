component accessors = true { 

property framework;

	public any function sendSubscriptionRequest( rc  ) {

    mail from="contact@intelligentranking.com" to="contact@intelligentranking.com" subject="Intelligent Ranking Email Subscription"

    {
        WriteOutput("An email subscription request was received from " & rc.email & " on page " & rc.thispage);
    }

    framework.renderdata("JSON" , rc.email);
    }

}