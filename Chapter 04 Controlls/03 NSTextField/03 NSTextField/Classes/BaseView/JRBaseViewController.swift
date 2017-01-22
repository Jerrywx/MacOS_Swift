//
//  JRBaseViewController.swift
//  03 NSTextField
//
//  Created by 王潇 on 2017/1/22.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	var userName: NSTextField!
	var userField: NSSecureTextField!
	
	lazy var myView: JRBaseView = {
		let frame = CGRect(x: 0, y: 0, width: 800, height: 400)
		let baseView = JRBaseView(frame: frame)
		return baseView
	}()
	
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		self.view = self.myView
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - 界面相关
extension JRBaseViewController {
	
	/// 初始化界面
	fileprivate func setupUI() {
		
		/// 测试 View
//		addTestView()
		
		loginUI()
	}
	
	/// 用户注册界面
	private func loginUI() {
		
		/// 用户名
		let userName: NSTextField	= NSTextField(string: "user Name:")
		userName.sizeToFit()
		userName.isEditable			= false
		userName.isBordered			= false
		userName.frame.origin.x		= 40
		userName.frame.origin.y		= 40
		userName.frame.size.width	= 100
		userName.backgroundColor	= NSColor.clear
		self.view.addSubview(userName)
		
		/// 用户名输入框
		let userField: NSTextField	= NSTextField()
		userField.placeholderString	= "userName"
		userField.sizeToFit()
		userField.maximumNumberOfLines = 1
		userField.frame.origin.y	= 40
		userField.frame.origin.x	= 160
		userField.frame.size.width	= 200
		userField.backgroundColor	= NSColor.clear
		self.view.addSubview(userField)
		self.userName = userField
		
		/// 用户密码
		let userPsw: NSTextField	= NSTextField(string: "password:")
		userPsw.sizeToFit()
		userPsw.isEditable			= false
		userPsw.isBordered			= false
		userPsw.frame.origin.x		= 40
		userPsw.frame.origin.y		= 80
		userPsw.frame.size.width	= 100
		userPsw.backgroundColor	= NSColor.clear
		self.view.addSubview(userPsw)

		/// 用户名输入框
		let pwdField: NSSecureTextField	= NSSecureTextField()
		pwdField.placeholderString	= "password"
		pwdField.sizeToFit()
		pwdField.maximumNumberOfLines = 1
		pwdField.frame.origin.y		= 80
		pwdField.frame.origin.x		= 160
		pwdField.frame.size.width	= 200
		pwdField.backgroundColor	= NSColor.clear
		self.view.addSubview(pwdField)
		self.userField = pwdField
		
		
		/// 登录
		let button = NSButton(frame: CGRect(x: 40, y: 120, width: 320, height: 40))
		button.bezelStyle = .roundRect
		button.title = "登  录"
		self.view.addSubview(button)
		button.target = self
		button.action = #selector(loginAction)
	}
	
	/// 登录操作
	@objc private func loginAction() {
		print(#function)
		print("用户名: \(self.userName.stringValue)")
		print("用户密码: \(self.userField.stringValue)")
	}
	
	/// 测试View
	private func addTestView() {
		let view = JRBaseView(frame: CGRect(x: 20, y: 20, width: 80, height: 80))
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.red.cgColor
		self.view.addSubview(view)
	}
}












