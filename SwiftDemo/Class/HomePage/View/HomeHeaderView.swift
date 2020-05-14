//
//  HomeHeaderView.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/14.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit

class HomeHeaderView: UITableViewHeaderFooterView {
    let WWW = kScreenWidth/4
    //背景视图
    var bgView:UIView?
    //九块九
    var nineBtn:UIButton?
    //一元抢购
    var oneBtn:UIButton?
    //飞机票
    var airBtn:UIButton?
    //金币
    var coinBtn:UIButton?
    //分割快
    var line:UIView?
    // 数据源
    let pictures: [String] = ["http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg", "picture2", "picture3", "picture4", "picture5", "http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg", "picture7"]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.createUI()
    }
    
    func createUI() {
        bgView = UIView.init()
        bgView?.backgroundColor = UIColor.white
        self.contentView.addSubview(bgView!)
        
        //轮播图
        let cyclePictureView: JCyclePictureView = JCyclePictureView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150), pictures: pictures)
        // 滚动方向
        cyclePictureView.direction = .left
        // 自动滚动时间
        cyclePictureView.autoScrollDelay = 3
        // pageControl 位置
        cyclePictureView.pageControlStyle = .center
        // 默认显示图
        cyclePictureView.placeholderImage = #imageLiteral(resourceName: "picture1")
        // 高亮圆点
        cyclePictureView.pageControl.currentPageIndicatorTintColor = UIColor.red
        //        cyclePictureView.pageControl.currentPageIndicatorImage
                
        // 默认圆点
        cyclePictureView.pageControl.pageIndicatorTintColor = UIColor.white
        //        cyclePictureView.pageControl.pageIndicatorImage
        // 点击回调
        cyclePictureView.didTapAtIndexHandle = { index in
            print("点击了第 \(index + 1) 张图片")
        }
        bgView?.addSubview(cyclePictureView)
        
        nineBtn = UIButton.init(type: UIButton.ButtonType.custom)
        nineBtn?.setImage(UIImage(named: "9.9 package mail"), for: UIControl.State.normal)
        nineBtn?.tag = 100
        nineBtn?.addTarget(self, action: #selector(nineBtnClick), for: UIControl.Event.touchUpInside)
        bgView?.addSubview(nineBtn!)
        
        oneBtn = UIButton.init(type: UIButton.ButtonType.custom)
        oneBtn?.setImage(YTImage("One yuan a dolphin"), for: UIControl.State.normal)
        oneBtn?.addTarget(self, action: #selector(oneBtnClick), for: UIControl.Event.touchUpInside)
        bgView?.addSubview(oneBtn!)
        
        airBtn = UIButton.init(type: UIButton.ButtonType.custom)
        airBtn?.setImage(YTImage("Overseas"), for: UIControl.State.normal)
        airBtn?.addTarget(self, action: #selector(airBtnClick), for: UIControl.Event.touchUpInside)
        bgView?.addSubview(airBtn!)
        
        coinBtn = UIButton.init(type: UIButton.ButtonType.custom)
        coinBtn?.setImage(YTImage("Pure integration mall"), for: UIControl.State.normal)
        coinBtn?.addTarget(self, action: #selector(coinBtnClick), for: UIControl.Event.touchUpInside)
        bgView?.addSubview(coinBtn!)
        
        line = UIView.init()
        line?.backgroundColor = UIColor.lightGray
        bgView?.addSubview(line!)
    }
    
    /*
     *九块九点击事件
     */
    @objc func nineBtnClick(sender:UIButton) {
        print("点击了\(sender.tag)")
        self.contentView.currentViewController()?.navigationController?.pushViewController(NineViewController.init(), animated: true)
    }
    
    /*
     *一元抢购
     */
    @objc func oneBtnClick(sender:UIButton) {
        print("一元抢购")
    }
    
    /*
     *飞机票
     */
    @objc func airBtnClick(sender:UIButton) {
        print("飞机票")
    }
    
    /*
     *金币兑换
     */
    @objc func coinBtnClick(sender:UIButton) {
        print("金币兑换")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView?.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(0)
        })
        
        nineBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(0)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        oneBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(WWW)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        airBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(oneBtn!.snp_right).offset(0)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        coinBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(airBtn!.snp_right).offset(0)
            make.width.equalTo(WWW)
            make.height.equalTo(80)
        })
        
        line?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(10)
        })
    }
}
