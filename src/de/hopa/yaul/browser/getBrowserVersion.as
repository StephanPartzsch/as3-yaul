package de.hopa.yaul.browser
{
	import flash.external.ExternalInterface;

	public function getBrowserVersion() : BrowserVersion
	{
		var browserVersionFunction : XML = <![CDATA[
			function( ) 
			{ 
				return {	appCodeName:navigator.appCodeName, 
							appName:navigator.appName,
							appVersion:navigator.appVersion,
							cookieEnabled:navigator.cookieEnabled,
							platform:navigator.platform,
							userAgent:navigator.userAgent
						};
			}
		]]>;

		if ( !ExternalInterface.available )
			return null;
			
		var navigator : Object = ExternalInterface.call( browserVersionFunction );
		
		var browserVersion : BrowserVersion = new BrowserVersion();
		browserVersion.appCodeName = navigator["appCodeName"];
		browserVersion.appName = navigator["appName"];
		browserVersion.appVersion = navigator["appVersion"];
		browserVersion.cookieEnabled = navigator["cookieEnabled"];
		browserVersion.platform = navigator["platform"];
		browserVersion.userAgent = navigator["userAgent"];
		
		return browserVersion;
	}
}