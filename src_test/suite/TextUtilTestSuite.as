package
suite{
	import de.hopa.util.yaul.CutTextToFitInTextFieldTest;
	import de.hopa.util.yaul.DecreaseFontSizeToFitInTextFieldTest;
	import de.hopa.util.yaul.FitTextInTextFieldTest;
	import de.hopa.util.yaul.TrimTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TextUtilTestSuite
	{
		public var cutTextToFitInTextFieldTest : CutTextToFitInTextFieldTest;
		public var decreaseFontSizeToFitInTextFieldTest : DecreaseFontSizeToFitInTextFieldTest;
		public var fitTextInTextFieldTest : FitTextInTextFieldTest;
		public var trimTest : TrimTest;
	}
}