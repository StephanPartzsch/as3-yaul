package de.hopa.yaul.text
{
	import flash.text.TextField;

	public function fitTextInTextField( textField : TextField, minFontSize : uint = 11, maxTextWidth : Number = -1, maxTextHeight : Number = -1 ) : void
	{
		maxTextWidth = maxTextWidth <= 0 ? textField.width : maxTextWidth;
		maxTextHeight = maxTextHeight <= 0 ? textField.height : maxTextHeight;
		
		textField.width = ( textField.width < maxTextWidth ) ? maxTextWidth : textField.width;
		textField.height = ( textField.height < maxTextHeight ) ? maxTextHeight : textField.height;
		
		var textFitsInTextField : Boolean = decreaseFontSizeToFitInTextField( textField, minFontSize, maxTextHeight, maxTextHeight );
		
		if( textFitsInTextField == false )
			cutTextToFitInTextField( textField, "", true, maxTextWidth, maxTextHeight );
	}
}