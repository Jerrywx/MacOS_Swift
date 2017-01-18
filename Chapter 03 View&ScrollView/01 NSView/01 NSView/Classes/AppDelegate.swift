//
//  AppDelegate.swift
//  01 NSView
//
//  Created by 王潇 on 2017/1/18.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!


	func applicationDidFinishLaunching(_ aNotification: Notification) {
		/// 初始化view
		setupUI()
		/// 添加通知
		addNotification()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

// MARK: - 初始化界面
extension AppDelegate {
	
	/// 初始化主View
	fileprivate func setupUI() {
		
		/// 1. 创建 主view
		let bounds = window.contentView?.bounds
		window.contentView = JRMainView(frame: bounds!)
		
		/// 2. 添加响应鼠标点击的view & layer
		addMouseDownView()
		adddrawRectView()
		addNoDrawView()
		
		/// 3. 截图按钮
		let button = NSButton(frame: CGRect(x: 250, y: 250, width: 80, height: 25))
		button.title		= "应用截图"
		button.bezelStyle	= .roundRect
		button.target		= self
		button.action		= #selector(saveAppImage)
		window.contentView?.addSubview(button)
		
	}
	/// 截图保存
	@objc private func saveAppImage() {
		print(#function)
		
		/// 锁定视图
		window.contentView?.lockFocus()
		/// 截取图片
		let image = NSImage(data: (self.window.contentView?.dataWithPDF(inside: (window.contentView?.bounds)!))!)
		window.contentView?.unlockFocus()
		let imageData = image?.tiffRepresentation
		
		/// 获取保存路径
		let fileManager = FileManager.default
		/// 写死的
		let path = "/Users/wangxiao/Desktop/image.png"
		fileManager.createFile(atPath: path, contents: imageData, attributes: nil)
		let fileUrl = URL(fileURLWithPath: path)
		/// 保存图片
		
		NSWorkspace.shared().activateFileViewerSelecting([fileUrl])
		
	}
	
	/// 绘制 DrawRect绘制View
	private func addNoDrawView() {
		let view = JRWithoutDrawView(frame: CGRect(x: 40, y: 250, width: 150, height: 150))
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.lightGray.cgColor
		window.contentView?.addSubview(view)
	}
	/// 绘制 DrawRect绘制View
	private func adddrawRectView() {
		let view = JRDrawView(frame: CGRect(x: 250, y: 40, width: 150, height: 150))
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.lightGray.cgColor
		window.contentView?.addSubview(view)
	}
	/// 添加响应鼠标点击的view & layer
	private func addMouseDownView() {
		let v = JRCustomView(frame: CGRect(x: 40, y: 40, width: 150, height: 150))
		v.wantsLayer				= true
		v.layer?.backgroundColor	= NSColor.orange.cgColor
		v.layer?.cornerRadius		= 20
		v.layer?.borderColor		= NSColor.red.cgColor
		v.layer?.borderWidth		= 5
		self.window.contentView?.addSubview(v)
	}
}

// MARK: - 应用通知
extension AppDelegate {
	
	/// 添加 frame 监听
	func addNotification() {
		NotificationCenter.default.addObserver(self,
		                                       selector: #selector(frameChanged),
		                                       name: NSNotification.Name.NSViewFrameDidChange,
		                                       object: nil)
	}
	
	/// frame 坚挺回调
	///
	/// - Parameter aNotification: 通知
	func frameChanged(_ aNotification: Notification) {
		if let view = aNotification.object {
				print("===== \((view as AnyObject).frame)")
		}
	}
	
}

