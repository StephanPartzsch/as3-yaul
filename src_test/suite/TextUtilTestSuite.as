package suite
{
	import de.hopa.yaul.text.CutTextToFitInTextFieldTest;
	import de.hopa.yaul.text.DecreaseFontSizeToFitInTextFieldTest;
	import de.hopa.yaul.text.FitTextInTextFieldTest;
	import de.hopa.yaul.text.TrimTest;

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