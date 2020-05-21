//
//  MeHeaderView.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/18.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit
import SnapKit

let WWW = kScreenWidth/5
let WWW1 = kScreenWidth/4

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
    //我的订单
    var myOrderLab:UILabel?
    //查看全部
    var lookAllBtn:UIButton?
    //分割块1
    var line1:UIView?
    //待付款
    var payView:UIView?
    var payImg:UIImageView?
    var payLab:UILabel?
    var payBtn:UIButton?
    //待发货
    var sendView:UIView?
    var sendImg:UIImageView?
    var sendLab:UILabel?
    var sendBtn:UIButton?
    //待收货
    var getView:UIView?
    var getImg:UIImageView?
    var getLab:UILabel?
    var getBtn:UIButton?
    //交易成功
    var successView:UIView?
    var successImg:UIImageView?
    var successLab:UILabel?
    var successBtn:UIButton?
    //退款订单
    var backView:UIView?
    var backImg:UIImageView?
    var backLab:UILabel?
    var backBtn:UIButton?
    //分割块2
    var line2:UIView?
    //我的服务
    var serviceLab:UILabel?
    //分割块3
    var line3:UIView?
    //我的积分
    var scoreView:UIView?
    var scoreImg:UIImageView?
    var scoreLab:UILabel?
    var scoreBtn:UIButton?
    //我的银行卡
    var bankCardView:UIView?
    var bankCardImg:UIImageView?
    var bankCardLab:UILabel?
    var bankCardBtn:UIButton?
    //我的商圈
    var quanziView:UIView?
    var quanziImg:UIImageView?
    var quanziLab:UILabel?
    var quanziBtn:UIButton?
    //推荐奖励
    var moneyView:UIView?
    var moneyImg:UIImageView?
    var moneyLab:UILabel?
    var moneyBtn:UIButton?
    //猜你喜欢
    var likeView:UIView?
    var likeImg:UIImageView?
    var likeLab:UILabel?
    
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
        self.backgroundColor = YTWhiteColor
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
        
        //我的订单
        myOrderLab = UILabel.init()
        myOrderLab?.text = "我的订单"
        myOrderLab?.textColor = YTThreeColor
        myOrderLab?.font = PFM20
        self.addSubview(myOrderLab!)
        
        //查看全部
        lookAllBtn = UIButton.init(type: UIButton.ButtonType.custom)
        lookAllBtn?.setTitle("查看全部 >", for: UIControl.State.normal)
        lookAllBtn?.setTitleColor(YTSixColor, for: UIControl.State.normal)
        lookAllBtn?.titleLabel?.font = PFR16
        lookAllBtn?.addTarget(self, action: #selector(lookAllBtnClick), for: UIControl.Event.touchUpInside)
        self.addSubview(lookAllBtn!)
        
        //分割块1
        line1 = UIView.init()
        line1?.backgroundColor = YTF1Color
        self.addSubview(line1!)
        
        //待付款
        payView = UIView.init()
        payView?.backgroundColor = YTWhiteColor
        self.addSubview(payView!)
        
        payImg = UIImageView.init()
        payImg?.image = YTImage("waite_pay")
        payView?.addSubview(payImg!)
        
        payLab = UILabel.init()
        payLab?.text = "待付款"
        payLab?.textColor = YTThreeColor
        payLab?.font = PFR16
        payLab?.textAlignment = .center
        payView?.addSubview(payLab!)
        
        payBtn = UIButton.init(type: UIButton.ButtonType.custom)
        payBtn?.addTarget(self, action: #selector(payBtnClick), for: UIControl.Event.touchUpInside)
        payView?.addSubview(payBtn!)
        
        //待发货
        sendView = UIView.init()
        sendView?.backgroundColor = YTWhiteColor
        self.addSubview(sendView!)
        
        sendImg = UIImageView.init()
        sendImg?.image = YTImage("waite_send")
        sendView?.addSubview(sendImg!)
        
        sendLab = UILabel.init()
        sendLab?.text = "待发货"
        sendLab?.textColor = YTThreeColor
        sendLab?.font = PFR16
        sendLab?.textAlignment = .center
        sendView?.addSubview(sendLab!)
        
        sendBtn = UIButton.init(type: UIButton.ButtonType.custom)
        sendBtn?.addTarget(self, action: #selector(sendBtnClick), for: UIControl.Event.touchUpInside)
        sendView?.addSubview(sendBtn!)
        
        //待收货
        getView = UIView.init()
        getView?.backgroundColor = YTWhiteColor
        self.addSubview(getView!)
        
        getImg = UIImageView.init()
        getImg?.image = YTImage("waite_get")
        getView?.addSubview(getImg!)
        
        getLab = UILabel.init()
        getLab?.text = "待收货"
        getLab?.textColor = YTThreeColor
        getLab?.font = PFR16
        getLab?.textAlignment = .center
        getView?.addSubview(getLab!)
        
        getBtn = UIButton.init(type: UIButton.ButtonType.custom)
        getBtn?.addTarget(self, action: #selector(getBtnClick), for: UIControl.Event.touchUpInside)
        getView?.addSubview(getBtn!)
        
        //交易成功
        successView = UIView.init()
        successView?.backgroundColor = YTWhiteColor
        self.addSubview(successView!)
        
        successImg = UIImageView.init()
        successImg?.image = YTImage("waite_success")
        successView?.addSubview(successImg!)
        
        successLab = UILabel.init()
        successLab?.text = "交易成功"
        successLab?.textColor = YTThreeColor
        successLab?.font = PFR16
        successLab?.textAlignment = .center
        successView?.addSubview(successLab!)
        
        successBtn = UIButton.init(type: UIButton.ButtonType.custom)
        successBtn?.addTarget(self, action: #selector(successBtnClick), for: UIControl.Event.touchUpInside)
        successView?.addSubview(successBtn!)
        
        //退款订单
        backView = UIView.init()
        backView?.backgroundColor = YTWhiteColor
        self.addSubview(backView!)
        
        backImg = UIImageView.init()
        backImg?.image = YTImage("waite_back")
        backView?.addSubview(backImg!)
        
        backLab = UILabel.init()
        backLab?.text = "退款订单"
        backLab?.textColor = YTThreeColor
        backLab?.font = PFR16
        backLab?.textAlignment = .center
        backView?.addSubview(backLab!)
        
        backBtn = UIButton.init(type: UIButton.ButtonType.custom)
        backBtn?.addTarget(self, action: #selector(backBtnClick), for: UIControl.Event.touchUpInside)
        backView?.addSubview(backBtn!)
        
        //分割块2
        line2 = UIView.init()
        line2?.backgroundColor = YTF1Color
        self.addSubview(line2!)
        
        //我的服务
        serviceLab = UILabel.init()
        serviceLab?.text = "我的服务"
        serviceLab?.textColor = YTThreeColor
        serviceLab?.font = PFM20
        self.addSubview(serviceLab!)
        
        //分割块3
        line3 = UIView.init()
        line3?.backgroundColor = YTF1Color
        self.addSubview(line3!)
        
        //我的积分
        scoreView = UIView.init()
        scoreView?.backgroundColor = YTWhiteColor
        self.addSubview(scoreView!)
        
        scoreImg = UIImageView.init()
        scoreImg?.image = YTImage("my_score")
        scoreView?.addSubview(scoreImg!)
        
        scoreLab = UILabel.init()
        scoreLab?.text = "我的积分"
        scoreLab?.textColor = YTThreeColor
        scoreLab?.font = PFR16
        scoreLab?.textAlignment = .center
        scoreView?.addSubview(scoreLab!)
        
        scoreBtn = UIButton.init(type: UIButton.ButtonType.custom)
        scoreBtn?.addTarget(self, action: #selector(scoreBtnClick), for: UIControl.Event.touchUpInside)
        scoreView?.addSubview(scoreBtn!)
        
        //我的银行卡
        bankCardView = UIView.init()
        bankCardView?.backgroundColor = YTWhiteColor
        self.addSubview(bankCardView!)
        
        bankCardImg = UIImageView.init()
        bankCardImg?.image = YTImage("bankCard")
        bankCardView?.addSubview(bankCardImg!)
        
        bankCardLab = UILabel.init()
        bankCardLab?.text = "我的银行卡"
        bankCardLab?.textColor = YTThreeColor
        bankCardLab?.font = PFR16
        bankCardLab?.textAlignment = .center
        bankCardView?.addSubview(bankCardLab!)
        
        bankCardBtn = UIButton.init(type: UIButton.ButtonType.custom)
        bankCardBtn?.addTarget(self, action: #selector(bankCardBtnClick), for: UIControl.Event.touchUpInside)
        bankCardView?.addSubview(bankCardBtn!)
        
        //我的商圈
        quanziView = UIView.init()
        quanziView?.backgroundColor = YTWhiteColor
        self.addSubview(quanziView!)
        
        quanziImg = UIImageView.init()
        quanziImg?.image = YTImage("quanzi")
        quanziView?.addSubview(quanziImg!)
        
        quanziLab = UILabel.init()
        quanziLab?.text = "我的商圈"
        quanziLab?.textColor = YTThreeColor
        quanziLab?.font = PFR16
        quanziLab?.textAlignment = .center
        quanziView?.addSubview(quanziLab!)
        
        quanziBtn = UIButton.init(type: UIButton.ButtonType.custom)
        quanziBtn?.addTarget(self, action: #selector(quanziBtnClick), for: UIControl.Event.touchUpInside)
        quanziView?.addSubview(quanziBtn!)
        
        //推荐奖励
        moneyView = UIView.init()
        moneyView?.backgroundColor = YTWhiteColor
        self.addSubview(moneyView!)
        
        moneyImg = UIImageView.init()
        moneyImg?.image = YTImage("money")
        moneyView?.addSubview(moneyImg!)
        
        moneyLab = UILabel.init()
        moneyLab?.text = "推荐奖励"
        moneyLab?.textColor = YTThreeColor
        moneyLab?.font = PFR16
        moneyLab?.textAlignment = .center
        moneyView?.addSubview(moneyLab!)
        
        moneyBtn = UIButton.init(type: UIButton.ButtonType.custom)
        moneyBtn?.addTarget(self, action: #selector(moneyBtnClick), for: UIControl.Event.touchUpInside)
        moneyView?.addSubview(moneyBtn!)
        
        //猜你喜欢
        likeView = UIView.init()
        likeView?.backgroundColor = YTF1Color
        self.addSubview(likeView!)
        
        likeImg = UIImageView.init()
        likeImg?.image = YTImage("like")
        likeView?.addSubview(likeImg!)
        
        likeLab = UILabel.init()
        likeLab?.text = "猜你喜欢"
        likeLab?.textColor = YTThreeColor
        likeLab?.font = PFR16
        likeLab?.textAlignment = .center
        likeView?.addSubview(likeLab!)
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
    
    //查看全部
    @objc func lookAllBtnClick(_ sender:UIButton) {
        
    }
    
    //待付款
    @objc func payBtnClick(_ sender:UIButton) {
        
    }
    
    //待发货
    @objc func sendBtnClick(_ sender:UIButton) {
        
    }
    
    //待收货
    @objc func getBtnClick(_ sender:UIButton) {
        
    }
    
    //交易成功
    @objc func successBtnClick(_ sender:UIButton) {
        
    }
    
    //退款订单
    @objc func backBtnClick(_ sender:UIButton) {
        
    }
    
    //我的积分
    @objc func scoreBtnClick(_ sender:UIButton) {
        
    }
    
    //我的银行卡
    @objc func bankCardBtnClick(_ sender:UIButton) {
        
    }
    
    //我的商圈
    @objc func quanziBtnClick(_ sender:UIButton) {
        
    }
    
    //推荐奖励
    @objc func moneyBtnClick(_ sender:UIButton) {
        
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
        
        myOrderLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(bgImg!.snp_bottom).offset(20)
            make.left.equalTo(20)
            make.width.equalTo(150)
            make.height.equalTo(20)
        })
        
        lookAllBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(bgImg!.snp_bottom).offset(20)
            make.right.equalTo(0)
            make.width.equalTo(120)
            make.height.equalTo(20)
        })
        
        line1?.snp.makeConstraints({ (make) in
            make.top.equalTo(myOrderLab!.snp_bottom).offset(20)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(5)
        })
        
        payView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line1!.snp_bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        payImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(payView!.snp_centerX)
            make.width.equalTo(20.5)
            make.height.equalTo(17.5)
        })
        
        payLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(payImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        payBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        sendView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line1!.snp_bottom).offset(0)
            make.left.equalTo(WWW)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        sendImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(sendView!.snp_centerX)
            make.width.equalTo(20.5)
            make.height.equalTo(17.5)
        })
        
        sendLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(sendImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        sendBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        getView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line1!.snp_bottom).offset(0)
            make.left.equalTo(sendView!.snp_right).offset(0)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        getImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(getView!.snp_centerX)
            make.width.equalTo(20.5)
            make.height.equalTo(17.5)
        })
        
        getLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(getImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        getBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        successView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line1!.snp_bottom).offset(0)
            make.left.equalTo(getView!.snp_right).offset(0)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        successImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(successView!.snp_centerX)
            make.width.equalTo(20.5)
            make.height.equalTo(17.5)
        })
        
        successLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(successImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        successBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        backView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line1!.snp_bottom).offset(0)
            make.left.equalTo(successView!.snp_right).offset(0)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        backImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(backView!.snp_centerX)
            make.width.equalTo(20.5)
            make.height.equalTo(17.5)
        })
        
        backLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(successImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        backBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        line2?.snp.makeConstraints({ (make) in
            make.top.equalTo(payView!.snp_bottom).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(5)
        })
        
        serviceLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(line2!.snp_bottom).offset(10)
            make.left.equalTo(20)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        line3?.snp.makeConstraints({ (make) in
            make.top.equalTo(serviceLab!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(1)
        })
        
        scoreView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line3!.snp_bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(WWW1)
            make.height.equalTo(80)
        })
        
        scoreImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(scoreView!.snp_centerX)
            make.width.equalTo(19)
            make.height.equalTo(37/2)
        })
        
        scoreLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(scoreImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        scoreBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        bankCardView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line3!.snp_bottom).offset(0)
            make.left.equalTo(WWW1)
            make.width.equalTo(WWW1)
            make.height.equalTo(80)
        })
        
        bankCardImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(bankCardView!.snp_centerX)
            make.width.equalTo(22)
            make.height.equalTo(33/2)
        })
        
        bankCardLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(bankCardImg!.snp_bottom).offset(13)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        bankCardBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        quanziView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line3!.snp_bottom).offset(0)
            make.left.equalTo(WWW1*2)
            make.width.equalTo(WWW1)
            make.height.equalTo(80)
        })
        
        quanziImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(quanziView!.snp_centerX)
            make.width.equalTo(20)
            make.height.equalTo(19)
        })
        
        quanziLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(quanziImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        quanziBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        moneyView?.snp.makeConstraints({ (make) in
            make.top.equalTo(line3!.snp_bottom).offset(0)
            make.left.equalTo(WWW1*3)
            make.width.equalTo(WWW1)
            make.height.equalTo(80)
        })
        
        moneyImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(moneyView!.snp_centerX)
            make.width.equalTo(17)
            make.height.equalTo(20)
        })
        
        moneyLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        moneyBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        likeView?.snp.makeConstraints({ (make) in
            make.top.equalTo(moneyView!.snp_bottom).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(40)
        })
        
        likeImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(likeView!.snp_centerX).offset(-45)
            make.width.equalTo(20)
            make.height.equalTo(20)
        })
        
        likeLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
    }
}
