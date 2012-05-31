package de.hopa.yaul.test
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.Description;
	import org.hamcrest.Matcher;
	import org.hamcrest.StringDescription;

	public class HasValidSetterAndGetterForMatcherTest
	{
		private var shouldMatchObject : MatchDummyObject;
		private var shouldNotMatchObject : NotMatchDummyObject;

		[Before]
		public function run_before_every_test() : void
		{
			shouldMatchObject = new MatchDummyObject();
			shouldNotMatchObject = new NotMatchDummyObject();
		}

		[Test]
		public function test_matches_object_for_one_field() : void
		{
			var matcher : Matcher = new HasValidSetterAndGetterForMatcher( ["fieldB"] );
			assertTrue( "unexpected match result", matcher.matches( shouldMatchObject ) );
		}

		[Test]
		public function test_matches_object_for_three_fields() : void
		{
			var matcher : Matcher = new HasValidSetterAndGetterForMatcher( ["fieldA", "fieldB", "fieldC"] );
			assertTrue( "unexpected match result", matcher.matches( shouldMatchObject ) );
		}

		[Test]
		public function test_matches_object_for_one_field_with_not_matching_fields_in_object() : void
		{
			var matcher : Matcher = new HasValidSetterAndGetterForMatcher( ["fieldA"] );
			assertTrue( "unexpected match result", matcher.matches( shouldNotMatchObject ) );
		}

		[Test]
		public function test_not_machtes_object() : void
		{
			var matcher : Matcher = new HasValidSetterAndGetterForMatcher( ["fieldC"] );
			assertFalse( "unexpected match result", matcher.matches( shouldNotMatchObject ) );
		}

		[Test]
		public function test_description() : void
		{
			var matcher : Matcher = new HasValidSetterAndGetterForMatcher( ["fieldA", "fieldB", "fieldC"] );
			var description : Description = new StringDescription();
			var expectedDescription : String = 'Has valid setter and getter for class fields: ["fieldA","fieldB","fieldC"]';

			matcher.matches( shouldMatchObject );
			description.appendDescriptionOf( matcher );

			assertEquals( "Expected description", expectedDescription, description.toString() );
		}

		[Test]
		public function test_missmatch_description() : void
		{
			var matcher : Matcher = new HasValidSetterAndGetterForMatcher( ["fieldC"] );
			var description : Description = new StringDescription();
			var expectedDescription : String = 'Unable to match setter and getter results in class "NotMatchDummyObject" for field: "fieldC"';

			matcher.matches( shouldNotMatchObject );
			description.appendMismatchOf( matcher, shouldNotMatchObject );

			assertEquals( "Unexpected mismatch description", expectedDescription, description.toString() );
		}
	}
}

internal class MatchDummyObject
{
	public var fieldB : Number;

	private var _fieldA : String;
	private var _fieldC : uint;

	public function setFieldA( fieldA : String ) : void
	{
		_fieldA = fieldA;
	}

	public function getFieldA() : String
	{
		return _fieldA;
	}

	public function set fieldC( fieldC : uint ) : void
	{
		_fieldC = fieldC;
	}

	public function get fieldC() : uint
	{
		return _fieldC;
	}
}

internal class NotMatchDummyObject
{
	public var fieldA : String;

	private var _fieldC : int;

	public function setFieldC( fieldC : int ) : void
	{
		_fieldC = fieldC;
	}
}