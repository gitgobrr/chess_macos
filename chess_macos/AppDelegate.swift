//
//  AppDelegate.swift
//  chess_macos
//
//  Created by sergey on 17.09.2022.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        
        window.contentAspectRatio = NSSize(width: 1, height: 1)
        
        guard let screenFrame = window.screen?.frame else { return }
        
        window.maxFullScreenContentSize = NSSize(width: screenFrame.height, height: screenFrame.height)
        window.contentMinSize = NSSize(width: screenFrame.width/4, height: screenFrame.width/4)
        window.setContentSize(window.contentMinSize)
        
        
        window.level = .floating
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

