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

	var myWindow: NSWindow!
	
	var modalWindow: NSWindow!
	
	var sessionCode : NSModalSession!

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		setupWindow()
		
		/// 关闭应用方法2
//		NotificationCenter.default.addObserver(self, 
//		                                       selector:#selector(AppDelegate.windowClose(_:)),  
//		                                       name: NSNotification.Name.NSWindowWillClose, 
//		                                       object: nil)
		
		/// 关闭 modal
		NotificationCenter.default.addObserver(self, 
		                                         selector:#selector(AppDelegate.windowClose(_:)),  
		                                         name: NSNotification.Name.NSWindowWillClose,
		                                         object: nil)
		
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	// MARK:- 点击❌退出应用
	/// 关闭应用方法1
	/// “关闭最后一个 window 窗口或者关闭应用唯一的一个 window 时应用自动退出。”
//	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
//		return true
//	}
	
	/// 应用关闭通知 退出应用
	func windowClose(_ aNotification: Notification) {
		if let window = aNotification.object {
			if window as! NSObject == self.window! {
				NSApp.terminate(self)
			}
		}
		
		if let sessionCode = sessionCode {
			NSApplication.shared().endModalSession(sessionCode)
		}
		/// 关闭 modal
		NSApplication.shared().stopModal()
	}

	/// 应用关闭后 点击 Dock 菜单再次打开应用
	func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
		self.window.makeKeyAndOrderFront(self)
		return true
	}
}

// MARK: - Window 界面设置
extension AppDelegate {
	
	/// 设置 Window
	fileprivate func setupWindow() {
		/// 是否记录上次窗口关闭位置
//		self.window.isRestorable = false
		/// 设置窗口在中间显示
		self.window.center()
		/// 设置窗口显示位置和大小
		/// 坐标系远点在屏幕左下方
//		let frame = CGRect(x: 100, y: 100, width: 800, height: 800)
//		self.window.setFrame(frame, display: true)
		
		
		/// 1. 创建自定义背景View
		let bgView			= MainView(frame: (window.contentView?.bounds)!)
		window.contentView	= bgView
		/// 2. 添加按钮
		createButton()
		/// 3. window 设置
		setupWindowUI()
		/// 4. window 标题添加按钮
		createButtonToTitle()
	}
	
	/// window 设置
	private func setupWindowUI() {
		/// 3.1 设置window 背景色
		self.window.backgroundColor = NSColor.gray
		/// 3.2 设置window 标题
		self.window.representedURL = URL(string: "WindowTitle")
		self.window.title = "Window Title"
		/// 3.3 设置window 图片
		let image = #imageLiteral(resourceName: "AppIcon")
		self.window.standardWindowButton(.documentIconButton)?.image = image
	}
	
	/// 标题添加按钮
	private func createButtonToTitle() {
		let titleView = self.window.standardWindowButton(.closeButton)?.superview
		let x = (self.window.contentView?.frame.size.width)! - 100
		let y = ((titleView?.frame.height)! - 24) * 0.5
		let buttons = NSButton(frame: CGRect(x: x, y: y, width: 80, height: 24))
		buttons.title = "Register"
		buttons.bezelStyle = .roundRect
		titleView?.addSubview(buttons)
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

	// MARK:- 按钮点击事件
	/// 打开window
	@objc private func openWindowAct() {
		print(#function)
		
		let frame = CGRect(x: 100, y: 100, width: 400, height: 280)
		let style: NSWindowStyleMask = [.titled, .closable, .resizable]
		// 创建 window
		myWindow = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
		myWindow?.title = "New Create Window"
		// 显示 window
		myWindow?.makeKeyAndOrderFront(self)
		// 居中显示
		myWindow?.center()
	}
	
	/// 显示Modal Window
	@objc private func showModalWindow() {
		print(#function)
		let frame = CGRect(x: 100, y: 100, width: 400, height: 280)
		let style: NSWindowStyleMask = [.titled, .closable, .resizable]
		// 创建 window
		self.modalWindow = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
		self.modalWindow?.title = "New Create Window"
		
		NSApplication.shared().runModal(for: self.modalWindow)
	}
	
	/// 显示 Session Window
	@objc private func showSessionWindow() {
		print(#function)
		
		let frame = CGRect(x: 100, y: 100, width: 400, height: 280)
		let style: NSWindowStyleMask = [.titled, .closable, .resizable]
		// 创建 window
		self.modalWindow = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
		self.modalWindow?.title = "New Create Window"
		
		sessionCode = NSApplication.shared().beginModalSession(for: self.modalWindow)
	}
}

