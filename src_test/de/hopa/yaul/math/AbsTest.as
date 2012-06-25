package de.hopa.yaul.math
{
	import org.flexunit.asserts.assertEquals;

	public class AbsTest
	{
		[Test]
		public function test_abs_with_positive_value() : void
		{
			assertEquals( "unexpected absolute value", 22.3, abs( 22.3 ) );
		}

		[Test]
		public function test_abs_with_positive_integer_value() : void
		{
			assertEquals( "unexpected absolute value", 11, abs( 11 ) );
		}

		[Test]
		public function test_abs_with_negative_value() : void
		{
			assertEquals( "unexpected absolute value", 22.3, abs( -22.3 ) );
		}

		[Test]
		public function test_abs_with_negative_integer_value() : void
		{
			assertEquals( "unexpected absolute value", 11, abs( -11 ) );
		}

		[Test]
		public function test_abs_with_zero() : void
		{
			assertEquals( "unexpected absolute value", 0, abs( 0 ) );
		}
	}
}