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
			var returnedCuttedText : String = cutTextToFitInTextField( textField );

			var expectedText : String = "Hans W...";
			var newTextFieldText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, newTextFieldText );
			assertEquals( "unexpected cutted name", expectedText, returnedCuttedText );
		}

		[Test]
		public function test_cut_name_with_short_name() : void
		{
			textField.text = "Hans";
			var returnedCuttedText : String = cutTextToFitInTextField( textField );

			var expectedText : String = "Hans";
			var newTextFieldText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, newTextFieldText );
			assertEquals( "unexpected cutted name", expectedText, returnedCuttedText );
		}

		[Test]
		public function test_cut_name_with_no_name() : void
		{
			textField.text = "";
			var returnedCuttedText : String = cutTextToFitInTextField( textField );

			var expectedText : String = "";
			var newTextFieldText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, newTextFieldText );
			assertEquals( "unexpected cutted name", expectedText, returnedCuttedText );
		}

		[Test]
		public function test_cut_name_with_numbers() : void
		{
			textField.text = "123456789";
			var returnedCuttedText : String = cutTextToFitInTextField( textField );

			var expectedText : String = "123456...";
			var newTextFieldText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, newTextFieldText );
			assertEquals( "unexpected cutted name", expectedText, returnedCuttedText );
		}

		[Test]
		public function test_cut_name_with_special_target_width() : void
		{
			textField.text = "Hallo Ballo";
			var returnedCuttedText : String = cutTextToFitInTextField( textField, "", true, 30 );

			var expectedText : String = "Hall...";
			var newTextFieldText : String = textField.text;

			assertEquals( "unexpected cutted name", expectedText, newTextFieldText );
			assertEquals( "unexpected cutted name", expectedText, returnedCuttedText );
		}
		
		[Test]
		public function test_cut_name_without_assignation_to_textfield() : void
		{
			var returnedCuttedText : String = cutTextToFitInTextField( textField, "Hans Wuerstchen", false );

			var expectedText : String = "Hans W...";
			var newTextFieldText : String = textField.text;

			assertEquals( "unexpected cutted name", "Hans Wuerstchen", newTextFieldText );
			assertEquals( "unexpected cutted name", expectedText, returnedCuttedText );
		}
	}
}