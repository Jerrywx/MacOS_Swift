//
//  AppDelegate.swift
//  03 NSTextField
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

	/// 窗口控制器
	lazy var myWindowController: JRBaseWindowController = {
		let windowController = JRBaseWindowController()
		return windowController
	}()
	
	
	/// 引用启动
	///
	/// - Parameter aNotification: 通知
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		self.myWindowController.showWindow(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
}

