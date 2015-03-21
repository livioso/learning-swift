//
//  Speaker.swift
//  Speaker2
//
//  Created by Livio Bieri on 25/07/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Foundation
import Cocoa

class Speaker : NSObject, NSApplicationDelegate {
    
    var speechSynthesizer: NSSpeechSynthesizer? = NSSpeechSynthesizer()
    
    @IBOutlet var textToSpeech: NSTextField? = NSTextField()
    @IBAction func toSpeechButton (sender: AnyObject) {
        var toRead = textToSpeech!.stringValue
        
        speechSynthesizer!.startSpeakingString(toRead)
    }
}