//
//  JRCustomView.swift
//  01 NSView
//
//  Created by 王潇 on 2017/1/18.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRCustomView: NSView {

	/// 重写鼠标点击事件
	override func mouseDown(with event: NSEvent) {
		let point = self.convert(event.locationInWindow, to: nil)
		Swift.print("window point:\(event.locationInWindow)")
		Swift.print("view point:\(point)")
	}
}
