package de.hopa.yaul.test
{
	import org.flemit.reflection.FieldInfo;
	import org.flemit.reflection.MemberInfo;
	import org.flemit.reflection.MethodInfo;
	import org.flemit.reflection.ParameterInfo;
	import org.flemit.reflection.PropertyInfo;
	import org.flemit.reflection.Type;

	public class SetterGetterInvoker
	{
		private var testTarget : Object;
		private var valueFactory : ValueFactory;

		private var _currentFieldName : String;
		
		private var classTypeInfo : Type;
		private var methods : Array;
		private var properties : Array;
		

		public function SetterGetterInvoker( testTarget : Object )
		{
			this.testTarget = testTarget;

			valueFactory = new ValueFactory();
			
			_currentFieldName = "";

			initializeReflectionInformation( testTarget );
		}
		
		public function get currentFieldName() : String
		{
			return _currentFieldName;
		}

		public function invokeSettersAndGettersFor( fields : Array ) : Boolean
		{
			return invokeSettersAndGetters( fields );
		}

		public function invokeSettersAndGettersExcluding( excludedFields : Array ) : Boolean
		{
			var classFields : Array = getClassFields();

			var fields : Array = [];

			for each ( var fieldName : String in classFields )
			{
				if ( excludedFields.indexOf( fieldName ) == -1 )
					fields.push( fieldName );
			}

			return invokeSettersAndGetters( fields );
		}

		private function initializeReflectionInformation( testTarget : Object ) : void
		{
			classTypeInfo = Type.getType( testTarget );
			var members : Array = classTypeInfo.getMembers();

			properties = [];
			methods = [];

			for each ( var member : MemberInfo in members )
			{
				if ( member is MethodInfo )
					methods.push( member );
				else
					properties.push( member );
			}
		}

		private function invokeSettersAndGetters( fields : Array ) : Boolean
		{
			if ( fields.length == 0 )
				return false;
			
			for each ( var fieldName : String in fields )
			{
				_currentFieldName = fieldName;

				try
				{
					var testValue : Object = invokeSetter( fieldName );
					var result : Object = invokeGetter( fieldName );

					if ( testValue != result )
						return false;
				}
				catch( error : Error )
				{
					return false;
				}
			}

			return true;
		}

		private function invokeSetter( fieldName : String ) : Object
		{
			var testValue : Object;

			if ( isProperty( fieldName ) )
			{
				testValue = valueFactory.createValue( getClassForMemberInfo( classTypeInfo.getMember( fieldName ) ) );
				
				testTarget[fieldName] = testValue;
				
				return testValue;
			}
			else if ( isMethod( fieldName ) )
			{
				var methodInfo : MethodInfo = classTypeInfo.getMember( "set" + getCapitalizedFieldName( fieldName ) ) as MethodInfo;
				
				testValue = valueFactory.createValue( getClassForMemberInfo( methodInfo ) );

				if ( methodInfo.parameters.length == 1 )
				{
					var setterFunction : Function = testTarget[methodInfo.name];
					setterFunction.call( testTarget, testValue );
				
					return testValue;
				}
			}

			throw new Error( "Unable to invoke setter for field '" + fieldName + "'!" );
		}

		private function invokeGetter( fieldName : String ) : Object
		{
			if ( isProperty( fieldName ) )
			{
				return testTarget[fieldName];
			}
			else if ( isMethod( fieldName ) )
			{
				var methodInfo : MethodInfo = classTypeInfo.getMember( "get" + getCapitalizedFieldName( fieldName ) ) as MethodInfo;
				var getterFunction : Function = testTarget[methodInfo.name];
				return getterFunction.call( testTarget );
			}

			throw new Error( "Unable to invoke getter for field '" + fieldName + "'!" );
		}

		private function isProperty( fieldName : String ) : Boolean
		{
			for each ( var propertyInfo : MemberInfo in properties )
			{
				if ( propertyInfo.name == fieldName )
					return true;
			}

			return false;
		}

		private function isMethod( fieldName : String ) : Boolean
		{
			for each ( var methodInfo : MethodInfo in methods )
			{
				if ( methodInfo.name.substring( 3 ).toLowerCase() == fieldName.toLowerCase() )
					return true;
			}

			return false;
		}

		private function getClassForMemberInfo( memberInfo : MemberInfo ) : Class
		{
			var clazz : Class;
			
			if ( memberInfo is PropertyInfo )
				clazz = PropertyInfo( memberInfo ).type.classDefinition;
			else if ( memberInfo is FieldInfo )
				clazz = FieldInfo( memberInfo ).type.classDefinition;
			else if ( memberInfo is MethodInfo )
				clazz = ParameterInfo( MethodInfo( memberInfo ).parameters[0] ).type.classDefinition;
			
			return clazz;
		}
		
		private function getCapitalizedFieldName( fieldName : String ) : String
		{
			return fieldName.charAt( 0 ).toUpperCase() + fieldName.substring( 1 );
		}
		
		private function getClassFields() : Array
		{
			var fields : Array = [];
			
			for each ( var propertyInfo : MemberInfo in properties )
			{
				if ( !( propertyInfo is PropertyInfo ) )
					fields.push( propertyInfo.name );
				else if ( PropertyInfo( propertyInfo ).canWrite )
					fields.push( propertyInfo.name );
			}
				
			for each ( var methodInfo : MethodInfo in methods )
			{
				if ( methodInfo.name.substr( 0, 3 ) == "set" )
					fields.push( methodInfo.name.charAt( 3 ).toLowerCase() + methodInfo.name.substring( 4 ) );
			}
			
			return fields;
		}
	}
}