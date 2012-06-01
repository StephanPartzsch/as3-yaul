package de.hopa.yaul.test
{
	import org.hamcrest.Matcher;

	public function hasValidSetterAndGetter() : Matcher
	{
		return new HasValidSetterAndGetterExcludingMatcher( [] );
	}
}