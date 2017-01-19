//
//  main.swift
//  01 NSWindow
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

autoreleasepool {
	
	let app = NSApplication()
	
	let delegate = AppDelegate()
	app.delegate = delegate
	
	app.run()
}
