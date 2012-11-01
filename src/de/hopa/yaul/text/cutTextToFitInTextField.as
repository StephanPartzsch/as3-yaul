package de.hopa.yaul.text
{
	import flash.text.TextField;

	public function cutTextToFitInTextField( textField : TextField, maxTextWidth : Number, maxTextHeight : Number, assignCuttedText : Boolean = true  ) : String
	{
		var oldText : String = textField.text;
		var newText : String = textField.text;
		var cutOffset : int = 20;

		while ( textField.textWidth > maxTextWidth || textField.textHeight > maxTextHeight )
		{
			newText = oldText.slice( 0, cutOffset );
			newText += "...";
			cutOffset--;
			textField.text = newText;
		}
		
		if ( assignCuttedText == false )
			textField.text = oldText;
		
		return newText;
	}
}