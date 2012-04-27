package de.hopa.util.yaul
{
	import de.hopa.yaul.text.decreaseFontSizeToFitInTextField;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;

	public class DecreaseFontSizeToFitInTextFieldTest
	{
		private var textFormat : TextFormat;
		private var textField : TextField;

		[Before]
		public function run_before_every_test() : void
		{
			textFormat = new TextFormat();
			textFormat.size = 25;

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
		public function test_decrease_font_size_with_minimal_font_size_and_long_text() : void
		{
			textField.text = "Test text for testing";
			
			var operationResult : Boolean = decreaseFontSizeToFitInTextField( textField, 16, textField.width, textField.height );
			var finalFontSize : uint = int( textField.getTextFormat().size );

			assertEquals( "unexpected font size", 16, finalFontSize );
			assertFalse( "unexpected operation result", operationResult );
		}
		
		[Test]
		public function test_decrease_font_size_with_minimal_font_size_and_short_text() : void
		{
			textField.text = "Testing";
			
			var operationResult : Boolean = decreaseFontSizeToFitInTextField( textField, 15, textField.width, textField.height );
			var finalFontSize : uint = int( textField.getTextFormat().size );

			assertEquals( "unexpected font size", 17, finalFontSize );
			assertTrue( "unexpected operation result", operationResult );
		}
		
		[Test]
		public function test_decrease_font_size_with_small_minimal_fons_size() : void
		{
			textField.text = "Test text for testing is everywhere in the word !!!";
			
			var operationResult : Boolean = decreaseFontSizeToFitInTextField( textField, 1, textField.width, textField.height );
			var finalFontSize : uint = int( textField.getTextFormat().size );

			assertEquals( "unexpected font size", 2, finalFontSize );
			assertTrue( "unexpected operation result", operationResult );
		}
		
		[Test]
		public function test_decrease_font_size_without_text() : void
		{
			var operationResult : Boolean = decreaseFontSizeToFitInTextField( textField, 10, textField.width, textField.height );
			var finalFontSize : uint = int( textField.getTextFormat().size );

			assertEquals( "unexpected font size", 0, finalFontSize );
			assertTrue( "unexpected operation result", operationResult );
		}
	}
}