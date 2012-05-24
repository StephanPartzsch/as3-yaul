package de.hopa.yaul.test
{
	import de.hopa.yaul.browser.BrowserVersion;

	public class SetterGetterDummyObject
	{
		public var browserVersion : BrowserVersion;

		public var fieldD : Number;
		public var fieldE : Boolean;

		private var _fieldA : String;
		private var _fieldB : uint;
		private var _fieldC : int;

		public function setFieldA( fieldA : String ) : void
		{
			_fieldA = fieldA;
		}

		public function getFieldA() : String
		{
			return _fieldA;
		}

		public function set fieldB( fieldB: uint ) : void
		{
			_fieldB = fieldB;
		}

		public function get fieldB() : uint
		{
			return _fieldB;
		}

		public function setFieldC( fieldC : int ) : void
		{
			_fieldC = fieldC;
		}

		public function getFieldC() : int
		{
			return _fieldC;
		}
	}
}