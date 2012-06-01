package de.hopa.yaul.test
{
	import de.hopa.yaul.test.dummy.SetterGetterDummyObject;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.rules.IMethodRule;
	import org.mockito.integrations.flexunit4.MockitoRule;

	public class SetterGetterInvokerTest
	{
		[Rule]
		public var mockitoRule : IMethodRule = new MockitoRule();
		
		[Mock]
		public var setterGetterDummy : SetterGetterDummyObject; 
		
		private var dummyObject : DummyObject;
		private var setterGetterInvoker : SetterGetterInvoker;
		
		[Before]
		public function run_before_every_test() : void
		{
			dummyObject = new DummyObject();
			setterGetterInvoker = new SetterGetterInvoker( dummyObject );
		}

		[Test]
		public function test_invoke_setter_and_getter_for_one_property() : void
		{
			var testTarget : DummyObject = new DummyObject();
			var setterGetterInvoker : SetterGetterInvoker = new SetterGetterInvoker( testTarget );

			assertTrue( setterGetterInvoker.invokeSettersAndGettersFor( ["fieldA"] ) );
		}

		[Test]
		public function test_invoke_setter_and_getter_for_not_existing_property() : void
		{
			var testTarget : DummyObject = new DummyObject();
			var setterGetterInvoker : SetterGetterInvoker = new SetterGetterInvoker( testTarget );

			assertFalse( setterGetterInvoker.invokeSettersAndGettersFor( ["test"] ) );
		}

		[Test]
		public function test_invoke_setter_and_getter_for_all_properties() : void
		{
			setterGetterInvoker.invokeSettersAndGettersExcluding( [] );

			assertNotNull( dummyObject.getFieldA() );
			assertTrue( dummyObject.fieldB != 0 );
			assertTrue( dummyObject.getFieldC() != 0 );
			assertNotNull( dummyObject.fieldD );
			assertTrue( dummyObject.fieldE );
			assertNotNull( dummyObject.setterGetterDummy );
		}
		
		[Test]
		public function test_invoke_setter_and_getter_for_specific_properties() : void
		{
			setterGetterInvoker.invokeSettersAndGettersFor( ["fieldC", "fieldE"] );

			assertNull( dummyObject.getFieldA() );
			assertFalse( dummyObject.fieldB != 0 );
			assertTrue( dummyObject.getFieldC() != 0 );
			assertTrue( isNaN( dummyObject.fieldD ) );
			assertTrue( dummyObject.fieldE );
			assertNull( dummyObject.setterGetterDummy );
		}

		[Test]
		public function test_invoke_setter_and_getter_with_excluding_properties() : void
		{
			setterGetterInvoker.invokeSettersAndGettersExcluding( ["fieldA", "fieldB"] );

			assertNull( dummyObject.getFieldA() );
			assertFalse( dummyObject.fieldB != 0 );
			assertTrue( dummyObject.getFieldC() != 0 );
			assertNotNull( dummyObject.fieldD );
			assertTrue( dummyObject.fieldE );
			assertNotNull( dummyObject.setterGetterDummy );
		}
	}
}

import de.hopa.yaul.test.dummy.SetterGetterDummyObject;

internal class DummyObject
{
	public var setterGetterDummy : SetterGetterDummyObject;

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

	public function set fieldB( fieldB : uint ) : void
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