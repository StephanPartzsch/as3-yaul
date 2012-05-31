package de.hopa.yaul.test
{
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	import org.spicefactory.lib.reflect.ClassInfo;
	import org.spicefactory.lib.reflect.Method;
	import org.spicefactory.lib.reflect.Parameter;
	import org.spicefactory.lib.reflect.Property;

	public class SetterGetterInvoker
	{
		private static const LOG : Logger = LogContext.getLogger( SetterGetterInvoker );
		
		private var testTarget : Object;
		private var valueFactory : ValueFactory;

		private var classInfo : ClassInfo;
		private var methods : Array;
		private var properties : Array;
		
		private var _currentFieldName : String;

		public function SetterGetterInvoker( testTarget : Object )
		{
			this.testTarget = testTarget;

			valueFactory = new ValueFactory();

			classInfo = ClassInfo.forInstance( testTarget );
			methods = classInfo.getMethods();
			properties = classInfo.getProperties();
			
			_currentFieldName = "";
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

			var fields : Array = new Array();

			for each ( var fieldName : String in classFields )
			{
				if ( excludedFields.indexOf( fieldName ) == -1 )
					fields.push( fieldName );
			}

			return invokeSettersAndGetters( fields );
		}

		private function invokeSettersAndGetters( fields : Array ) : Boolean
		{
			for each ( var fieldName : String in fields )
			{
				_currentFieldName = fieldName;
				LOG.debug( "Invoking getter/setter for " + fieldName );

				try
				{
					var testValue : Object = invokeSetter( fieldName );
					var result : Object = invokeGetter( fieldName );

					if ( testValue != result )
					{
						LOG.error( "Getter result did not match set value for field: {0}", fieldName );
						return false;
					}
				}
				catch( error : Error )
				{
					LOG.error( "Unable to invoke both getter and setter for {0}! Error: {1}", fieldName, error.getStackTrace() );
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
				testValue = valueFactory.createValue( classInfo.getProperty( fieldName ).type.getClass() );
				
				testTarget[fieldName] = testValue;
				
				return testValue;
			}
			else if ( isMethod( fieldName ) )
			{
				var method : Method = classInfo.getMethod( "set" + getCapitalizedFieldName( fieldName ) );
				
				testValue = valueFactory.createValue( Parameter( method.parameters[0] ).type.getClass() );

				if ( method.parameters.length == 1 )
				{
					method.invoke( testTarget, [testValue] );
				
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
				var method : Method = classInfo.getMethod( "get" + getCapitalizedFieldName( fieldName ) );
				return method.invoke( testTarget, [] );
			}

			throw new Error( "Unable to invoke getter for field '" + fieldName + "'!" );
		}

		private function isProperty( fieldName : String ) : Boolean
		{
			for each ( var property : Property in properties )
			{
				if ( property.name == fieldName )
					return true;
			}

			return false;
		}

		private function isMethod( fieldName : String ) : Boolean
		{
			for each ( var method : Method in methods )
			{
				if ( method.name.substring( 3 ).toLowerCase() == fieldName.toLowerCase() )
					return true;
			}

			return false;
		}

		private function getCapitalizedFieldName( fieldName : String ) : String
		{
			return fieldName.charAt( 0 ).toUpperCase() + fieldName.substring( 1 );
		}
		
		private function getClassFields() : Array
		{
			var fields : Array = new Array();
			
			for each ( var property : Property in properties )
				fields.push( property.name );
				
			for each ( var method : Method in methods )
			{
				if ( method.name.substr( 0, 3 ) == "set" )
					fields.push( method.name.charAt( 3 ).toLowerCase() + method.name.substring( 4 ) );
			}
			
			return fields;
		}
	}
}