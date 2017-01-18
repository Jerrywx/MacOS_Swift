//
//  JRMainView.swift
//  01 NSView
//
//  Created by 王潇 on 2017/1/18.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRMainView: NSView {

	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		self.wantsLayer = true
		self.layer?.backgroundColor = NSColor.white.cgColor
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	/// 转换坐标系
	override var isFlipped: Bool {
		get {
			return true
		}
	}
	
}
