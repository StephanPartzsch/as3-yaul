package de.hopa.yaul.test
{
	import org.mockito.integrations.currentMockito;
	import org.spicefactory.lib.reflect.ClassInfo;

	import flash.utils.Dictionary;

	public class ValueFactory
	{
		private var typeValues : Dictionary;

		public function ValueFactory()
		{
			typeValues = new Dictionary();
			typeValues[String] = "test";
			typeValues[int] = -15;
			typeValues[uint] = 150;
			typeValues[Number] = 1.5;
			typeValues[Boolean] = true;
		}

		public function createValue( clazz : Class ) : Object
		{
			if ( isPrimitive( clazz ) )
				return typeValues[clazz];

			return currentMockito.mock( clazz );
		}

		private function isPrimitive( clazz : Class ) : Boolean
		{
			return isClass( clazz, String ) || isClass( clazz, int ) || isClass( clazz, uint ) || isClass( clazz, Number ) || isClass( clazz, Boolean );
		}

		private function isClass( clazz : Class, expectedClazz : Class ) : Boolean
		{
			return ClassInfo.forClass( clazz ).isType( expectedClazz );
		}
	}
}