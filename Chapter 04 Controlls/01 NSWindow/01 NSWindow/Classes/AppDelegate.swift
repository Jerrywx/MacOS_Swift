//
//  AppDelegate.swift
//  01 NSWindow
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa


class AppDelegate: NSObject, NSApplicationDelegate {

	/// WindowController
	lazy var windowController: JRBaseWindowController = {
		let windowController = JRBaseWindowController()
		return windowController
	}()
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		/// 显示windowController
		self.windowController.showWindow(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}

