package de.hopa.yaul.browser
{
	import de.hopa.yaul.test.hasValidSetterAndGetter;
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;

	import flash.external.ExternalInterface;

	public class BrowserVersionTest
	{
		[Test]
		public function test_getter_and_setter() : void
		{
			assertThat( new BrowserVersion(), hasValidSetterAndGetter() );
		}
		
		[Test]
		public function test_get_browser_version() : void
		{
			var prepareBrowserVersionTest : XML = <![CDATA[
			function( ) 
			{ 
				try
				{
					window.__defineGetter__('navigator', 
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
				catch( e )
				{
					navigator.__defineGetter__('appCodeName', 
					function()
					{
		    			return "TestAppCodeName"; 
					});
					
					navigator.__defineGetter__('appName', 
					function()
					{
		    			return "TestAppName"; 
					});
					
					navigator.__defineGetter__('appVersion', 
					function()
					{
		    			return "TestAppVersion"; 
					});
					
					navigator.__defineGetter__('cookieEnabled', 
					function()
					{
		    			return "false"; 
					});
					
					navigator.__defineGetter__('platform', 
					function()
					{
		    			return "TestPlatform"; 
					});
					
					navigator.__defineGetter__('userAgent', 
					function()
					{
		    			return "TestUserAgent"; 
					});
				}
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