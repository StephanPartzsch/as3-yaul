package de.hopa.yaul.test
{
	import org.hamcrest.Matcher;

	public function hasValidSetterAndGetterFor( ... fields ) : Matcher
	{
		return new HasValidSetterAndGetterForMatcher( fields );
	}
}