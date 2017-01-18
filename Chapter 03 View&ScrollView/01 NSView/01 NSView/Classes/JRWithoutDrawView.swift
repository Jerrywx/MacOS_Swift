//
//  JRWithoutDrawView.swift
//  01 NSView
//
//  Created by 王潇 on 2017/1/18.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRWithoutDrawView: NSView {

	func drawViewShape() {
		/// 锁定视图
		self.lockFocus()
		
		let text: NSString = "RoundeRect"
		let font: NSFont = NSFont(name: "Palatino-Roman", size: 24)!
		let attrs = [NSFontAttributeName : font,
		             NSForegroundColorAttributeName : NSColor.blue,
		             NSBackgroundColorAttributeName: NSColor.red]
		
		let location = NSPoint(x: 10, y: 10)
		text.draw(at: location, withAttributes: attrs)
		
		/// 解锁视图
		self.unlockFocus()
	}
	
	
	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
		drawViewShape()
	}
	
}
