## as3-yaul 
This collection of classes and functions is yet another util library for ActionScript 3. It is the place where reusable parts of code are stored to reuse them easily and to save some time.
For the most part yaul consists of small classes or functions and it is quite obvious how to use them. Some of the resources come with examples to demonstrate their usage. 
Yaul contains so far the following functionality:  


### package browser
* **getBrowserVersion** - return a BrowserVersion object which gives you the properties (appCodeName, appName, appVersion, cookieEnabled, platform, userAgent) from the browser navigator object.


### package display

* **ClickCatcher**  - a Sprite that listens for addedToStage, removedFromStage and resize events and  draws an invisible hitarea to catch all mouse events

### package test 

* **hasValidSetterAndGetter** - tests if all getter and setter of an object work as expected
* **hasValidSetterAndGetterExcluding** - tests if all getter and setter excluding given fields work as expected
* **hasValidSetterAndGetterFor** - tests if all getter and setter for given fields work as expected

All functions work with public properties, explicit and implicit getters/setters.

**Dependencies**

The 'has valid getter/setter' functions are compiled against *hamcrest-as3-only-1.1.3.swc*, *mockito-1.4M5.swc* and *spicelib-flash-2.4.0.swc*. The SWCs are included in the [download file](https://github.com/StephanPartzsch/as3-yaul/downloads).

**Usage**

	[Test]
	public function test_should_get_and_set_properties_for_all_properties() : void
	{
		assertThat( new MyObject(), hasValidSetterAndGetter() );
	}

	[Test]
	public function test_should_get_and_set_properties_for_specific_properties() : void
	{
		assertThat( new MyObject(), hasValidSetterAndGetterFor( "fieldC", "fieldD" ) );
	}

	[Test]
	public function test_should_get_and_set_properties_with_excluding_properties() : void
	{
		assertThat( new MyObject(), hasValidSetterAndGetterExcluding( "fieldA", "fieldB") );
	}


### package text 

* **cutTextToFitInTextField**  - cuts a given text and extend it with three dots (...) so that it fits in a text field with a fixed width 
* **decreaseFontSizeToFitInTextField**  - decreases the font size of a given text so that it fits into a text field 
* **fitTextInTextField**  - fits a given text into a text field by decreasing the font size (up to a minimal font size) and cutting the text with an extension of three dots (...)  
* **trim**  - trims whitespace from a string