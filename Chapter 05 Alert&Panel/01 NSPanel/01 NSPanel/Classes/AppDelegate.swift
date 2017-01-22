//
//  AppDelegate.swift
//  01 NSPanel
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

	lazy var windwoController: JRBaseWindowController = {
		let windowController = JRBaseWindowController()
		return windowController
	}()
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		self.windwoController.showWindow(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

}

