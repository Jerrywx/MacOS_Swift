//
//  JRButton.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRButton: NSButton {

	/// 触摸板滑动事件
	///
	/// - Parameter event: 事件
	override func scrollWheel(with event: NSEvent) {
		NSLog("scrollWhell \(self)")
	}
	
}
