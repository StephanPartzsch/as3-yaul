package de.hopa.yaul.test
{
	import org.hamcrest.Matcher;

	public function hasValidSetterAndGetterExcluding( ... fields ) : Matcher
	{
		return new HasValidSetterAndGetterExcludingMatcher( fields );
	}
}