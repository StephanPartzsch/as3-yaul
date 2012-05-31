package de.hopa.yaul.test
{
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;

	public class HasValidSetterAndGetterForMatcher extends TypeSafeMatcher
	{
		private var fields : Array;

		public function HasValidSetterAndGetterForMatcher( fields : Array )
		{
			this.fields = fields;
			
			super( Object );
		}

		public override function matchesSafely( item : Object ) : Boolean
		{
			var setterGetterInvoker : SetterGetterInvoker = new SetterGetterInvoker( item );
			return setterGetterInvoker.invokeSettersAndGettersFor(fields);
		}
		
		public override function describeTo( description : Description ) : void
		{
			description.appendText( "Unable to match setter and getter results for class fields: " );
			description.appendValue( fields );
		}
	}
}