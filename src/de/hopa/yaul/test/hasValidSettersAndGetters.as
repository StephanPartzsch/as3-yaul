package de.hopa.yaul.test
{
	import org.hamcrest.Matcher;

	public function hasValidSettersAndGetters() : Matcher
	{
		return new HasValidSettersAndGettersExcludingMatcher( [] );
	}
}