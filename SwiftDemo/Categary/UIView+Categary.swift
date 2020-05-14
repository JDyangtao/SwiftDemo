//
//  UIView+Categary.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/14.
//  Copyright © 2020 yangtao. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /*
     *获取当前视图控制器
     */
    public func currentViewController() -> UIViewController? {
        var n = next
        while n != nil {
            if n is UIViewController {
                return n as? UIViewController
            }
            n = n?.next
        }
        return nil
    }
    
    /*
     *获取当前视图所在导航控制器
     */
    public func currentNavViewController() -> UINavigationController? {
        var n = next
        while n != nil {
            if n is UINavigationController {
                return n as? UINavigationController
            }
            n = n?.next
        }
        return nil
    }
}
