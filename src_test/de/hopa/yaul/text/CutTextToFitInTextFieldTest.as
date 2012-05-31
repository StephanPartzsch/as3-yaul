package de.hopa.yaul.text
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import org.flexunit.asserts.assertEquals;

	public class CutTextToFitInTextFieldTest
	{
		private var textFormat : TextFormat;
		private var textField : TextField;

		[Before]
		public function run_before_every_test() : void
		{
			textFormat = new TextFormat();
			textFormat.size = 12;

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
		public function test_cut_name_with_long_name() : void
		{
			textField.text = "Hans Wuerstchen"; 
			cutTextToFitInTextField( textField, textField.width, textField.height );

			var expectedText : String = "Hans W...";
			var cuttedText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, cuttedText );
		}

		[Test]
		public function test_cut_name_with_short_name() : void
		{
			textField.text = "Hans";
			cutTextToFitInTextField( textField, textField.width, textField.height );

			var expectedText : String = "Hans";
			var cuttedText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, cuttedText );
		}

		[Test]
		public function test_cut_name_with_no_name() : void
		{
			textField.text = "";
			cutTextToFitInTextField( textField, textField.width, textField.height );

			var expectedText : String = "";
			var cuttedText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, cuttedText );
		}

		[Test]
		public function test_cut_name_with_numbers() : void
		{
			textField.text = "123456789";
			cutTextToFitInTextField( textField, textField.width, textField.height );

			var expectedText : String = "123456...";
			var cuttedText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, cuttedText );
		}
	}
}