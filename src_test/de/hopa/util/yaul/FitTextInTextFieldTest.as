package de.hopa.util.yaul
{
	import de.hopa.yaul.text.fitTextInTextField;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import org.flexunit.asserts.assertEquals;

	public class FitTextInTextFieldTest
	{
		private var textFormat : TextFormat;
		private var textField : TextField;

		[Before]
		public function run_before_every_test() : void
		{
			textFormat = new TextFormat();
			textFormat.size = 22;

			textField = new TextField();
			textField.defaultTextFormat = textFormat;
			textField.width = 50;
		}

		[After]
		public function run_after_every_test() : void
		{
			textFormat = null;
			textField = null;
		}

		[Test]
		public function test_fit_text_for_long_text_and_minmal_font_size() : void
		{
			textField.text = "Hans Hansen rocks the world!";
			fitTextInTextField( textField, 8 );

			var expectedText : String = "Hans Hansen rocks the world!";
			var cuttedText : String = textField.text;
			var finalFontSize : int = int( textField.getTextFormat().size );

			assertEquals( "unexpected cutted name", expectedText, cuttedText );
			assertEquals( "unexpected font size", 8, finalFontSize );
		}

		[Test]
		public function test_fit_text_for_long_text_without_minmal_font_size() : void
		{
			textField.text = "Hans Hansen rocks the world!";
			fitTextInTextField( textField );

			var expectedText : String = "Hans Ha...";
			var cuttedText : String = textField.text;
			var finalFontSize : int = int( textField.getTextFormat().size );

			assertEquals( "unexpected cutted name", expectedText, cuttedText );
			assertEquals( "unexpected font size", 11, finalFontSize );
		}

		[Test]
		public function test_fit_text_for_short_text() : void
		{
			textField.width = 100;
			textField.height = 100;
			textField.text = "Hans";
			fitTextInTextField( textField );

			var expectedText : String = "Hans";
			var cuttedText : String = textField.text;
			var finalFontSize : int = int( textField.getTextFormat().size );

			assertEquals( "unexpected cutted name", expectedText, cuttedText );
			assertEquals( "unexpected font size", 22, finalFontSize );
		}
	}
}