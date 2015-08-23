//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Livio Bieri on 19/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

	@IBOutlet weak var faceView: FaceView! {
		didSet {
			faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
		}
	}
	
	private struct Constants {
		static let happinessChangeScale: CGFloat = 4
	}
	
	@IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
		
		switch gesture.state {
		case .Changed: fallthrough
		case .Ended:
			let translation = gesture.translationInView(faceView)
			let happinessChange = -Int(translation.y / Constants.happinessChangeScale)
			if happinessChange != 0 {
				happines += happinessChange
				gesture.setTranslation(CGPointZero, inView: faceView)
			}
		default: break
		}
	}

    var happines: Int = 100 { // very sad = 0, super happy = 100
        didSet {
            happines = min(max(happines, 0), 100)
            print("Happines = \(happines)")
            updateUI()
        }
    }

    func smilenesForFaceView(sender: FaceView) -> Double? {
        return -1 + Double(happines / 100 * 2)
    }

    func updateUI() {
        faceView.setNeedsDisplay()
    }
}
