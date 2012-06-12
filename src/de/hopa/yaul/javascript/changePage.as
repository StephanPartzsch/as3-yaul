package de.hopa.yaul.javascript
{
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	public function changePage( url : String, window : String = "_blank" ) : void
	{
		var request : URLRequest = new URLRequest( url );
		
		if ( !ExternalInterface.available )
		{
			try
			{
				navigateToURL( request, window );
			}
			catch ( er : Error )
			{
				trace( "Error occurred! " + er.message );
			}
		}
		else
		{
			var userAgentName : String = String( ExternalInterface.call( "function() { return navigator.userAgent; }" ) ).toLowerCase();
			var isFirefox : Boolean = userAgentName.indexOf( "firefox" ) != -1;
			var isInternetExplorer : Boolean = userAgentName.indexOf( "msie" ) != -1;
			var internetExplorerVersion : uint = uint( userAgentName.substr( userAgentName.indexOf( "msie" ) + 5, 3 ) );
			
			if ( isFirefox || ( isInternetExplorer && internetExplorerVersion >= 7 ) )
			{
				ExternalInterface.call( "window.open", request.url, window );
			}
			else
			{
				try
				{
					navigateToURL( request, window );
				}
				catch ( er : Error )
				{
					trace( "Error occurred! " + er.message );
				}
			}
		}
	}
}