//
//  AppDelegate.swift
//  TableViewCode
//
//  Created by 王潇 on 2017/2/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

	/// NSWindowController
	lazy var windowController: JRBaseWindowController = {
		let windowController = JRBaseWindowController()
		return windowController
	}()
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		self.windowController.showWindow(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	/// 点击❌退出应用
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
}

