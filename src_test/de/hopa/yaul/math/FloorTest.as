package de.hopa.yaul.math
{
	import org.flexunit.asserts.assertEquals;

	public class FloorTest
	{
		[Test]
		public function test_floor_value_in_upper_half_range() : void
		{
			assertEquals( "unexpected floored value", 11, floor( 11.8 ) );
		}

		[Test]
		public function test_floor_negative_value_in_upper_half_range() : void
		{
			assertEquals( "unexpected floored value", -12, floor( -11.8 ) );
		}

		[Test]
		public function test_floor_value_in_middle_range() : void
		{
			assertEquals( "unexpected floored value", 11, floor( 11.5 ) );
		}

		[Test]
		public function test_floor_negative_value_in_middle_range() : void
		{
			assertEquals( "unexpected floored value", -12, floor( -11.5 ) );
		}

		[Test]
		public function test_floor_value_in_lower_half_range() : void
		{
			assertEquals( "unexpected floored value", 11, floor( 11.2 ) );
		}

		[Test]
		public function test_floor_negative_value_in_lower_half_range() : void
		{
			assertEquals( "unexpected floored value", -12, floor( -11.2 ) );
		}

		[Test]
		public function test_floor_value_with_integer() : void
		{
			assertEquals( "unexpected floored value", 12, floor( 12 ) );
		}

		[Test]
		public function test_floor_value_with_negative_integer() : void
		{
			assertEquals( "unexpected floored value", -12, floor( -12 ) );
		}

		[Test]
		public function test_floor_value_with_zero() : void
		{
			assertEquals( "unexpected floored value", 0, floor( 0 ) );
		}
	}
}