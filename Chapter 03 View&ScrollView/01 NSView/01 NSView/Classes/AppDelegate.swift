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
		
		/// 2. 添加响应鼠标点击的view & layer
		addMouseDownView()
		adddrawRectView()
	}
	
	/// 绘制View
	private func adddrawRectView() {
		let view = JRDrawView(frame: CGRect(x: 250, y: 40, width: 150, height: 150))
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.lightGray.cgColor
		window.contentView?.addSubview(view)
		
	}
	
	/// 添加响应鼠标点击的view & layer
	private func addMouseDownView() {
		let v = JRCustomView(frame: CGRect(x: 40, y: 40, width: 150, height: 150))
		v.wantsLayer				= true
		v.layer?.backgroundColor	= NSColor.orange.cgColor
		v.layer?.cornerRadius		= 20
		v.layer?.borderColor		= NSColor.red.cgColor
		v.layer?.borderWidth		= 5
		self.window.contentView?.addSubview(v)
	}
	
}


