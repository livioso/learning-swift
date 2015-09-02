//
//  ImageViewController.swift
//  Cassini
//
//  Created by Livio Bieri on 01/09/15.
//  Copyright © 2015 Livio Bieri. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	
	@IBOutlet weak var scrollView: UIScrollView! {
		didSet {
			scrollView.contentSize = imageView.frame.size
			scrollView.delegate = self
			scrollView.minimumZoomScale = 0.03
			scrollView.maximumZoomScale = 1.00
		}
	}
	
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
			// multithreaded fetching
			spinner?.startAnimating()
			let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
			dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
				let imageData = NSData(contentsOfURL: url)
				// dispatch back to the main queue
				dispatch_async(dispatch_get_main_queue()) {
					if imageData != nil {
						self.image = UIImage(data: imageData!)
					} else {
						self.image = nil
					}
				}
			}
		}
	}
	
	private var imageView = UIImageView()
	private var image: UIImage? {
		get {return imageView.image}
		set {
			imageView.image = newValue
			imageView.sizeToFit() // expands frame if necessary
			scrollView?.contentSize = imageView.frame.size
			spinner?.stopAnimating()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		scrollView.addSubview(imageView)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		if image == nil {
			fetchImage()
		}
	}
	
	func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
		 return imageView
	}
}