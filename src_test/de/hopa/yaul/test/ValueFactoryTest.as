package de.hopa.yaul.test
{
	import de.hopa.yaul.test.dummy.DummyInterface;
	import de.hopa.yaul.test.dummy.DummyObjectWithConstructorArguments;
	import de.hopa.yaul.test.dummy.SetterGetterDummyObject;

	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.rules.IMethodRule;
	import org.hamcrest.object.instanceOf;
	import org.mockito.integrations.flexunit4.MockitoRule;

	import flash.display.DisplayObject;

	public class ValueFactoryTest
	{
		[Rule]
		public var mockitoRule : IMethodRule = new MockitoRule();
		
		[Mock]
		public var setterGetterDummyObject : SetterGetterDummyObject;
		
		[Mock]
		public var dummyInterface : DummyInterface;
		
		[Mock(argsList="constructorArgs")]
		public var dummyObjectWithConstructorArguments : DummyObjectWithConstructorArguments;
		public var constructorArgs : Array = [ 5, "test", setterGetterDummyObject ];
		
		private var valueFactory : ValueFactory;
		
		[Before]
		public function run_before_every_test() : void
		{
			valueFactory = new ValueFactory();
		}
		
		[Test]
		public function test_create_value_for_primitive_values() : void
		{
			assertThat( "unexpected type for String", valueFactory.createValue( String ), instanceOf( String ) );
			assertThat( "unexpected type for int", valueFactory.createValue( int ), instanceOf( int ) );
			assertThat( "unexpected type for uint", valueFactory.createValue( uint ), instanceOf( uint ) );
			assertThat( "unexpected type for Number", valueFactory.createValue( Number ), instanceOf( Number ) );
			assertThat( "unexpected type for Boolean", valueFactory.createValue( Boolean ), instanceOf( Boolean ) );
			
			assertEquals( "unexpected value for String", "test", valueFactory.createValue( String ) );
			assertEquals( "unexpected value for int", -15, valueFactory.createValue( int ) );
			assertEquals( "unexpected value for uint", 150, valueFactory.createValue( uint ) );
			assertEquals( "unexpected value for Number", 1.5, valueFactory.createValue( Number ) );
			assertEquals( "unexpected value for Boolean", true, valueFactory.createValue( Boolean ) );
		}
		
		[Test]
		public function test_create_value_for_non_primitive() : void
		{
			assertThat( "unexpected type for DummyObject", valueFactory.createValue( SetterGetterDummyObject ), instanceOf( SetterGetterDummyObject ) );
		}
		
		[Test]
		public function test_create_value_for_non_primitive_with_constructor_arguments() : void
		{
			var expectedObject : DummyObjectWithConstructorArguments = valueFactory.createValue( DummyObjectWithConstructorArguments ) as DummyObjectWithConstructorArguments;
			assertThat( "unexpected type for DummyObject", expectedObject, instanceOf( DummyObjectWithConstructorArguments ) );
			assertEquals( "unexpected value for int", -15, expectedObject.valueOne );
			assertEquals( "unexpected value for String", "test", expectedObject.valueTwo );
			assertNotNull( "unexpected value for DummyObjectWithConstructorArguments", expectedObject.valueThree );
		}
		
		[Test]
		public function test_create_value_for_interface() : void
		{
			assertThat( "unexpected type for DummyInterface", valueFactory.createValue( DummyInterface ), instanceOf( DummyInterface ) );
		}
		
		[Test]
		public function test_create_value_for_display_object() : void
		{
			assertThat( "unexpected type for DisplayObject", valueFactory.createValue( DisplayObject ), instanceOf( DisplayObject ) );
		}
		
		[Test]
		public function test_create_value_for_function() : void
		{
			assertThat( "unexpected type for DisplayObject", valueFactory.createValue( Function ), instanceOf( Function ) );
		}
	}
}