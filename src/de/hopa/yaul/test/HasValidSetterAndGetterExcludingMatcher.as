package de.hopa.yaul.test
{
	import org.flemit.reflection.Type;
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;

	public class HasValidSetterAndGetterExcludingMatcher extends TypeSafeMatcher
	{
		private var fields : Array;
		private var setterGetterInvoker : SetterGetterInvoker;

		public function HasValidSetterAndGetterExcludingMatcher( fields : Array )
		{
			this.fields = fields;
			
			super( Object );
		}

		public override function matchesSafely( item : Object ) : Boolean
		{
			setterGetterInvoker = new SetterGetterInvoker( item );
			return setterGetterInvoker.invokeSettersAndGettersExcluding( fields );
		}
		
		public override function describeTo( description : Description ) : void
		{
			description
				.appendText( "Has valid setter and getter for class excluding fields: " )
				.appendValue( fields );
		}
		
		public override function describeMismatch( item : Object, mismatchDescription : Description ) : void
		{
			if ( setterGetterInvoker.currentFieldName == "" )
				mismatchDescription
					.appendText( 'Unable to match setter and getter results in class "' + Type.getType( item ).name + '" because testable fields has to be writable and readable!' );
			else
				mismatchDescription
					.appendText( 'Unable to match setter and getter results in class "' + Type.getType( item ).name + '" for field: ' )
					.appendValue( setterGetterInvoker.currentFieldName );
		}
	}
}