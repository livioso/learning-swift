//
//  SpeakerDelegate.swift
//  Speaker
//
//  Created by Livio Bieri on 22/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Foundation
import Cocoa

class SpeakerDelegate: NSObject {
    
    @IBOutlet var textToSpeak: NSTextField
    
    @IBAction func start(sender: NSButton) {
    }
    
    @IBAction func stop(sender: NSButton) {
        textToSpeak.stringValue = "Hallo"
    }
}