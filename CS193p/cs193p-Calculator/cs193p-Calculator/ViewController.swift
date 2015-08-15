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
  
  var userIsTheMiddleOfTyping = false
  
  @IBAction func operate(sender: UIButton, forEvent event: UIEvent) {
    let operation = sender.currentTitle!
    if userIsTheMiddleOfTyping {
      enter()
    }
    
    switch operation {
    case "×": performOperation({$0 * $1})
    case "÷": performOperation({$1 / $0})
    case "+": performOperation({$0 + $1})
    case "−": performOperation({$1 - $0})
    case "√": performOperationSing({sqrt($0)})
    default: break
    }
  }
  
  func performOperation(operation: (Double,Double) -> Double) {
    if operandStack.count >= 2 {
      displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
      enter()
    }
  }
  
  func performOperationSing(operation: (Double) -> Double) {
    if operandStack.count >= 1 {
      displayValue = operation(operandStack.removeLast())
      enter()
    }
  }

  var operandStack: Array<Double> = Array<Double>()
  @IBAction func enter() {
    userIsTheMiddleOfTyping = false
    operandStack.append(displayValue)
    print("\(operandStack)")
  }
  
  var displayValue: Double {
    get {
      return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
    }
    set {
      display.text = "\(newValue)"
      userIsTheMiddleOfTyping = false
    }
  }
  
  @IBAction func appendDigit(sender: UIButton) {
    let digit = sender.currentTitle!
    if userIsTheMiddleOfTyping {
      display.text = display.text! + digit
    } else {
      display.text = digit
      userIsTheMiddleOfTyping = true
    }
  }
}