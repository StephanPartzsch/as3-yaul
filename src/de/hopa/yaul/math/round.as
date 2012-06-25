package de.hopa.yaul.math
{
	public function round( value : Number ) : Number
	{
		value += value < 0 ? -0.5 : 0.5;
		return value >> 0;
	}
}