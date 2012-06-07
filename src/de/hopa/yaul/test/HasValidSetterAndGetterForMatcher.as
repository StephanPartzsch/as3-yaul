package de.hopa.yaul.test
{
	import org.flemit.reflection.Type;
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;

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