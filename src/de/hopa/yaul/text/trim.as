package de.hopa.yaul.text
{
	public function trim( string : String ) : String
	{
		return string.replace( /^\s+|\s+$/g, '' );
	}
}