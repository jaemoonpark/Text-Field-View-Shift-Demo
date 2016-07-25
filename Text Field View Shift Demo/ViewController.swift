//
//  ViewController.swift
//  Text Field View Shift Demo
//
//  Created by Jaemoon Park on 7/22/16.
//  Copyright © 2016 Jaemoon Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myAttributes = [NSStrokeColorAttributeName: UIColor.blackColor(), NSStrokeWidthAttributeName: 4.0,NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.init(name: "HelveticaNeue-Bold", size: 24.0)!]
    //NSFontAttributeName: UIFont.init(name: "Comic Sans", size: 17.0)
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    override func viewDidLoad() {
       
        topTextField.defaultTextAttributes = myAttributes
        bottomTextField.defaultTextAttributes = myAttributes
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

