//
//  MeViewController.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/15.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = CGRect.init(x: 20, y: 100, width: kScreenWidth-40, height: 44)
        btn.backgroundColor = UIColor.red
        btn.setTitle("模态", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
    }
    /*
     *模态一个页面
     */
    @objc func btnClick(sender:UIButton) {
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true, completion: nil)
    }
}
