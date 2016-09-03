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

    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: -2)
    var apm:Apm?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        apm = Apm()
        
        _ = acquirePrivileges()
        initializeMenu()
        initializeEvents()
    }
    
    // MARK: accessability
    func acquirePrivileges() -> Bool {
        let dict = [(kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String) : true]
        let accessEnabled = AXIsProcessTrustedWithOptions(dict as CFDictionary?)
        if accessEnabled != true {
            print("Please enable logger in System preferences")
        }
        
        return accessEnabled == true
    }
    
    func initializeEvents() {
        NSEvent.addGlobalMonitorForEvents(
            matching: .keyDown, handler: { (event: NSEvent) in
                self.apm?.event(event: event)
        })
        
        NSEvent.addGlobalMonitorForEvents(
            matching: .leftMouseUp, handler: { (event: NSEvent) in
                self.apm?.event(event: event)
        })
        
        NSEvent.addGlobalMonitorForEvents(
            matching: .rightMouseUp, handler: { (event: NSEvent) in
                self.apm?.event(event: event)
        })
    }
    
    // MARK: menu initializer
    func initializeMenu() {
        setupMenuItems()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateMenuTitle), userInfo: nil, repeats: true)
    }
    
    func setupMenuItems() {
        if let button = statusItem.button {
            button.title = "apm"
        }
        
        let menu = NSMenu()
//        menu.addItem(NSMenuItem(title: "APM Score", action: #selector(self.apmScore), keyEquivalent: "a"))
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(self.quitApplication), keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
    func updateMenuTitle() {
        if let apm = self.apm {
            statusItem.title = "\(apm.currentApms())"
        }
    }
    
    // MARK: menu functions
    func apmScore() {
      
    }
    
    func quitApplication() {
        NSApplication.shared().terminate(self)
    }
    
   

}

