//
//  main.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

autoreleasepool {
	
	/// 创建应用
	let app = NSApplication.shared()
	/// 设置代理
	let delegate = AppDelegate()
	app.delegate = delegate
	/// 运行应用
	app.run()
}
