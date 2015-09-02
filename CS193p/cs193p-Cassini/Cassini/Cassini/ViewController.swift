//
//  ViewController.swift
//  Cassini
//
//  Created by Livio Bieri on 01/09/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

struct Storyboard {
	static let segueShowCassini = "showCassiniImage"
	static let segueShowSaturn = "showSaturnImage"
	static let segueShowEarth = "showEarthImage"
}

class ViewController: UIViewController {
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let ivc = segue.destinationViewController as? ImageViewController {
			if let identifier = segue.identifier {
				switch identifier {
				case Storyboard.segueShowCassini:
					ivc.imageURL = DemoURL.NASA.Cassini
					ivc.title = "Cassini" 
				case Storyboard.segueShowSaturn:
					ivc.imageURL = DemoURL.NASA.Saturn
					ivc.title = "Saturn"
				case Storyboard.segueShowEarth:
					ivc.imageURL = DemoURL.NASA.Earth
					ivc.title = "Earth"
				default: break
				}
			}
			
		}
		
	}
}