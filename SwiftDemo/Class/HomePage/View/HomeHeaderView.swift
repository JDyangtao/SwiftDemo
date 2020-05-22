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
    var nineView:UIView?
    var nineImg:UIImageView?
    var nineLab:UILabel?
    var nineBtn:UIButton?
    //一元抢购
    var oneView:UIView?
    var oneImg:UIImageView?
    var oneLab:UILabel?
    var oneBtn:UIButton?
    //飞机票
    var airView:UIView?
    var airImg:UIImageView?
    var airLab:UILabel?
    var airBtn:UIButton?
    //金币
    var coinView:UIView?
    var coinImg:UIImageView?
    var coinLab:UILabel?
    var coinBtn:UIButton?
    //分割快
    var line:UIView?
    // 数据源
    let pictures: [String] = ["https://img20.360buyimg.com/babel/s590x470_jfs/t1/111583/8/7431/84867/5ec376e9E2401fec9/bebdc9fedaaf8b31.jpg", "https://img10.360buyimg.com/pop/s590x470_jfs/t1/115032/9/7206/82693/5ec1e325Efcb58473/f1ba917eb17cbd6a.jpg", "https://img30.360buyimg.com/pop/s590x470_jfs/t1/118052/27/5248/47956/5eb26924Ee7257e21/ce3dec3181229acd.jpg", "https://img30.360buyimg.com/pop/s590x470_jfs/t1/115833/7/3302/87555/5ea6bf4cE6f55df67/e6c73a1021a31070.jpg", "https://img14.360buyimg.com/da/s590x470_jfs/t1/126225/11/1847/67281/5ec0d9e3E3b71c7a2/360e7a953b8cfb84.jpg", "https://img11.360buyimg.com/pop/s590x470_jfs/t1/129533/13/1624/89324/5ebe04beE9750e799/d57df28c848a1c4d.jpg"]
    
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
        cyclePictureView.placeholderImage = nil
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
        
        nineView = UIView.init()
        nineView?.backgroundColor = UIColor.white
        bgView?.addSubview(nineView!)
        
        nineImg = UIImageView.init()
        nineImg?.image = YTImage("9.9 package mail")
        nineView?.addSubview(nineImg!)
        
        nineLab = UILabel.init()
        nineLab?.text = "9.9包邮"
        nineLab?.textColor = YTThreeColor
        nineLab?.font = PFR16
        nineLab?.textAlignment = .center
        nineView?.addSubview(nineLab!)
        
        nineBtn = UIButton.init(type: UIButton.ButtonType.custom)
        nineBtn?.addTarget(self, action: #selector(nineBtnClick), for: UIControl.Event.touchUpInside)
        nineView?.addSubview(nineBtn!)
        
        oneView = UIView.init()
        oneView?.backgroundColor = UIColor.white
        bgView?.addSubview(oneView!)
        
        oneImg = UIImageView.init()
        oneImg?.image = YTImage("One yuan a dolphin")
        oneView?.addSubview(oneImg!)
        
        oneLab = UILabel.init()
        oneLab?.text = "一元抢购"
        oneLab?.textColor = YTThreeColor
        oneLab?.font = PFR16
        oneLab?.textAlignment = .center
        oneView?.addSubview(oneLab!)
        
        oneBtn = UIButton.init(type: UIButton.ButtonType.custom)
        oneBtn?.addTarget(self, action: #selector(oneBtnClick), for: UIControl.Event.touchUpInside)
        oneView?.addSubview(oneBtn!)
        
        airView = UIView.init()
        airView?.backgroundColor = UIColor.white
        bgView?.addSubview(airView!)
        
        airImg = UIImageView.init()
        airImg?.image = YTImage("Overseas")
        airView?.addSubview(airImg!)
        
        airLab = UILabel.init()
        airLab?.text = "海外代购"
        airLab?.textColor = YTThreeColor
        airLab?.font = PFR16
        airLab?.textAlignment = .center
        airView?.addSubview(airLab!)
        
        airBtn = UIButton.init(type: UIButton.ButtonType.custom)
        airBtn?.addTarget(self, action: #selector(airBtnClick), for: UIControl.Event.touchUpInside)
        airView?.addSubview(airBtn!)
        
        coinView = UIView.init()
        coinView?.backgroundColor = UIColor.white
        bgView?.addSubview(coinView!)
        
        coinImg = UIImageView.init()
        coinImg?.image = YTImage("Pure integration mall")
        coinView?.addSubview(coinImg!)
        
        coinLab = UILabel.init()
        coinLab?.text = "积分商城"
        coinLab?.textColor = YTThreeColor
        coinLab?.font = PFR16
        coinLab?.textAlignment = .center
        coinView?.addSubview(coinLab!)
        
        coinBtn = UIButton.init(type: UIButton.ButtonType.custom)
        coinBtn?.addTarget(self, action: #selector(coinBtnClick), for: UIControl.Event.touchUpInside)
        coinView?.addSubview(coinBtn!)
        
        line = UIView.init()
        line?.backgroundColor = UIColor.lightGray
        bgView?.addSubview(line!)
    }
    
    //MARK: - 9.9包邮
    @objc func nineBtnClick(sender:UIButton) {
        self.currentViewController()?.navigationController?.pushViewController(NineViewController(), animated: true)
    }
    
    //MARK: - 一元抢购
    @objc func oneBtnClick(sender:UIButton) {
        self.currentViewController()?.navigationController?.pushViewController(OneViewController(), animated: true)
    }
    
    //MARK: - 海外代购
    @objc func airBtnClick(sender:UIButton) {
        self.currentViewController()?.navigationController?.pushViewController(OverseasViewController(), animated: true)
    }
    
    //MARK: - 积分商城
    @objc func coinBtnClick(sender:UIButton) {
        self.currentViewController()?.navigationController?.pushViewController(CoinViewController(), animated: true)
    }
    
    //MARK: - 约束
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView?.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(0)
        })
        
        nineView?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(0)
            make.width.equalTo(WWW)
            make.height.equalTo(100)
        })
        
        nineImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(nineView!.snp_centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        nineLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(nineImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        nineBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(WWW)
            make.height.equalTo(100)
        })
        
        oneView?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(WWW)
            make.width.equalTo(WWW)
            make.height.equalTo(100)
        })
        
        oneImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(oneView!.snp_centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        oneLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(nineImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        oneBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(100)
        })
        
        airView?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(WWW*2)
            make.width.equalTo(WWW)
            make.height.equalTo(100)
        })
        
        airImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(airView!.snp_centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        airLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(nineImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        airBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(100)
        })
        
        coinView?.snp.makeConstraints({ (make) in
            make.top.equalTo(150)
            make.left.equalTo(WWW*3)
            make.width.equalTo(WWW)
            make.height.equalTo(100)
        })
        
        coinImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.centerX.equalTo(coinView!.snp_centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        coinLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(coinImg!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
        })
        
        coinBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(100)
        })
        
        line?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(10)
        })
    }
}
