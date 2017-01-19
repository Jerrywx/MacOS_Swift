//
//  JRBaseView.swift
//  02 NSResponder
//
//  Created by 王潇 on 2017/1/19.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseView: NSView {

	/// 装换坐标系
	override var isFlipped: Bool {
		get {
			return true
		}
	}	
}
