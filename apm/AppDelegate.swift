//
//  AppDelegate.swift
//  apm
//
//  Created by Steve Henderson on 2016-08-31.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: -2)
    
    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        initializeMenu()
    }
    
    // MARK:
    func initializeMenu() {
        setupMenuItems()
    }
    
    func setupMenuItems() {
        if let button = statusItem.button {
            button.title = "999"
//            button.image = NSImage(named: "StatusBarButtonImage")
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "APM Score", action: #selector(self.apmScore), keyEquivalent: "a"))
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(self.quitApm), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
    func apmScore() {
        print("Something")
    }
    
    func quitApm() {
        NSApplication.shared().terminate(self)
    }

}

