//
//  HeaderPCH.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/14.
//  Copyright © 2020 yangtao. All rights reserved.
//

import Foundation
import UIKit
import WisdomHUD

//判断系统

//获取屏幕宽高
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kNavHeight = 64
let YTThreeColor = RGB16(0x333333)
let YTSixColor = RGB16(0x666666)
let YTNineColor = RGB16(0x999999)
let YTRedColor = RGB16(0xFF0000)
let YTEEColor = RGB16(0xEEEEEE)
let YTF1Color = RGB16(0xF1F1F1)
let YTWhiteColor = RGB16(0xFFFFFF)
let YTBlackColor = RGB16(0x000000)

let PFM20 = YTFont("PingFangSC-Medium",20.0)
let PFM19 = YTFont("PingFangSC-Medium",19.0)
let PFM14 = YTFont("PingFangSC-Medium",14.0)

let PFR16 = YTFont("PingFangSC-Regular",16.0)

let PFB14 = YTFont("PingFangSC-Semibold",14.0)

//设置图片
func YTImage(_ name:String) -> UIImage {
    return UIImage(named: name)!
}
//设置字体
func YTFont(_ name:String,_ size:CGFloat) -> UIFont {
    return UIFont.init(name: name, size: size)!
}
//设置颜色
func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
//rbg转UIColor(16进制)
func RGB16(_ rgbValue:Int) -> UIColor {
    return UIColor.init(_colorLiteralRed:((Float)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((Float)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((Float)(rgbValue & 0xFF))/255.0 , alpha: 1.0)
}

//rbg转UIColor(16进制)带透明度
func RGBA16(rgbaValue:Int) -> UIColor {
    return UIColor.init(_colorLiteralRed:((Float)((rgbaValue & 0xFF0000) >> 16))/255.0, green: ((Float)((rgbaValue & 0xFF00) >> 8))/255.0, blue: ((Float)(rgbaValue & 0xFF))/255.0 , alpha: ((Float)((rgbaValue & 0xFF000000) >> 24))/255.0)
}

func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor.init(red: (r/255.0), green: (g/255.0), blue: (b/255.0), alpha: a)
}

var isFullScreen: Bool {
    if #available(iOS 11, *) {
          guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
              return false
          }
          
          if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
              print(unwrapedWindow.safeAreaInsets)
              return true
          }
    }
    return false
}

func NavSafeHeight() -> CGFloat {
   //return UIApplication.shared.statusBarFrame.height == 44 ? 88 : 64
   return isFullScreen ? 88 : 64
}
    
func BottomSafeHeight() -> CGFloat {
   //return UIApplication.shared.statusBarFrame.height == 44 ? 34 : 0
   return isFullScreen ? 34 : 0
}
