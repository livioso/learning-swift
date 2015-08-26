//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Livio Bieri on 26/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController {
	
	static var diagnosticHistory = [Int]()
	
	override var happines: Int {
		didSet {
			DiagnosedHappinessViewController.diagnosticHistory += [happines]
		}
	}
	
	private struct History {
		static let SegueIdentifier = "showDiagnosticHistory"
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let tvc = segue.destinationViewController as? TextViewController {
			if let identifier = segue.identifier {
				switch identifier {
				case History.SegueIdentifier: tvc.text = "\(DiagnosedHappinessViewController. diagnosticHistory)"
				default: break;
				}
			}
		}
	}

}
