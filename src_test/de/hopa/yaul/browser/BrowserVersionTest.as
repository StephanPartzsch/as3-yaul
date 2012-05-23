package de.hopa.yaul.browser
{
	import org.flexunit.asserts.assertEquals;

	import flash.external.ExternalInterface;

	public class BrowserVersionTest
	{
		[Test]
		public function test_get_browser_version() : void
		{
			var prepareBrowserVersionTest : XML = <![CDATA[
			function( ) 
			{ 
				__defineGetter__('navigator', 
				function()
				{
	    			return {	appCodeName:"TestAppCodeName", 
								appName:"TestAppName",
								appVersion:"TestAppVersion",
								cookieEnabled:"false",
								platform:"TestPlatform",
								userAgent:"TestUserAgent"
							};
				});
			}
			]]>;

			ExternalInterface.call( prepareBrowserVersionTest );
			
			var browserVersion : BrowserVersion = getBrowserVersion();
			assertEquals( "Unexpected appCodeName property", "TestAppCodeName", browserVersion.appCodeName );
			assertEquals( "Unexpected appName property", "TestAppName", browserVersion.appName );
			assertEquals( "Unexpected appVersion property", "TestAppVersion", browserVersion.appVersion );
			assertEquals( "Unexpected cookieEnabled property", "false", browserVersion.cookieEnabled );
			assertEquals( "Unexpected platform property", "TestPlatform", browserVersion.platform );
			assertEquals( "Unexpected userAgent property", "TestUserAgent", browserVersion.userAgent );
		}
	}
}