package de.hopa.yaul.math
{
	import org.flexunit.asserts.assertEquals;
	
	public class CeilTest
	{
		[Test]
		public function test_ceil_value_in_upper_half_range() : void
		{
			assertEquals( "unexpected ceiled value", 12, ceil( 11.8 ) );
		}
		[Test]
		public function test_ceil_negative_value_in_upper_half_range() : void
		{
			assertEquals( "unexpected ceiled value", -11, ceil( -11.8 ) );
		}
		
		[Test]
		public function test_ceil_value_in_middle_range() : void
		{
			assertEquals( "unexpected ceiled value", 12, ceil( 11.5 ) );
		}
		
		[Test]
		public function test_ceil_negative_value_in_middle_range() : void
		{
			assertEquals( "unexpected ceiled value", -11, ceil( -11.5 ) );
		}
		
		[Test]
		public function test_ceil_value_in_lower_half_range() : void
		{
			assertEquals( "unexpected ceiled value", 12, ceil( 11.2 ) );
		}
		
		[Test]
		public function test_ceil_negative_value_in_lower_half_range() : void
		{
			assertEquals( "unexpected ceiled value", -11, ceil( -11.2 ) );
		}
		
		[Test]
		public function test_ceil_value_with_integer() : void
		{
			assertEquals( "unexpected ceiled value", 12, ceil( 12 ) );
		}
		
		[Test]
		public function test_ceil_value_with_negative_integer() : void
		{
			assertEquals( "unexpected ceiled value", -12, ceil( -12 ) );
		}
		
		[Test]
		public function test_ceil_value_with_zero() : void
		{
			assertEquals( "unexpected ceiled value", 0, ceil( 0 ) );
		}
	}
}