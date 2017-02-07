//
//  JRBaseViewController.swift
//  TableViewCode
//
//  Created by 王潇 on 2017/2/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	/// View
	lazy var baseView: JRBaseView = {
		let frame = CGRect(x: 0, y: 0, width: 600, height: 400)
		let view  = JRBaseView(frame: frame)
		return view
	}()
	
	/// 重写构造方法
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = self.baseView
		self.view.wantsLayer = true
		self.view.layer?.backgroundColor = NSColor.orange.cgColor
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
