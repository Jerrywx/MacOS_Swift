//
//  JRBaseViewController.swift
//  01 NSPanel
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	var panel: JRBasePanel!
	var keyWindow: NSWindow!
	
	lazy var baseView: JRBaseView = {
		let frame = CGRect(x: 0, y: 0, width: 600, height: 400)
		let view  = JRBaseView(frame: frame)
		return view
	}()
	
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = self.baseView
		
		self.view.wantsLayer = true
		self.view.layer?.backgroundColor = NSColor.orange.cgColor
		
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - NSPanel
extension JRBaseViewController {
	
	fileprivate func setupUI() {
		
		let button			= NSButton(frame: CGRect(x: 100, y: 100, width: 80, height: 30))
		button.bezelStyle	= .roundRect
		button.title		= "打开 Pannel"
		button.target		= self
		button.action		= #selector(openPanel)
		self.view.addSubview(button)
	}
	
	@objc private func openPanel() {
		print(#function)
		let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
		let style: NSWindowStyleMask = [.closable, .titled]
		self.panel = JRBasePanel(contentRect: frame,
		                     styleMask: style, 
		                     backing: .buffered, 
		                     defer: false)
		
		self.keyWindow = NSApplication.shared().keyWindow!
		self.keyWindow.beginSheet(self.panel, completionHandler: nil)
		
		self.panel.button.target = self
		self.panel.button.action = #selector(closeAct)
		print(self.keyWindow)
	}
	
	@objc private func closeAct() {
		self.keyWindow.endSheet(self.panel)
		print(self.keyWindow)
	}
}




