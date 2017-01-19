//
//  JRBaseWindowController.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseWindowController: NSWindowController {

	/// 控制器
	lazy var myViewController: JRBaseViewController = {
		let viewController = JRBaseViewController()
		return viewController
	}()
	
	/// window
	lazy var myWindow: JRBaseWindow = {
		let frame = CGRect(x: 0, y: 0, width: 800, height: 400)
		let style : NSWindowStyleMask = [.titled,.closable,.resizable]
		let window = JRBaseWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
		window.windowController = self
		window.title = "NSResponder"
		return window
	}()
	
	
	/// 重载构造方法
	override init(window: NSWindow?) {
		super.init(window: window)
		
		self.window = myWindow
		contentViewController = myViewController
		self.window?.center()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
