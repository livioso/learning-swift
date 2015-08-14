//
//  ViewController.swift
//  cs193p-Calculator
//
//  Created by Livio Bieri on 21/03/15.
//  Copyright (c) 2015 Livio Bieri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var display: UILabel!
  
  var userIsTheMiddleOfTyping: Bool = false

  @IBAction func appendDigit(sender: UIButton) {
    if userIsTheMiddleOfTyping {
      let digit = sender.currentTitle!
    } else {
      display.text = display.text! + digit
      userIsTheMiddleOfTyping = true
    }
  }
}