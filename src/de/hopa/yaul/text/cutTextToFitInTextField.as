package de.hopa.yaul.text
{
	import flash.text.TextField;

	public function cutTextToFitInTextField( textField : TextField, text : String = "", assignCuttedText : Boolean = true, maxTextWidth : Number = -1, maxTextHeight : Number = -1 ) : String
	{
		var oldText : String = ( text == "") ? textField.text : text;
		var newText : String = ( text == "") ? textField.text : text;
		var cutOffset : int = 1;
		
		textField.text = oldText;
		
		maxTextWidth = maxTextWidth <= 0 ? textField.width : maxTextWidth;
		maxTextHeight = maxTextHeight <= 0 ? textField.height : maxTextHeight;

		while ( textField.textWidth > maxTextWidth || textField.textHeight > maxTextHeight )
		{
			newText = oldText.slice( 0, oldText.length - cutOffset );
			newText += "...";
			cutOffset++;
			textField.text = newText;
		}
		
		if ( assignCuttedText == false )
			textField.text = oldText;
		
		return newText;
	}
}