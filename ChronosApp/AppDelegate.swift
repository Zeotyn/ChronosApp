//
//  AppDelegate.swift
//  ChronosApp
//
//  Created by Eugen Waldschmidt on 27.10.16.
//  Copyright © 2016 Eugen Waldschmidt. All rights reserved.
//

import Cocoa
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?
    let container = MainContainer().container
    let statusItem = NSStatusBar.system().statusItem(withLength: -2)
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = #selector(AppDelegate.togglePopover(sender:))
        }

        popover.behavior = .transient

        popover.contentViewController = container.resolve(PopoverViewController.self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }

    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
    }

    func togglePopover(sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
}
