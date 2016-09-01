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
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = #selector(self.printQuote)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func printQuote(sender:AnyObject) {
        let quoteText = "Hello"
        let quoteAuthor = "Hevets"
        
        print("\(quoteText) \n--'\(quoteAuthor)'")
    }

}

