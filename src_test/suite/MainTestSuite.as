package suite
{
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MainTestSuite
	{
		public var browserUtilTestSuite : BrowserUtillTestSuite;
		public var testUtilTestSuite : TestUtilTestSuite;
		public var textUtilTestSuite : TextUtilTestSuite;
	}
}
