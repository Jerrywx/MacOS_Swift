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
		
		/// 打开 普通 Pannel
		let button			= NSButton(frame: CGRect(x: 100, y: 20, width: 120, height: 30))
		button.bezelStyle	= .roundRect
		button.title		= "打开 普通 Pannel"
		button.target		= self
		button.action		= #selector(openPanel)
		self.view.addSubview(button)
		
		/// 打开文件
		let button2			= NSButton(frame: CGRect(x: 100, y: 70, width: 120, height: 30))
		button2.bezelStyle	= .roundRect
		button2.title		= "打开 文件 Pannel"
		button2.target		= self
		button2.action		= #selector(openFile)
		self.view.addSubview(button2)
		
		/// 打开文件
		let button3			= NSButton(frame: CGRect(x: 100, y: 120, width: 120, height: 30))
		button3.bezelStyle	= .roundRect
		button3.title		= "获取字符串"
		button3.target		= self
		button3.action		= #selector(openFile)
		self.view.addSubview(button3)
		
		/// 打开文件
		let button4			= NSButton(frame: CGRect(x: 100, y: 170, width: 120, height: 30))
		button4.bezelStyle	= .roundRect
		button4.title		= "获取图片"
		button4.target		= self
		button4.action		= #selector(openFile)
		self.view.addSubview(button4)
		
		/// 打开文件
		let button5			= NSButton(frame: CGRect(x: 100, y: 220, width: 120, height: 30))
		button5.bezelStyle	= .roundRect
		button5.title		= "保存字符串"
		button5.target		= self
		button5.action		= #selector(openFile)
		self.view.addSubview(button5)
		
		/// 打开文件
		let button8			= NSButton(frame: CGRect(x: 100, y: 270, width: 120, height: 30))
		button8.bezelStyle	= .roundRect
		button8.title		= "保存图片"
		button8.target		= self
		button8.action		= #selector(openFile)
		self.view.addSubview(button8)
		
		/// 打开文件
		let button6			= NSButton(frame: CGRect(x: 100, y: 320, width: 120, height: 30))
		button6.bezelStyle	= .roundRect
		button6.title		= "选择颜色"
		button6.target		= self
		button6.action		= #selector(openFile)
		self.view.addSubview(button6)
		
		/// 打开文件
		let button7			= NSButton(frame: CGRect(x: 100, y: 370, width: 120, height: 30))
		button7.bezelStyle	= .roundRect
		button7.title		= "选择字体"
		button7.target		= self
		button7.action		= #selector(openFile)
		self.view.addSubview(button7)
	}
	////////////////////////////////////////////////////////
	@objc private func openFile() {
		let openDlg = NSOpenPanel()
		openDlg.canChooseFiles = true
		openDlg.canChooseDirectories = false
		openDlg.allowsMultipleSelection = false
		openDlg.allowedFileTypes = ["jpg"]
		openDlg.begin(completionHandler: { [weak self]  result in
			
		})
	}

	////////////////////////////////////////////////////////
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




