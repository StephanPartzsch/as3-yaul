package de.hopa.yaul.test
{
	import org.hamcrest.Matcher;

	public function hasValidSettersAndGettersExcluding( ... fields ) : Matcher
	{
		return new HasValidSettersAndGettersExcludingMatcher( fields );
	}
}