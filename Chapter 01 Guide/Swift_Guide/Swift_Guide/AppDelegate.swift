//
//  AppDelegate.swift
//  Swift_Guide
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	/// 懒加载 JRMainWindowController
	lazy var wc: JRMainWindowController = {
		let wc = JRMainWindowController()
		return wc
	}()
	
	/// 启动应用
	///
	/// - Parameter aNotification: aNotification description
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		self.wc.showWindow(self)
	}
	
	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

}

