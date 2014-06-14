//
//  AppDelegate.swift
//  SimpleGUI
//
//  Created by Livio Bieri on 14/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow

    @IBOutlet var firstName : NSTextField
    @IBOutlet var secondName : NSTextField
    @IBOutlet var fullName : NSTextField
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    @IBAction func concatNameButton(sender : NSButton) {
        fullName.stringValue = firstName.stringValue + " " + secondName.stringValue
    }

}

