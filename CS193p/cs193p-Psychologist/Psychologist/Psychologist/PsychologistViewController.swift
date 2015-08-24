//
//  ViewController.swift
//  Psychologist
//
//  Created by Livio Bieri on 24/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		var destination = segue.destinationViewController as UIViewController
		
		if let navCon = destination as? UINavigationController {
			destination = navCon.visibleViewController!
		}
		
		if let hvc = destination as? HappinessViewController {
			if let identifier = segue.identifier {
				switch identifier {
				case "showSadDiagnosis": hvc.happines = 0
				case "showHappyDiagnosis": hvc.happines = 100
				default: hvc.happines = 50
				}
			}
		}
	}
}

