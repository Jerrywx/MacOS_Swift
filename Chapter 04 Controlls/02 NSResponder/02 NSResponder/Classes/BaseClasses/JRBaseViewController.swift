//
//  JRBaseViewController.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	lazy var myView: JRBaseView = {
		let frame = CGRect(x: 0, y: 0, width: 800, height: 400)
		let baseView = JRBaseView(frame: frame)
		return baseView
	}()
	
	
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = self.myView
	}
		
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

    

