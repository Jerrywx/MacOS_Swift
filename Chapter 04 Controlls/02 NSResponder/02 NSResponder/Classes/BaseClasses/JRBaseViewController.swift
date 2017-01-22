//
//  JRBaseViewController.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	lazy var myView: JRBaseView = {
		let frame = CGRect(x: 0, y: 0, width: 800, height: 400)
		let baseView = JRBaseView(frame: frame)
		return baseView
	}()
	
	/*
	public static var borderless: NSWindowStyleMask { get }
	public static var titled: NSWindowStyleMask { get }
	public static var closable: NSWindowStyleMask { get }
	public static var miniaturizable: NSWindowStyleMask { get }
	public static var resizable: NSWindowStyleMask { get }
	*/
	
	lazy var myViewController: NSWindowController = {
		let viewController = NSWindowController()
		return viewController
	}()
	
	lazy var myWindow: NSWindow = {
		
		let frame = CGRect(x: 0, y: 0, width: 400, height: 400)
		let style: NSWindowStyleMask = [.closable, .titled, .miniaturizable, .miniaturizable, .resizable]
		let window = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
		window.windowController	= self.myViewController
		self.myViewController.window = window;
		window.title = "New Window 😀"
		return window
	}()
	
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = self.myView
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
		
		let frame = CGRect(x: 30, y: 30, width: 200, height: 200)
		let v = JRView(frame: frame)
		v.wantsLayer = true
		v.layer?.backgroundColor = NSColor.red.cgColor
		self.view .addSubview(v)
		
		let button = JRButton(frame: CGRect(x: 20, y: 20, width: 80, height: 30))
		button.title = "创建 window"
		v.addSubview(button)
		button.target = self
		button.action = #selector(createWindow)
	}
	
	/// 创建窗口
	@objc private func createWindow() {
		print(#function)
		self.myWindow.makeKeyAndOrderFront(self)
		self.myWindow.center()
	}
	
}

    

