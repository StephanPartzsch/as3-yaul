package de.hopa.yaul.test
{
	import org.flemit.reflection.DescribeTypeTypeProvider;
	import org.flemit.reflection.Type;
	import org.mockito.integrations.currentMockito;

	import flash.system.ApplicationDomain;
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
			var dsescribeTypeTypeProvider : DescribeTypeTypeProvider = new DescribeTypeTypeProvider();
			
			var classType : Type = dsescribeTypeTypeProvider.getType( clazz, ApplicationDomain.currentDomain );
			var baseClasses : Array = getBaseClassesForType( classType );
			var interfaces : Array = classType.getInterfaces();
			
			if ( clazz == expectedClazz || Object == clazz )
				return true;
				
			for each ( var baseClass : Class in baseClasses ) 
			{
				if ( baseClass == expectedClazz )
					return true;
			}
				
			for each ( var classInterface : Class in interfaces ) 
			{
				if ( classInterface == expectedClazz )
					return true;
			}
				
			return false;
		}
		
		private function getBaseClassesForType( clazzType : Type ) : Array
		{
			var result : Array = [];

			if ( clazzType.baseType != null )
				result = result.concat( getBaseClassesForType( clazzType.baseType ) );
			else
				result.push( clazzType.classDefinition );
			
			return result;
		}
	}
}