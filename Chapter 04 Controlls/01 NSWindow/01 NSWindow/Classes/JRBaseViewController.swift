//
//  JRBaseViewController.swift
//  01 NSWindow
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	/// 显示View
	lazy var myView: NSView = {
		let frame = CGRect(x: 0, y: 0, width: 400, height: 400)
		let view = NSView(frame: frame)
		return view
	}()
	
	/// 构造方法
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = myView
		self.view.wantsLayer = true
		self.view.layer?.backgroundColor = NSColor.red.cgColor
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
