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
    @IBOutlet var statusMenu: NSMenu
    var statusItem: NSStatusItem? = nil
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    override func awakeFromNib() {
        self.statusItem = NSStatusBar.systemStatusBar()
            .statusItemWithLength(CGFloat(NSVariableStatusItemLength))
        self.statusItem!.menu = self.statusMenu
        self.statusItem!.title = "Status"
        self.statusItem!.highlightMode = true
    }
    
    @IBAction func doSomethingWithMenuSelection(sender : AnyObject) {
        println("Action pressed")
    }
}

