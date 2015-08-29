//
//  ViewController.swift
//  Autolayout
//
//  Created by Livio Bieri on 29/08/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var textFieldUsername: UITextField!
	
	@IBOutlet weak var textFieldPassword: UITextField!
	
	@IBOutlet weak var labelPassword: UILabel!
	
	@IBAction func toggleSecure() {
		secure = !secure
	}
	
	var secure: Bool = false { didSet { updateUI() } }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateUI()
	}
	
	private func updateUI() {
		textFieldPassword.secureTextEntry = secure
		labelPassword.text = secure ? "Secure Password" : "Password"
	}
}