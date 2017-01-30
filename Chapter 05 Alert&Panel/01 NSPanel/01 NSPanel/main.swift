//
//  main.swift
//  01 NSPanel
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

autoreleasepool {

	let app = NSApplication.shared()
	
	let delegate = AppDelegate()
	app.delegate = delegate
	
	app.run()
}
