//
//  JRBaseWindow.swift
//  01 NSWindow
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseWindowController: NSWindowController {

	/// JRBaseViewController
	lazy var vc: JRBaseViewController = {
		let vcs = JRBaseViewController()
		return vcs
	}()
	
	/// JRBaseWindow
	lazy var myWindow: JRBaseWindow = {
		let frame = CGRect(x: 20, y: 20, width: 400, height: 400)
		let style : NSWindowStyleMask = [.titled,.closable,.resizable]
		let window = JRBaseWindow(contentRect:frame, styleMask:style, backing:.buffered, defer:false)
		window.isRestorable = false
		window.title = "Code Create Window"
		window.windowController = self
		return window
	}()

	
	override init(window: NSWindow?) {
		super.init(window: window)
		
		self.window = self.myWindow
		self.contentViewController = self.vc
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
