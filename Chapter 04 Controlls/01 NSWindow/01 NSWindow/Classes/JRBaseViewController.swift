//
//  JRBaseViewController.swift
//  01 NSWindow
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	/// 显示View
	lazy var myView: NSView = {
		let frame = CGRect(x: 0, y: 0, width: 400, height: 400)
		let view = NSView(frame: frame)
		return view
	}()

	lazy var myWindowController: NSWindowController = {
		let windowVC = NSWindowController()
		return windowVC
	}()
	
	/// 创建 window
	lazy var myWindow: NSWindow = {
		let frame = CGRect(x: 0, y: 0, width: 800, height: 800)
		let style: NSWindowStyleMask = [.titled, .closable, .resizable]
		let window = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
		window.title = "New Window"
		window.windowController = self.myWindowController
		self.myWindowController.window = window;
		return window
	}()

	
	
	/// 构造方法
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = myView
		self.view.wantsLayer = true
		self.view.layer?.backgroundColor = NSColor.red.cgColor
		
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - 初始化界面
extension JRBaseViewController {
	
	/// 初始化界面
	fileprivate func setupUI() {
		
		/// 添加按钮
		let frame = CGRect(x: 100, y: 100, width: 80, height: 30)
		let button: NSButton = NSButton(frame: frame)
		button.title = "弹出window"
		button.target = self
		button.action = #selector(createWindow)
		view.addSubview(button)
	}
	
	/// 创建 window
	@objc private func createWindow() {
		print(#function)
		
		self.myWindow.makeKeyAndOrderFront(self)
		self.myWindow.center()
	}
}





