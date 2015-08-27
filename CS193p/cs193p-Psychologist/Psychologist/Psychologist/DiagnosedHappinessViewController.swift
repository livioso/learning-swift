//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Livio Bieri on 26/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
	
	private let defaults = NSUserDefaults.standardUserDefaults()
	
	var diagnosticHistory: [Int] {
		get { return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? [] }
		set { defaults.setObject(newValue, forKey: History.DefaultsKey) }
	}
	
	override var happines: Int {
		didSet {
			diagnosticHistory += [happines]
		}
	}
	
	private struct History {
		static let SegueIdentifier = "showDiagnosticHistory"
		static let DefaultsKey = "DiagionesedHappinessViewController.History"
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let tvc = segue.destinationViewController as? TextViewController {
			if let identifier = segue.identifier {
				switch identifier {
				case History.SegueIdentifier:
					if let ppc = tvc.popoverPresentationController {
						ppc.delegate = self // really show pop over on (also on iPhone)
					}
					tvc.text = "\(diagnosticHistory)"
				default: break;
				}
			}
		}
	} 
	
	// make sure that we enforce pop over even on iPhone
	func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.None
	}

}
