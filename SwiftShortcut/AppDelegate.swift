//
//  AppDelegate.swift
//  SwiftShortcut
//
//  Created by Shad Sharma on 12/23/16.
//  Copyright © 2016 Shad Sharma. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    var localMonitor: Any!
    var globalMonitor: Any!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        localMonitor = NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .flagsChanged], handler: self.localKeyDown)
        globalMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.keyDown, .flagsChanged], handler: self.globalKeyDown)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        NSEvent.removeMonitor(localMonitor)
        NSEvent.removeMonitor(globalMonitor)
    }
    
    func localKeyDown(event: NSEvent) -> NSEvent? {
        let shortcut = KeyboardShortcut.from(NSEvent: event)
        print(shortcut)
        return event
    }

    func globalKeyDown(event: NSEvent) {
        self.localKeyDown(event: event)
    }
}

