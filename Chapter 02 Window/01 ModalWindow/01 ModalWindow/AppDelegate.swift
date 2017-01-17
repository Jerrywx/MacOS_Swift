//
//  AppDelegate.swift
//  01 ModalWindow
//
//  Created by 王潇 on 2017/1/17.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!


	func applicationDidFinishLaunching(_ aNotification: Notification) {
		setupWindow()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

// MARK: - Window 设置
extension AppDelegate {
	
	/// 设置 Window
	fileprivate func setupWindow() {
		/// 1. 创建自定义背景View
		let bgView			= MainView(frame: (window.contentView?.bounds)!)
		bgView.wantsLayer	= true
		window.contentView	= bgView
		bgView.layer?.backgroundColor = NSColor.red.cgColor
		
		/// 2. 添加按钮
		let testView = NSView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
		testView.wantsLayer				= true
		testView.layer?.backgroundColor = NSColor.orange.cgColor
		bgView.addSubview(testView)
		
		
	}
	
}

