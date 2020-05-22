//
//  UIButton+Categary.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/22.
//  Copyright © 2020 yangtao. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    enum ButtonEdgeInsetsStyle: String {
        case top     // image在上，label在下
        case left    // image在左，label在右
        case bottom  // image在下，label在上
        case right   // image在右，label在左
    }
    //MARK: - 设置button的titleLabel和imageView的布局样式，及间距
    static func layoutButtonWithEdgeInsetsStyle(space: CGFloat, style: ButtonEdgeInsetsStyle) {
        // 1. 得到imageView和titleLabel的宽、高
    }
}
