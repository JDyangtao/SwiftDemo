//
//  PurchaseCarAnimationTool.swift
//  SwiftDemo
//
//  Created by 陈自豪 on 5/18/20.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit
typealias finishBlock = (_ isFinish:Bool)->()
class PurchaseCarAnimationTool: NSObject {
    var layer:CALayer = CALayer()
    var animationFinishBlock : finishBlock?
    let layerImageW = 40
    let layerImageH = 40
    //生成单例
  static let shareTool = PurchaseCarAnimationTool()
    func startAnimation(starView:UIView,rect:CGRect,finishPoint:CGPoint,completionBlock:@escaping finishBlock){
        //创建图层
        layer.contents = starView.layer.contents
        layer.contentsGravity = .resizeAspectFill
        //设置商品图片大小
        layer.bounds = CGRect(x: 0, y: 0, width: layerImageW, height: layerImageH)//设置图片大小
        layer.cornerRadius = 20
        layer.masksToBounds = true
        let keyWindow = UIApplication.shared.keyWindow!
        //添加商品图层
        keyWindow.layer.addSublayer(layer)
        //设置图片位置
        layer.position = CGPoint(x: rect.origin.x+40, y:rect.origin.y+40)
        //创建动画30
        createAnimation(rect: rect, finishPoinit: finishPoint)
        //回调
        animationFinishBlock = completionBlock

    }
    //创建动画
    func createAnimation(rect:CGRect,finishPoinit:CGPoint){
        //动画路径
        let path = UIBezierPath()
        path.move(to: layer.position)
        path .addQuadCurve(to: finishPoinit, controlPoint: CGPoint(x: kScreenWidth/2, y: rect.origin.y-80))
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.path = path.cgPath
        //创建旋转动画
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.isRemovedOnCompletion = true
        rotateAnimation.fromValue = NSNumber(value: 0)
        rotateAnimation.toValue = NSNumber(value: 12)
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        //添加动画组合
        let animationGroup  = CAAnimationGroup()
        animationGroup.animations = [pathAnimation,rotateAnimation]
        animationGroup.duration = 1.2
        animationGroup.isRemovedOnCompletion = true
        animationGroup.fillMode = .forwards
        animationGroup.delegate = self
        //添加动画到layer
        layer.add(animationGroup, forKey: "group")
        
    }
}
//动画的代理
extension PurchaseCarAnimationTool:CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        layer.removeFromSuperlayer()
        if  let block = animationFinishBlock {
            block(true)
        }
    }
}
//震动动画
extension PurchaseCarAnimationTool{
    func shakeAnimation(shakeView:UIView){
        let shakeAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        shakeAnimation.duration = 0.15
        shakeAnimation.fromValue = NSNumber(value: -5)
        shakeAnimation.toValue = NSNumber(value: 5)
        shakeAnimation.autoreverses = true
        shakeView.layer.add(shakeAnimation, forKey: nil)
    }
}
