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
		window.contentView	= bgView
		/// 2. 添加按钮
		createButton()
		
		/// 3. window 设置
		self.window.backgroundColor = NSColor.gray
	}
	
	/// 创建按钮
	private func createButton() {
		
		/// 创建打开 Window 按钮
		let openWindow	= NSButton(frame: CGRect(x: 40,
		                                        y: 40, 
		                                        width: 160,
		                                        height: 30))
		openWindow.bezelStyle	= .regularSquare
		openWindow.title		= "Create Window"
		openWindow.target		= self
		openWindow.action		= #selector(openWindowAct)
		window.contentView?.addSubview(openWindow)
		
		/// 创建Modal Window
		let  modalWindow = NSButton(frame: CGRect(x: 40, 
		                                          y: 100, 
		                                          width: 160,
		                                          height: 30))
		modalWindow.bezelStyle	= .regularSquare
		modalWindow.title		= "Show Modal Window"
		modalWindow.target		= self
		modalWindow.action		= #selector(showModalWindow)
		window.contentView?.addSubview(modalWindow)
		
		/// 创建 Sessions Window
		let sessionWindow = NSButton(frame: CGRect(x: 40, 
		                                           y: 160, 
		                                           width: 160,
		                                           height: 30))
		sessionWindow.bezelStyle	= .regularSquare
		sessionWindow.title			= "Show Sessions Window"
		sessionWindow.target		= self
		sessionWindow.action		= #selector(showSessionWindow)
		window.contentView?.addSubview(sessionWindow)
	}

	/// 打开window
	@objc private func openWindowAct() {
		print(#function)
	}
	
	/// 显示Modal Window
	@objc private func showModalWindow() {
		print(#function)
	}
	
	/// 显示 Session Window
	@objc private func showSessionWindow() {
		print(#function)
	}
}

