//
//  LoginViewController.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/15.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit
import SnapKit
import WisdomHUD

class LoginViewController: UIViewController,UITextFieldDelegate {
    //返回按钮
    var backBtn:UIButton?
    //标题
    var titleLab:UILabel?
    //用户名视图
    var userNameView:UIView?
    //用户名图标
    var userNameImg:UIImageView?
    //用户名输入框
    var userNameTF:UITextField?
    //密码视图
    var passwordView:UIView?
    //密码图标
    var passwordImg:UIImageView?
    //密码输入框
    var passwordTF:UITextField?
    //眼睛
    var lookBtn:UIButton?
    //记住密码
    var rembernBtn:UIButton?
    //记住密码
    var rembernLab:UILabel?
    //登录
    var loginBtn:UIButton?
    //注册
    var registBtn:UIButton?
    //忘记密码
    var forgetBtn:UIButton?
    //微信登录
    var wechartBtn:UIButton?
    //记录是否记住密码
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //MARK: - UI
        self.initUI()
    }
    
    // MARK: - 布局
    func initUI() {
        //MARK: - 返回按钮
        backBtn = UIButton.init(type: UIButton.ButtonType.custom)
        backBtn?.setImage(YTImage("delete"), for: UIControl.State.normal)
        backBtn?.addTarget(self, action: #selector(backBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(backBtn!)
        
        //MARK: - 标题
        titleLab = UILabel.init()
        titleLab?.text = "登录"
        titleLab?.font = PFM19
        titleLab?.textColor = YTThreeColor
        titleLab?.textAlignment = NSTextAlignment.center
        self.view.addSubview(titleLab!)
        
        //MARK: - 用户名
        userNameView = UIView.init()
        userNameView?.layer.cornerRadius = 5.0
        userNameView?.layer.masksToBounds = false
        userNameView?.layer.borderColor = YTEEColor.cgColor
        userNameView?.layer.borderWidth = 1.0
        self.view.addSubview(userNameView!)
        
        userNameImg = UIImageView.init()
        userNameImg?.image = YTImage("username")
        userNameView?.addSubview(userNameImg!)
        
        userNameTF = UITextField.init()
        userNameTF?.placeholder = "请输入用户名"
        userNameTF?.font = PFR16
        userNameTF?.textColor = YTThreeColor
        userNameTF?.keyboardType = UIKeyboardType.numbersAndPunctuation
        //设置返回件类型
        userNameTF?.returnKeyType = UIReturnKeyType.done
        //设置代理
        userNameTF?.delegate = self
        //添加监听事件
        userNameTF?.addTarget(self, action: #selector(userNameInput), for: UIControl.Event.editingChanged)
        userNameView?.addSubview(userNameTF!)
        
        //MARK: - 密码
        passwordView = UIView.init()
        passwordView?.layer.cornerRadius = 5.0
        passwordView?.layer.masksToBounds = false
        passwordView?.layer.borderColor = YTEEColor.cgColor
        passwordView?.layer.borderWidth = 1.0
        self.view.addSubview(passwordView!)
        
        passwordImg = UIImageView.init()
        passwordImg?.image = YTImage("password")
        passwordView?.addSubview(passwordImg!)
        
        passwordTF = UITextField.init()
        passwordTF?.placeholder = "请输入密码"
        passwordTF?.font = PFR16
        passwordTF?.textColor = YTThreeColor
        //出现清除按钮
        passwordTF?.clearButtonMode = UITextField.ViewMode.whileEditing
        //密码显示黑点
        passwordTF?.isSecureTextEntry = true
        //设置代理
        passwordTF?.delegate = self
        //设置返回件类型
        passwordTF?.returnKeyType = UIReturnKeyType.done
        //添加监听事件
        passwordTF?.addTarget(self, action: #selector(passwordInput), for: UIControl.Event.editingChanged)
        passwordView?.addSubview(passwordTF!)
        
        //MARK: - 密码可见
        lookBtn = UIButton.init(type: UIButton.ButtonType.custom)
        lookBtn?.setImage(YTImage("un_look"), for: UIControl.State.normal)
        lookBtn?.isSelected = true
        lookBtn?.addTarget(self, action: #selector(lookBtnClick), for: UIControl.Event.touchUpInside)
        passwordView?.addSubview(lookBtn!)
        
        //MARK: - 记住密码
        rembernBtn = UIButton.init(type: UIButton.ButtonType.custom)
        rembernBtn?.setImage(YTImage("rember"), for: UIControl.State.normal)
        rembernBtn?.isSelected = true
        rembernBtn?.addTarget(self, action: #selector(rembernBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(rembernBtn!)
        
        //MARK: - 记住密码
        rembernLab = UILabel.init()
        rembernLab?.text = "记住密码"
        rembernLab?.font = PFM14
        rembernLab?.textColor = YTSixColor
        self.view.addSubview(rembernLab!)
        
        //MARK: - 登录按钮
        loginBtn = UIButton.init(type: UIButton.ButtonType.custom)
        loginBtn?.backgroundColor = YTEEColor
        loginBtn?.layer.cornerRadius = 5.0
        loginBtn?.layer.masksToBounds = false
        loginBtn?.setTitle("登录", for: UIControl.State.normal)
        loginBtn?.setTitleColor(YTWhiteColor, for: UIControl.State.normal)
        loginBtn?.titleLabel?.font = PFM20
        loginBtn?.addTarget(self, action: #selector(loginBtnClick), for: UIControl.Event.touchUpInside)
        loginBtn?.isUserInteractionEnabled = false
        self.view.addSubview(loginBtn!)
        
        //MARK: - 注册按钮
        registBtn = UIButton.init(type: UIButton.ButtonType.custom)
        registBtn?.setTitle("手机快速注册", for: UIControl.State.normal)
        registBtn?.setTitleColor(YTRedColor, for: UIControl.State.normal)
        registBtn?.titleLabel?.font = PFR16
        registBtn?.addTarget(self, action: #selector(registBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(registBtn!)
        
        //MARK: - 找回密码按钮
        forgetBtn = UIButton.init(type: UIButton.ButtonType.custom)
        forgetBtn?.setTitle("忘记密码?", for: UIControl.State.normal)
        forgetBtn?.setTitleColor(YTThreeColor, for: UIControl.State.normal)
        forgetBtn?.titleLabel?.font = PFR16
        forgetBtn?.addTarget(self, action: #selector(forgetBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(forgetBtn!)
        
        //MARK: - 微信登录
        wechartBtn = UIButton.init(type: UIButton.ButtonType.custom)
        wechartBtn?.setImage(YTImage("weixin"), for: UIControl.State.normal)
        wechartBtn?.addTarget(self, action: #selector(wechartBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(wechartBtn!)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // MARK: - 返回
    @objc func backBtnClick(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - 密码可见设置
    @objc func lookBtnClick(sender:UIButton) {
        if sender.isSelected {
            sender.setImage(YTImage("look"), for: UIControl.State.normal)
            passwordTF?.isSecureTextEntry = false
            sender.isSelected = !sender.isSelected
        }else{
            sender.setImage(YTImage("un_look"), for: UIControl.State.normal)
            passwordTF?.isSecureTextEntry = true
            sender.isSelected = true
        }
    }
    
    // MARK: - 用户名输入
    @objc func userNameInput(textField:UITextField) {
        if textField.text!.isEmpty || passwordTF!.text!.isEmpty {
            loginBtn?.backgroundColor = YTEEColor
            loginBtn?.isUserInteractionEnabled = false
        }else{
            loginBtn?.backgroundColor = YTRedColor
            loginBtn?.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - 密码输入
    @objc func passwordInput(textField:UITextField) {
        if textField.text!.isEmpty || userNameTF!.text!.isEmpty {
            loginBtn?.backgroundColor = YTEEColor
            loginBtn?.isUserInteractionEnabled = false
        }else{
            loginBtn?.backgroundColor = YTRedColor
            loginBtn?.isUserInteractionEnabled = true
        }
    }
    
    // MARK - 记住密码
    @objc func rembernBtnClick(sender:UIButton) {
        if sender.isSelected {
            sender.setImage(YTImage("rember_select"), for: UIControl.State.normal)
            sender.isSelected = !sender.isSelected
        }else{
            sender.setImage(YTImage("rember"), for: UIControl.State.normal)
            sender.isSelected = true
        }
    }
    
    // MARK: - 手机注册
    @objc func registBtnClick(sender:UIButton) {
        WisdomHUD.showText(text: "手机注册")
    }
    
    // MARK: - 忘记密码
    @objc func forgetBtnClick(sender:UIButton) {
        WisdomHUD.showText(text: "忘记密码")
    }
    
    // MARK: - 登录
    @objc func loginBtnClick(sender:UIButton) {
        WisdomHUD.showSuccess(text: "登录成功")
    }
    
    // MARK: - 微信登录
    @objc func wechartBtnClick(sender:UIButton) {
        WisdomHUD.showText(text: "微信登录")
    }
    
    // MARK: - 结束编辑
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - 约束
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.left.equalTo(10)
            make.width.equalTo(44)
            make.height.equalTo(44)
        })
        
        titleLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.left.equalTo(100)
            make.right.equalTo(-100)
            make.height.equalTo(44)
        })
        
        userNameView?.snp.makeConstraints({ (make) in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        })
        
        userNameImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(5.5)
            make.left.equalTo(20)
            make.width.equalTo(33)
            make.height.equalTo(33)
        })
        
        userNameTF?.snp.makeConstraints({ (make) in
            make.top.equalTo(12)
            make.left.equalTo(userNameImg!.snp_right).offset(20)
            make.right.equalTo(-60)
            make.height.equalTo(20)
        })
        
        passwordView?.snp.makeConstraints({ (make) in
            make.top.equalTo(userNameView!.snp_bottom).offset(30)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        })
        
        passwordImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(5.5)
            make.left.equalTo(20)
            make.width.equalTo(33)
            make.height.equalTo(33)
        })
        
        passwordTF?.snp.makeConstraints({ (make) in
            make.top.equalTo(12)
            make.left.equalTo(passwordImg!.snp_right).offset(20)
            make.right.equalTo(-60)
            make.height.equalTo(20)
        })
        
        lookBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.right.equalTo(0)
            make.width.equalTo(44)
            make.height.equalTo(44)
        })
        
        rembernBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(passwordView!.snp_bottom).offset(10)
            make.left.equalTo(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        })
        
        rembernLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(passwordView!.snp_bottom).offset(10)
            make.left.equalTo(45)
            make.width.equalTo(100)
            make.height.equalTo(20)
        })
        
        loginBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(passwordView!.snp_bottom).offset(60)
            make.right.equalTo(-20)
            make.left.equalTo(20)
            make.height.equalTo(44)
        })
        
        registBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(loginBtn!.snp_bottom).offset(20)
            make.width.equalTo(120)
            make.left.equalTo(20)
            make.height.equalTo(30)
        })
        
        forgetBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(loginBtn!.snp_bottom).offset(20)
            make.width.equalTo(80)
            make.right.equalTo(-30)
            make.height.equalTo(30)
        })
        
        wechartBtn?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(-30)
            make.centerX.equalTo(self.view.snp_centerX)
            make.width.equalTo(60)
            make.height.equalTo(60)
        })
    }
}
