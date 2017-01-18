//
//  AppDelegate.swift
//  01 NSView
//
//  Created by 王潇 on 2017/1/18.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!


	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		
		let v = JRCustomView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
		v.wantsLayer = true
		v.layer?.backgroundColor = NSColor.red.cgColor
		self.window.contentView?.addSubview(v)
		
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

