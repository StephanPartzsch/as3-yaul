package de.hopa.yaul.math
{
	public function ceil( value : Number ) : Number
	{
		return value == ( value >> 0 ) ? value : ( value >> 0 ) + ( value >= 0 ? 1 : 0 );
	}
}