//
//  TabBarController.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/14.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置tabbar颜色
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor.red
        //添加子类
        addChildControllers()
    }
    
    /*
     *添加子类
     */
    func addChildControllers() {
        setChildViewController(HomePageViewController(), title: "首页", imageNomal: "home_normal", imageSelect: "home_select")
        setChildViewController(SortViewController(), title: "分类", imageNomal: "more", imageSelect: "more_select")
        setChildViewController(CartViewController(), title: "购物车", imageNomal: "cart_normal", imageSelect: "cart_select")
        setChildViewController(MeViewController(), title: "我的", imageNomal: "me_normal", imageSelect: "me_select")
    }
    /*
     *初始化子控制器
     */
    func setChildViewController(_ childController: UIViewController,title: String,imageNomal: String,imageSelect: String) {
        //设置控制器的图片与文字
        childController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageNomal), selectedImage: UIImage(named: imageSelect))
        childController.navigationItem.title = title
        let navVC = NavigationController(rootViewController: childController)
        addChild(navVC)
    }

}
