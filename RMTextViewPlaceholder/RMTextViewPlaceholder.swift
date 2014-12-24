//
//    RMPlaceholderTextView.swift
//
//    The MIT License (MIT)
//
//    Copyright (c) 2014 Ralph Marschall
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

import UIKit

@IBDesignable class RMTextViewPlaceholder: UITextView {
    
    var placeholderLabel: UILabel!
    
    @IBInspectable var placeholder: String = "Placeholder" {
        didSet {
            placeholderLabel.text = placeholder
            placeholderLabel.sizeToFit()
        }
    }
    
    @IBInspectable var phColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            placeholderLabel.textColor = phColor

        }
    }
    
    @IBInspectable var phBackgroundColor: UIColor = UIColor.clearColor() {
        didSet {
            placeholderLabel.backgroundColor = phBackgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        registerToNotifications()
        setupPlaceholderLabel()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        registerToNotifications()
        setupPlaceholderLabel()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        registerToNotifications()
        setupPlaceholderLabel()
    }
    
    deinit {
        let ns = NSNotificationCenter.defaultCenter()
        ns.removeObserver(self)
    }
    
    
    func setupPlaceholderLabel() {
        if self.placeholderLabel == nil {
            self.placeholderLabel = UILabel(frame: CGRectMake(8, 8, 0, 0))
            self.placeholderLabel.sizeToFit()
            //self.placeholderLabel.font = self.font

            self.addSubview(self.placeholderLabel)
        }
    }
    
    func updatePlaceholderLabel() {
        self.placeholderLabel.hidden = !( countElements(self.text) == 0 )
    }
    
    func registerToNotifications() {
        let ns = NSNotificationCenter.defaultCenter()
        ns.removeObserver(self)
        //ns.addObserver(self, selector: "didBeginEditing:", name: UITextViewTextDidBeginEditingNotification, object: nil)
        ns.addObserver(self, selector: "didChange:", name: UITextViewTextDidChangeNotification, object: nil)
        //ns.addObserver(self, selector: "didEndEditing:", name: UITextViewTextDidEndEditingNotification, object: nil)
    }
    
    func didBeginEditing(notification: NSNotification) {
        println("UITEXTVIEW didBegin")
    }
    
    func didChange(notification: NSNotification) {
        println("UITEXTVIEW didChange")
        
        updatePlaceholderLabel()
    }
    
    func didEndEditing(notification: NSNotification) {
        println("UITEXTVIEW didEnd")
    }
    
}
