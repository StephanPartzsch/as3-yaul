package de.hopa.yaul.test.dummy
{
	public class DummyObjectWithConstructorArguments
	{
		public var valueOne : int;
		public var valueTwo : String;
		public var valueThree : SetterGetterDummyObject;
	
		public function DummyObjectWithConstructorArguments( valueOne : int, valueTwo : String, valueThree : SetterGetterDummyObject )
		{
			this.valueOne = valueOne;
			this.valueTwo = valueTwo;
			this.valueThree = valueThree;
		}
	}
}