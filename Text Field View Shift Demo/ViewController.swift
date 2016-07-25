//
//  ViewController.swift
//  Text Field View Shift Demo
//
//  Created by Jaemoon Park on 7/22/16.
//  Copyright © 2016 Jaemoon Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let myAttributes = [NSStrokeColorAttributeName: UIColor.blackColor(), NSStrokeWidthAttributeName: 4.0,NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.init(name: "HelveticaNeue-Bold", size: 24.0)!]
    //NSFontAttributeName: UIFont.init(name: "Comic Sans", size: 17.0)
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    var shiftOne = false
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if topTextField.text == "TOP" {
            topTextField.text = ""
        }
        if bottomTextField.text == "BOTTOM" {
            bottomTextField.text = ""
        }
    }
    
    
    override func viewDidLoad() {
        topTextField.delegate = self
        bottomTextField.delegate = self
        topTextField.defaultTextAttributes = myAttributes
        bottomTextField.defaultTextAttributes = myAttributes
        topTextField.textAlignment = NSTextAlignment.Center
        bottomTextField.textAlignment = NSTextAlignment.Center
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.subscribeToKeyboardNotification()
        self.subscribeToKeyboardHideNotification()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        self.unsubscribeToKeyboardNotification()
        self.unsubscribeToKeyboardHideNotification()
    }
   
    func getKeyboardHeight(notification:NSNotification) -> CGFloat{
        let userInfo = notification.userInfo
        let keyBoardInfo = userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue
        return keyBoardInfo.CGRectValue().height
    }
    
    func showKeyboard(notification: NSNotification){
        if(shiftOne == false){
            self.view.frame.origin.y -= getKeyboardHeight(notification)
            shiftOne = true
        }
    }
    
    func hideKeyboardShift(notification: NSNotification){
        if(shiftOne == true){
            self.view.frame.origin.y += getKeyboardHeight(notification)
            shiftOne = false
        }
    }
    
    func subscribeToKeyboardNotification(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func subscribeToKeyboardHideNotification(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideKeyboardShift:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeToKeyboardNotification(){
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func unsubscribeToKeyboardHideNotification(){
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

