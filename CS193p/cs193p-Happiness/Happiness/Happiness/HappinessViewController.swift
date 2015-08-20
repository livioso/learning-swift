//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Livio Bieri on 19/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController {
    var happines: Int = 50 { // very sad = 0, super happy = 100
        didSet {
            happines = min(max(happines, 0), 100)
            print("Happines = \(happines)")
            updateUI()
        }
    }

    func updateUI() {
    }
}
