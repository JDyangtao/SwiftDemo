//
//  MeHeaderView.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/18.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit
import SnapKit

class MeHeaderView: UICollectionReusableView {
    //背景色块
    var bgImg:UIImageView?
    //用户头像
    var headerImg:UIImageView?
    //登录/注册
    var loginLab:UILabel?
    //登录按钮
    var loginBtn:UIButton?
    //用户名
    var nameLab:UILabel?
    //金币数量
    var coinLab:UILabel?
    //账户信息
    var accountLab:UILabel?
    //账户信息
    var accountBtn:UIButton?
    //设置
    var settingBtn:UIButton?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - 构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
        isLogin()
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    }
}
//MARK: - UI
extension MeHeaderView {
    func createUI() {
        //背景
        bgImg = UIImageView.init()
        bgImg?.image = YTImage("me_bg")
        self.addSubview(bgImg!)
        
        //用户头像
        headerImg = UIImageView.init()
        headerImg?.image = YTImage("header_nor")
        self.addSubview(headerImg!)
        
        //登录/注册
        loginLab = UILabel.init()
        loginLab?.text = "登录/注册"
        loginLab?.textColor = YTWhiteColor
        loginLab?.font = PFM25
        self.addSubview(loginLab!)
        
        //登录按钮
        loginBtn = UIButton.init(type: UIButton.ButtonType.custom)
        loginBtn?.addTarget(self, action: #selector(loginBtnClick), for: UIControl.Event.touchUpInside)
        self.addSubview(loginBtn!)
        
        //用户名
        nameLab = UILabel.init()
        nameLab?.textColor = YTWhiteColor
        nameLab?.font = PFR16
        nameLab?.text = UserDefaults.string(forKey:.userName)
        self.addSubview(nameLab!)
        
        //金币数量
        coinLab = UILabel.init()
        coinLab?.textColor = YTWhiteColor
        coinLab?.font = PFR14
        coinLab?.text = UserDefaults.string(forKey:.coinNumber)
        self.addSubview(coinLab!)
        
        //账户信息
        accountLab = UILabel.init()
        accountLab?.text = "账户信息 >"
        accountLab?.textColor = YTWhiteColor
        accountLab?.font = PFR14
        accountLab?.textAlignment = .right
        self.addSubview(accountLab!)
        
        //账户信息
        accountBtn = UIButton.init(type: UIButton.ButtonType.custom)
        accountBtn?.addTarget(self, action: #selector(accuontBtnClick), for: UIControl.Event.touchUpInside)
        self.addSubview(accountBtn!)
        
        //设置
        settingBtn = UIButton.init(type: UIButton.ButtonType.custom)
        settingBtn?.setTitle("设置", for: UIControl.State.normal)
        settingBtn?.setTitleColor(YTWhiteColor, for: UIControl.State.normal)
        settingBtn?.titleLabel?.font = PFR16
        settingBtn?.addTarget(self, action: #selector(settingBtnClick), for: UIControl.Event.touchUpInside)
        self.addSubview(settingBtn!)
    }
}
//MARK: - 判断是否登录
extension MeHeaderView {
    func isLogin() {
        let status = UserDefaults.string(forKey:.loginStatus)
        if status == "true" {
            loginLab?.isHidden = true
            loginBtn?.isHidden = true
            nameLab?.isHidden = false
            coinLab?.isHidden = false
            accountLab?.isHidden = false
            accountBtn?.isHidden = false
            settingBtn?.isHidden = false
            let logo = UserDefaults.string(forKey:.userLogo)
            headerImg?.image = YTImage(logo!)
        }else{
            loginLab?.isHidden = false
            loginBtn?.isHidden = false
            nameLab?.isHidden = true
            coinLab?.isHidden = true
            accountLab?.isHidden = true
            accountBtn?.isHidden = true
            settingBtn?.isHidden = true
            headerImg?.image = YTImage("header_nor")
        }
    }
}
//MARK: - 登录成功代理
extension MeHeaderView:loginSuccessProtocol {
    func loginSuccess() {
        loginLab?.isHidden = true
        loginBtn?.isHidden = true
        nameLab?.isHidden = false
        coinLab?.isHidden = false
        accountLab?.isHidden = false
        accountBtn?.isHidden = false
        settingBtn?.isHidden = false
        let logo = UserDefaults.string(forKey:.userLogo)
        headerImg?.image = YTImage(logo!)
        nameLab?.text = UserDefaults.string(forKey:.userName)
        coinLab?.text = UserDefaults.string(forKey:.coinNumber)
    }
}
//MARK: - 点击事件
extension MeHeaderView {
    //登录
    @objc func loginBtnClick(_ sender:UIButton) {
        let loginVC = LoginViewController.init()
        loginVC.delegate = self
        self.currentViewController()!.present(loginVC, animated: true, completion: nil)
    }
    
    //账户信息
    @objc func accuontBtnClick(_ sender:UIButton) {
        
    }
    
    //设置
    @objc func settingBtnClick(_ sender:UIButton) {
        
    }
}
//MARK: - 约束
extension MeHeaderView {
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(180)
        })
        
        headerImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(65)
            make.left.equalTo(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        loginLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(75)
            make.left.equalTo(headerImg!.snp_right).offset(20)
            make.right.equalTo(-20)
            make.height.equalTo(30)
        })
        
        loginBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })
        
        nameLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(65)
            make.left.equalTo(headerImg!.snp_right).offset(20)
            make.right.equalTo(-20)
            make.height.equalTo(20)
        })
        
        coinLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(105)
            make.left.equalTo(headerImg!.snp_right).offset(20)
            make.right.equalTo(-20)
            make.height.equalTo(20)
        })
        
        accountLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(75)
            make.right.equalTo(-20)
            make.width.equalTo(150)
            make.height.equalTo(30)
        })
        
        accountBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(75)
            make.right.equalTo(0)
            make.left.equalTo(0)
            make.height.equalTo(100)
        })
        
        settingBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(30)
            make.right.equalTo(0)
            make.width.equalTo(40)
            make.height.equalTo(45)
        })
    }
}
