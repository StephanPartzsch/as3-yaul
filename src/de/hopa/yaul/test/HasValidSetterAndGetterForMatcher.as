package de.hopa.yaul.test
{
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;
	import org.spicefactory.lib.reflect.ClassInfo;

	public class HasValidSetterAndGetterForMatcher extends TypeSafeMatcher
	{
		private var fields : Array;
		private var setterGetterInvoker : SetterGetterInvoker;

		public function HasValidSetterAndGetterForMatcher( fields : Array )
		{
			this.fields = fields;
			
			super( Object );
		}

		public override function matchesSafely( item : Object ) : Boolean
		{
			setterGetterInvoker = new SetterGetterInvoker( item );
			return setterGetterInvoker.invokeSettersAndGettersFor(fields);
		}
		
		public override function describeTo( description : Description ) : void
		{
			description
				.appendText( "Has valid setter and getter for class fields: " )
				.appendValue( fields );
		}
		
		public override function describeMismatch( item : Object, mismatchDescription : Description ) : void
		{
			mismatchDescription
				.appendText( 'Unable to match setter and getter results in class "' + ClassInfo.forInstance( item ).simpleName + '" for field: ' )
				.appendValue( setterGetterInvoker.currentFieldName );
		}
	}
}