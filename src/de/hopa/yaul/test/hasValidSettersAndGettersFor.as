package de.hopa.yaul.test
{
	import org.hamcrest.Matcher;

	public function hasValidSettersAndGettersFor( ... fields ) : Matcher
	{
		return new HasValidSettersAndGettersForMatcher( fields );
	}
}