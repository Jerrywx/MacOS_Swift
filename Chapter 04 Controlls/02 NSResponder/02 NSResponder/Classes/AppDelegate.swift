//
//  AppDelegate.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	/*
		1. 自定义 NSWindowController
		2. 自定义 NSWindow
		2. 自定义 NSViewController
	*/
	
	lazy var myWindowController: JRBaseWindowController = {
		let windowController = JRBaseWindowController()
		return windowController
	}()
	
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		self.myWindowController.showWindow(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	/// 关闭应用
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}

}

