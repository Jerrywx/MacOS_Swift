//
//  MyWindow.swift
//  Swift_Guide
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class MyWindow: NSWindow {

	override init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
		super.init(contentRect: contentRect, styleMask: style, backing: bufferingType, defer: flag)
		
		self.backgroundColor = NSColor.red
	}
}
