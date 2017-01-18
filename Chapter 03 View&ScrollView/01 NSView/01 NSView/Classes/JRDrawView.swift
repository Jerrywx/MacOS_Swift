//
//  JRDrawView.swift
//  01 NSView
//
//  Created by 王潇 on 2017/1/18.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRDrawView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

		NSColor.blue.setFill()
		let frame = self.bounds
		let path = NSBezierPath()
		path.appendRoundedRect(frame, xRadius: 20, yRadius: 20)
		path.fill()
    }

}
