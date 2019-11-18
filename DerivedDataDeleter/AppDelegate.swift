//
//  AppDelegate.swift
//  DerivedDataDeleter
//
//  Created by Saagar Jha on 11/17/19.
//  Copyright © 2019 Saagar Jha. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	static let appName = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String

	var window: NSWindow!

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Create the SwiftUI view that provides the window contents.
		let contentView = ContentView()

		// Create the window and set the content view. 
		window = NSWindow(
		    contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
		    styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
		    backing: .buffered, defer: false)
		window.center()
		window.setFrameAutosaveName("Main Window")
		window.title = Self.appName
		window.contentView = NSHostingView(rootView: contentView)
		window.makeKeyAndOrderFront(nil)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

