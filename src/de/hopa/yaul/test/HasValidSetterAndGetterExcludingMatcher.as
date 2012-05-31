package de.hopa.yaul.test
{
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;

	public class HasValidSetterAndGetterExcludingMatcher extends TypeSafeMatcher
	{
		private var fields : Array;

		public function HasValidSetterAndGetterExcludingMatcher( fields : Array )
		{
			this.fields = fields;
			
			super( Object );
		}

		public override function matchesSafely( item : Object ) : Boolean
		{
			var setterGetterInvoker : SetterGetterInvoker = new SetterGetterInvoker( item );
			return setterGetterInvoker.invokeSettersAndGettersExcluding( fields );
		}

		public override function describeTo( description : Description ) : void
		{
			description.appendText( "Unable to match setter and getter results for class fields excluding " );
      		description.appendValue( fields );
		}
	}
}
