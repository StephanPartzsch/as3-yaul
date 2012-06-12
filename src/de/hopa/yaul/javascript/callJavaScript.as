package de.hopa.yaul.javascript
{
	import flash.external.ExternalInterface;

	public function callJavaScript( functionName : String, ...args : * ) : void
	{
		try
		{
			ExternalInterface.call.apply( null, [functionName].concat( args ) );
		}
		catch(error : Error)
		{
			LogContext.getLogger( callJavaScript ).error( "Could not call JavaScript function '{0}'", functionName );
			LogContext.getLogger( callJavaScript ).error( error.message );
		}
	}
}