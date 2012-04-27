package de.hopa.yaul.text
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public function decreaseFontSizeToFitInTextField( textField : TextField, minFontSize : uint, maxTextWidth : Number, maxTextHeight : Number ) : Boolean
	{
		while ( textField.textWidth > maxTextWidth || textField.textHeight > maxTextHeight )
		{
			var textFormat : TextFormat = textField.getTextFormat();
			textFormat.size = int( textFormat.size ) - 1;

			if ( textFormat.size < minFontSize )
				return false;
				
			textField.setTextFormat( textFormat );
			textField.defaultTextFormat = textFormat;
		}
		
		return true;
	}
}