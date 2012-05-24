package suite
{
	import de.hopa.yaul.test.SetterGetterInvokerTest;
	import de.hopa.yaul.test.ValueFactoryTest;
	import de.hopa.yaul.test.HasValidSetterAndGetterTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TestUtilTestSuite
	{
		public var valueFactoryTest : ValueFactoryTest;
		public var setterGetterInvokerTest : SetterGetterInvokerTest;
		public var hasValidSetterAndGetterTest : HasValidSetterAndGetterTest;
	}
}