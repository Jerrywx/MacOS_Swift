//
//  JRBaseWindowController.swift
//  01 NSPanel
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseWindowController: NSWindowController {

	lazy var myViewController: JRBaseViewController = {
		let viewController = JRBaseViewController()
		return viewController
	}()
	
	lazy var myWindow: NSWindow = {
		let frame = CGRect(x: 0, y: 0, width: 600, height: 400)
		let style: NSWindowStyleMask = [.closable, .titled, .resizable]
		let window = JRBaseWindow(contentRect: frame, 
		                          styleMask: style, 
		                          backing: .buffered, 
		                          defer: false)
		window.windowController = self
		window.contentViewController = self.myViewController
		window.title = "NSPanel"
		return window
	}()
	
	override init(window: NSWindow?) {
		super.init(window: window)
		self.window = self.myWindow
		self.window?.center()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
