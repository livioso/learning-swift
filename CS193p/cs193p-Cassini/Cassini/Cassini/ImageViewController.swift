//
//  ImageViewController.swift
//  Cassini
//
//  Created by Livio Bieri on 01/09/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
	
	var imageURL: NSURL? {
		didSet {
			image = nil
			if view.window != nil {
				// we are currently on display
				fetchImage()
			}
		}
	}
	
	private func fetchImage() {
		if let url = imageURL {
			let imageData = NSData(contentsOfURL: url)
			if imageData != nil {
				image = UIImage(data: imageData!)
			} else {
				image = nil
			}
		}
	}
	
	private var imageView = UIImageView()
	private var image: UIImage? {
		get {return imageView.image}
		set {
			imageView.image = newValue
			imageView.sizeToFit() // expands frame if necessary
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(imageView) 
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		if image == nil {
			fetchImage()
		}
	}

}