package suite
{
	import de.hopa.yaul.test.HasValidSetterAndGetterExcludingMatcherTest;
	import de.hopa.yaul.test.HasValidSetterAndGetterForMatcherTest;
	import de.hopa.yaul.test.HasValidSetterAndGetterTest;
	import de.hopa.yaul.test.SetterGetterInvokerTest;
	import de.hopa.yaul.test.ValueFactoryTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TestUtilTestSuite
	{
		public var valueFactoryTest : ValueFactoryTest;
		public var setterGetterInvokerTest : SetterGetterInvokerTest;
		public var hasValidSetterAndGetterTest : HasValidSetterAndGetterTest;
		public var hasValidSetterAndGetterForMatcherTest : HasValidSetterAndGetterForMatcherTest;
		public var hasValidSetterAndGetterExcludingMatcherTest : HasValidSetterAndGetterExcludingMatcherTest;
	}
}