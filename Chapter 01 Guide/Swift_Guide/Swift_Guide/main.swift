//
//  main.swift
//  Swift_Guide
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

autoreleasepool {
	
	/// 1. 创建应用
	let app = NSApplication.shared()
	
	/// 创建window
//	let window = MyWindow()
//	let frame = CGRect(x: 20, y: 20, width: 800, height: 400)
//	window.setFrame(frame, display: true)
//	app.beginModalSession(for: window)
	
	/// 2. 设置代理
	let delegate	=	AppDelegate()
	app.delegate	=	delegate				//配置应用代理
	
	/// 3. 运行应用
	app.run()
}


