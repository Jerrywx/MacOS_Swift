
//
//  JRMainViewController.swift
//  Swift_Guide
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRMainViewController: NSViewController {

	/// 显示View
	lazy var myView: NSView = {
		let frame = CGRect(x: 0, y: 0, width: 800, height: 500)
		let view = NSView(frame: frame)
		return view
	}()
	
	/// 构造方法
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = myView
		/// 初始化界面
//		setupView()
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
