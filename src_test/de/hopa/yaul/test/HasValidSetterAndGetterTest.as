package de.hopa.yaul.test
{
	import de.hopa.yaul.browser.BrowserVersion;

	import org.flexunit.assertThat;
	import org.flexunit.rules.IMethodRule;
	import org.mockito.integrations.flexunit4.MockitoRule;

	public class HasValidSetterAndGetterTest
	{
		[Rule]
		public var mockitoRule : IMethodRule = new MockitoRule();

		[Mock]
		public var browserVersion : BrowserVersion;
		

		[Test]
		public function test_should_get_and_set_properties_for_all_properties() : void
		{
			assertThat( new SetterGetterDummyObject(), hasValidSettersAndGetters() );
		}
		
		[Test]
		public function test_should_get_and_set_properties_for_specific_properties() : void
		{
			assertThat( new SetterGetterDummyObject(), hasValidSettersAndGettersFor( "fieldC", "fieldE" ) );
		}

		[Test]
		public function test_should_get_and_set_properties_with_excluding_properties() : void
		{
			assertThat( new SetterGetterDummyObject(), hasValidSettersAndGettersExcluding( "fieldA", "fieldB") );
		}
	}
}