package de.hopa.util.yaul
{
	import de.hopa.yaul.text.trim;
	import org.flexunit.asserts.assertEquals;

	public class TrimTest
	{
		private static const WHITE : String = "  \t\t\r\r\n\n  ";

		[Test]
		public function test_trim_left() : void
		{
			assertEquals( "abc", trim( WHITE + "abc" ) );
		}

		[Test]
		public function test_trim_right() : void
		{
			assertEquals( "abc", trim( "abc" + WHITE ) );
		}

		[Test]
		public function test_trim_both() : void
		{
			assertEquals( "abc", trim( WHITE + "abc" + WHITE ) );
		}

		[Test]
		public function test_trim_middle() : void
		{
			var string : String = "abc" + WHITE + "abc";
			assertEquals( string, trim( string ) );
		}
	}
}