package de.hopa.ui.dynamictextfield.example
{
	import de.hopa.yaul.text.fitTextInTextField;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class DynamicTextExample extends Sprite
	{
		public function DynamicTextExample()
		{
			createTextFieldForNormalText();
			createTextFieldForDynamicTextOne();
			createTextFieldForDynamicTextTwo();
		}

		private function createTextFieldForNormalText() : void
		{
			var textFormat : TextFormat = new TextFormat();
			textFormat.color = 0x0066ff;
			textFormat.font = "Arial";
			textFormat.size = 14;
						
			var textField : TextField = new TextField();
			textField.width = 200;
			textField.height = 30;
			
			textField.background = true;
			textField.backgroundColor = 0xdddddd;
			textField.defaultTextFormat = textFormat;
			textField.multiline = false;
			textField.selectable = false;
			textField.wordWrap = false;
			textField.text = "Weit hinten, hinter den Wortbergen!";
						
			addChild(textField);
		}

		private function createTextFieldForDynamicTextOne() : void
		{
			var textFormat : TextFormat = new TextFormat();
			textFormat.color = 0x0066ff;
			textFormat.font = "Arial";
			textFormat.size = 18;
	
			var textField : TextField = new TextField();
			textField.width = 200;											// fixed width and height of textfield
			textField.height = 30;
			textField.y = 50;
			
			textField.background = true;
			textField.backgroundColor = 0xdddddd;
			textField.defaultTextFormat = textFormat;
			textField.multiline = false;
			textField.selectable = false;
			textField.wordWrap = false;
						
			addChild(textField);
			
			textField.text = "Weit hinten, hinter den Wortbergen!";
			fitTextInTextField( textField, 14 );
		}

		private function createTextFieldForDynamicTextTwo() : void
		{
			var textFormat : TextFormat = new TextFormat();
			textFormat.color = 0x0066ff;
			textFormat.font = "Arial";
			textFormat.size = 18;
	
			var textField : TextField = new TextField();
			textField.y = 100;
			
			textField.background = true;
			textField.backgroundColor = 0xdddddd;
			textField.defaultTextFormat = textFormat;
			textField.multiline = false;
			textField.selectable = false;
			textField.wordWrap = false;
						
			addChild(textField);
			
			textField.text = "Weit hinten, hinter den Wortbergen!";
			fitTextInTextField( textField, 14, 200, 30 );					// maxmimum width and height of textfield
		}
	}
}
