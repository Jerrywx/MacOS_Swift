//
//  JRWindow.swift
//  MacOS_Swift
//
//  Created by 王潇 on 2017/1/16.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRWindow: NSWindow {

	override func scrollWheel(with event: NSEvent) {
		NSLog("scrollWhell \(self)")
	}
	
}
