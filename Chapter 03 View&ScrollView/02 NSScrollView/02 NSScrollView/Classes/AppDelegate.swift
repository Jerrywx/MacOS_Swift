//
//  AppDelegate.swift
//  02 NSScrollView
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
		setupUI()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

// MARK: - 初始化UI
extension AppDelegate {
	
	/// 初始化界面
	fileprivate func setupUI() {
		
		/// 设置窗口位置
		let frame = CGRect(x: 400, y: 400, width: 800, height: 500)
		window.setFrame(frame, display: true)
		
		/// 创建背景View
		let bounds	 = window.contentView?.bounds
		let baseView = JRBaseView(frame: bounds!)
		window.contentView = baseView
		
		/// 添加
		addScrollView()
		
		/// debug
		baseView.wantsLayer = true
		baseView.layer?.backgroundColor = NSColor.lightGray.cgColor
	}

	///  添加 ScrollView
	private func addScrollView() {
		let frame = CGRect(x: 20, y: 20, width: 400, height: 300)
		let mainView = JRMainScrollView(frame: frame)

		/// 设置内容
		let image		= NSImage(named: "xcode")
		let imageFrame	= CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
		let imageView	= NSImageView(frame: imageFrame)
		imageView.image = image

		mainView.hasVerticalRuler	= true
		mainView.hasHorizontalRuler = true
		mainView.documentView = imageView

		window.contentView?.addSubview(mainView)
	}
	
}


