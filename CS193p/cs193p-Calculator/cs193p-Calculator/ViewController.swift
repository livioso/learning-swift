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
	var brain = CalculatorBrain()
	
	@IBAction func appendDigit(sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsTheMiddleOfTyping {
			display.text = display.text! + digit
		} else {
			display.text = digit
			userIsTheMiddleOfTyping = true
		}
	}
	
	@IBAction func operate(sender: UIButton, forEvent event: UIEvent) {
		if userIsTheMiddleOfTyping {
			enter()
		}
		if let operation = sender.currentTitle {
			if let result = brain.performOperation(operation) {
				displayValue = result
			} else {
				displayValue = 0
			}
		}
	}

	@IBAction func enter() {
		userIsTheMiddleOfTyping = false
		if let result = brain.pushOperand(displayValue) {
			displayValue = result
		} else {
			displayValue = 0
		}
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
}