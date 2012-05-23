## as3-yaul 
This collection of classes and functions is yet another util library for ActionScript 3. It is the place where reusable parts of code are stored to reuse them easily and to save some time.
For the most part yaul consists of small classes or functions and it is quite obvious how to use them. Some of the resources come with examples to demonstrate their usage. 
Yaul contains so far the following functionality:  


### browser
* **getBrowserVersion** - return a BrowserVersion object which gives you the properties (appCodeName, appName, appVersion, cookieEnabled, platform, userAgent) from the browser navigator object.


### display

* **ClickCatcher**  - a Sprite that listens for addedToStage, removedFromStage and resize events and  draws an invisible hitarea to catch all mouse events


### text 

* **cutTextToFitInTextField**  - cuts a given text and extend it with three dots (...) so that it fits in a text field with a fixed width 
* **decreaseFontSizeToFitInTextField**  - decreases the font size of a given text so that it fits into a text field 
* **fitTextInTextField**  - fits a given text into a text field by decreasing the font size (up to a minimal font size) and cutting the text with an extension of three dots (...)  
* **trim**  - trims whitespace from a string