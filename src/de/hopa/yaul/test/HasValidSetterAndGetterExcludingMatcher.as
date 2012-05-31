package de.hopa.yaul.test
{
	import org.hamcrest.Description;
	import org.hamcrest.TypeSafeMatcher;
	import org.spicefactory.lib.reflect.ClassInfo;

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
			mismatchDescription
				.appendText( 'Unable to match setter and getter results in class "' + ClassInfo.forInstance( item ).simpleName + '" for field: ' )
				.appendValue( setterGetterInvoker.currentFieldName );
		}
	}
}