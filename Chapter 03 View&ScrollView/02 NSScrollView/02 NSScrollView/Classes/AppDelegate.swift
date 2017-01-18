//
//  AppDelegate.swift
//  02 NSScrollView
//
//  Created by 王潇 on 2017/1/18.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!
	
	var scrollView: JRMainScrollView!
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		setupUI()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

// MARK: - 初始化UI
extension AppDelegate {
	
	/// 初始化界面
	fileprivate func setupUI() {
		
		/// 设置窗口位置
		let frame = CGRect(x: 400, y: 400, width: 860, height: 500)
		window.setFrame(frame, display: true)
		
		/// 创建背景View
		let bounds	 = window.contentView?.bounds
		let baseView = JRBaseView(frame: bounds!)
		window.contentView = baseView
		
		/// 添加 ScrollView
		addScrollView()
		/// 添加控制按钮
		addControlButton()
		/// 添加TextView
		addTextView()
		
		/// debug
		baseView.wantsLayer = true
		baseView.layer?.backgroundColor = NSColor.lightGray.cgColor
	}

	/// 添加 ScrollView
	private func addScrollView() {
		/// 创建 ScrollView
		let frame = CGRect(x: 20, y: 20, width: 400, height: 300)
		scrollView = JRMainScrollView(frame: frame)

		/// 设置 ScrollView 内容
		let image		= NSImage(named: "xcode")
		let imageFrame	= CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
		let imageView	= NSImageView(frame: imageFrame)
		imageView.image = image

		/// 设置 ScrollView
		scrollView.documentView			= imageView
		scrollView.hasVerticalRuler		= true
		scrollView.hasHorizontalRuler	= true
		scrollView.hasHorizontalScroller = true
		scrollView.hasVerticalScroller	 = true

		/// 添加 ScrollView
		window.contentView?.addSubview(scrollView)
	}
	
	/// 添加 ScrollView 控制按钮
	private func addControlButton() {
		
		/// 跳转按钮1
		let button = NSButton(frame: CGRect(x: 20, y: 340, width: 400, height: 30))
		button.title		= "跳转到某位置"
		button.target		= self;
		button.action		= #selector(scrollViewToPoint)
		button.bezelStyle	= .roundRect
		window.contentView?.addSubview(button)
		
		/// 跳转按钮2
		let button2 = NSButton(frame: CGRect(x: 20, y: 390, width: 400, height: 30))
		button2.title		= "跳转到某区域"
		button2.target		= self;
		button2.action		= #selector(scrollViewTo)
		button2.bezelStyle	= .roundRect
		window.contentView?.addSubview(button2)
	}

	/// 控制按钮事件
	@objc private func scrollViewToPoint() {
		print(#function)
		let point = CGPoint(x: 0, y: 0)
		self.scrollView?.contentView.scroll(to: point)
	}
	
	@objc private func scrollViewTo() {
		print(#function)
		let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
		self.scrollView.contentView.scrollToVisible(rect)
	}
}

// MARK: - 添加 TextView
extension AppDelegate {
	
	/// 添加 TextView
	fileprivate func addTextView() {
		let frame		= CGRect(x: 440, y: 20, width: 400, height: 300)
		let textView	= NSTextView(frame: frame)
		textView.string = "asdasdsasdasdsadasdas \nasdsadasdasdasdas \nasda \nsdasda \ndsasdasdas \nkDADiskDescriptionMediaBSDNameKey\nasdasdsasdasdsadasdas \nasdsadasdasdasdas \nasda \nsdasda \ndsasdasdas \nkDADiskDescriptionMediaBSDNameKey\nasdasdsasdasdsadasdas \nasdsadasdasdasdas \nasda \nsdasda \ndsasdasdas \nkDADiskDescriptionMediaBSDNameKey\nasdasdsasdasdsadasdas \nasdsadasdasdasdas \nasda \nsdasda \ndsasdasdas \nkDADiskDescriptionMediaBSDNameKey\nasdasdsasdasdsadasdas \nasdsadasdasdasdas \nasda \nsdasda \ndsasdasdas \nkDADiskDescriptionMediaBSDNameKey\nasdasdsasdasdsadasdas \nasdsadasdasdasdas \nasda \nsdasda \ndsasdasdas \nkDADiskDescriptionMediaBSDNameKey"
		window.contentView?.addSubview(textView)
		
	}
	
}


