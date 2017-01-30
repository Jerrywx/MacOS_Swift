//
//  JRBasePanel.swift
//  01 NSPanel
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBasePanel: NSPanel {
	
	var button: NSButton!
	
	override init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
		super.init(contentRect: contentRect, styleMask: style, backing: bufferingType, defer: flag)
		
		setupUI()
	}
}

// MARK: - 初始化界面
extension JRBasePanel {
	
	fileprivate func setupUI() {
		
		let frame	 = CGRect(x: 80, y: 200, width: 80, height: 30)
		self.button	 = NSButton(frame: frame)
		self.button.title = "OK"
		self.button.bezelStyle = .roundRect
		self.contentView?.addSubview(self.button)
//		self.button.target	= self
//		self.button.action	= #selector(closeAct)
	}
	
	@objc private func closeAct() {
//		self.print(#function)
		self.endSheet(self)
	}
}
