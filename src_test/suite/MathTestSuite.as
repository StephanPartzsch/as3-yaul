package suite
{
	import de.hopa.yaul.math.AbsTest;
	import de.hopa.yaul.math.CeilTest;
	import de.hopa.yaul.math.FloorTest;
	import de.hopa.yaul.math.RoundTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MathTestSuite
	{
		public var absTest : AbsTest;
		public var ceilTest : CeilTest;
		public var floorTest : FloorTest;
		public var roundTest : RoundTest;
	}
}