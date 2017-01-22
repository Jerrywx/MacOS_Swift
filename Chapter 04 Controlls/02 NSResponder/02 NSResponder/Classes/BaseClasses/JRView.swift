//
//  JR.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRView: NSView {
	
	/// 旋转坐标系
	override var isFlipped: Bool {
		get {
			return true
		}
	}
	
	/// 触摸板滑动事件
	///
	/// - Parameter event: 事件
	override func scrollWheel(with event: NSEvent) {
		NSLog("scrollWhell \(self)")
	}
}
