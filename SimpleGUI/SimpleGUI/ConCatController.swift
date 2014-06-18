//
//  ConCatController.swift
//  SimpleGUI
//
//  Created by Livio Bieri on 18/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Foundation
import Cocoa

class ConCatController: NSObject {
    @IBOutlet var firstName: NSTextField
    @IBOutlet var secondName: NSTextField
    @IBOutlet var fullName: NSTextField
    
    @IBAction func concatNameButton(sender : NSButton) {
        fullName.stringValue = firstName.stringValue + " " +
        secondName.stringValue
    }

}