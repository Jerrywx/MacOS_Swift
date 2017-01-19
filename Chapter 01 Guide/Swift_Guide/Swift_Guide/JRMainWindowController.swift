//
//  JRMainWindowController.swift
//  MacOS_Swift
//
//  Created by 王潇 on 2017/1/16.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRMainWindowController: NSWindowController {

	/// 懒加载Window
	lazy var myWindow: JRWindow = {
		let frame = CGRect(x: 0, y: 0, width: 800, height: 400)
		let style : NSWindowStyleMask = [.titled,.closable,.resizable]
		//创建window
		let window = JRWindow(contentRect:frame, styleMask:style, backing:.buffered, defer:false)
		window.isRestorable = false
		window.title = "Code Create Window"
		window.windowController = self
		return window
	}()
	
	/// 懒加载 ViewController
	lazy var vc: NSViewController = {
		let viewController  = JRMainViewController()
		return viewController
	}()

	
	/// 重写初始化方法
	///
	/// - Parameter window: window
	override init(window: NSWindow?){
		super.init(window:window)
		
		/// 1. 设置 window
		self.window = self.myWindow
		/// 2. 设置控制器
		self.contentViewController = self.vc
		/// 3. 设置显示位置
//		self.window?.center()
//		self.window?.cascadeTopLeft(from: CGPoint(x: 100, y: 100))
	}
	
	///
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}









