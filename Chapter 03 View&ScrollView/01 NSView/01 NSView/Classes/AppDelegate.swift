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
		setupUI()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

// MARK: - 初始化界面
extension AppDelegate {
	
	/// 初始化主View
	fileprivate func setupUI() {
		
		/// 1. 创建 主view
		let bounds = window.contentView?.bounds
		window.contentView = JRMainView(frame: bounds!)
		
		/// 2. 添加测试view
		addMouseDownView()
	}
	
	/// 添加响应鼠标点击的view
	private func addMouseDownView() {
		let v = JRCustomView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
		v.wantsLayer = true
		v.layer?.backgroundColor = NSColor.orange.cgColor
		self.window.contentView?.addSubview(v)
	}
	
}


