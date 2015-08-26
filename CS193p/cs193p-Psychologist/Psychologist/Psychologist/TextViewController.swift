//
//  TextViewController.swift
//  Psychologist
//
//  Created by Livio Bieri on 26/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

	@IBOutlet weak var textView: UITextView! {
		didSet {
			textView.text = text
		}
	}
	
	var text: String = "" {
		didSet {
			textView?.text = text
		}
	}
}
