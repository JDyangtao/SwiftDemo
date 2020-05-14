//
//  NavigationController.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/14.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        //导航栏背景颜色
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        //导航栏标题颜色
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19)
        ]
        
        //添加手势代理
        self.interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    

    /*
     *重写跳转方法
     */
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            //添加手势识别
            self.interactivePopGestureRecognizer?.isEnabled = true
        }
        if self.children.count > 0 {
            //影藏底部tabbar
            viewController.hidesBottomBarWhenPushed = true
            //导航栏返回按钮自定义
            let backButton = UIButton(frame:CGRect.init(x:0, y: 0, width: 44, height: 44))
            backButton.imageEdgeInsets = UIEdgeInsets(top: 0,left: -30,bottom: 0,right: 10)
            backButton.setImage(YTImage("back"), for: UIControl.State.normal)
            backButton.addTarget(self, action:#selector(backBackClick), for: UIControl.Event.touchUpInside)
            //backButton.sizeToFit()
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView:backButton)
        }
        super.pushViewController(viewController, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if navigationController.viewControllers.count == 1 {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    
    /*
     *返回事件
     */
    @objc func backBackClick(sender:UIButton){
        self.popViewController(animated:true)
    }

}
