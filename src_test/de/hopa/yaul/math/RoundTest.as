package de.hopa.yaul.math
{
	import org.flexunit.asserts.assertEquals;

	public class RoundTest
	{
		[Test]
		public function test_round_value_in_upper_half_range() : void
		{
			assertEquals( "unexpected rounded value", 12, round( 11.8 ) );
		}

		[Test]
		public function test_round_negative_value_in_upper_half_range() : void
		{
			assertEquals( "unexpected rounded value", -12, round( -11.8 ) );
		}

		[Test]
		public function test_round_value_in_middle_range() : void
		{
			assertEquals( "unexpected rounded value", 12, round( 11.5 ) );
		}

		[Test]
		public function test_round_negative_value_in_middle_range() : void
		{
			assertEquals( "unexpected rounded value", -12, round( -11.5 ) );
		}

		[Test]
		public function test_round_value_in_lower_half_range() : void
		{
			assertEquals( "unexpected rounded value", 11, round( 11.2 ) );
		}

		[Test]
		public function test_round_negative_value_in_lower_half_range() : void
		{
			assertEquals( "unexpected rounded value", -11, round( -11.2 ) );
		}

		[Test]
		public function test_round_value_with_integer() : void
		{
			assertEquals( "unexpected rounded value", 12, round( 12 ) );
		}

		[Test]
		public function test_round_value_with_negative_integer() : void
		{
			assertEquals( "unexpected rounded value", -12, round( -12 ) );
		}

		[Test]
		public function test_round_value_with_zero() : void
		{
			assertEquals( "unexpected rounded value", 0, round( 0 ) );
		}
	}
}