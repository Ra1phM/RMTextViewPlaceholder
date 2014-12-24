# RMTextViewPlaceholder

![Text View Placeholder in Interface Builder](https://raw.githubusercontent.com/Ra1phM/RMTextViewPlaceholder/master/ScreenShot_IB_1.png "Text View Placeholder in Interface Builder")

`RMTextViewPlaceholder` is a subclass of `UITextView`. It adds support for placeholder text, which is not available by default (only `UILabel` has placeholder). The class is written **Swift** and makes use of the new `@IBDesignable` and `@IBInspectable` functionalities.

Thus, you can set a `UITextView` in Interface Builder to use `RMTextViewPlaceholder` and direclty define the placeholder text, the placeholder text color and the placeholder background color.

Under the hood, `RMTextViewPlaceholder` just adds a `UILabel` acting as a placeholder and observes the `UITextViewTextDidChangeNotification`.

#### Note:

`RMTextViewPlaceholder.swift` needs to be located in a framework to be rendered in Interface Builder. Also, make sure that the class is targeted for your main project otherwise you won't be able to use it in your code!



Have Fun!