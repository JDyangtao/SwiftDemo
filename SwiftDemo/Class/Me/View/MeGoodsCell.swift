//
//  MeGoodsCell.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/18.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
//MARK: - 代理
protocol LikeCartProtocol:NSObjectProtocol {
    func addCart(string:String,currentCell:MeGoodsCell)
}

class MeGoodsCell: UICollectionViewCell {
    //背景图
    var bgView:UIView?
    //图片
    var goodsImg:UIImageView?
    //名称
    var nameLab:UILabel?
    //价格
    var priceLab:UILabel?
    //加入购物车
    var cartBtn:UIButton?
    //代理对象
    weak var delegate:LikeCartProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
}
extension MeGoodsCell {
    func createUI() {
        self.contentView.backgroundColor = YTF1Color
        bgView = UIView.init()
        bgView?.backgroundColor = YTWhiteColor
        bgView?.layer.cornerRadius = 5.0
        bgView?.layer.masksToBounds = false
        self.contentView.addSubview(bgView!)
        
        goodsImg = UIImageView.init()
        goodsImg?.kf.setImage(with: URL(string: "http://img3m3.ddimg.cn/68/20/23271503-1_h_1.jpg"), placeholder: YTImage("ad_1"))
        goodsImg?.contentMode = .scaleAspectFit
        bgView?.addSubview(goodsImg!)
        
        nameLab = UILabel.init()
        nameLab?.text = "经典断舍离！山下英子初版全本，未经任何删节！2013年7月引进内地，简体中文版系列累计销量突破200万册！"
        nameLab?.textColor = YTThreeColor
        nameLab?.font = PFR14
        nameLab?.numberOfLines = 0
        bgView?.addSubview(nameLab!)
        
        priceLab = UILabel.init()
        priceLab?.text = "￥99.00"
        priceLab?.textColor = YTRedColor
        priceLab?.font = PFM14
        bgView?.addSubview(priceLab!)
        
        cartBtn = UIButton.init(type: UIButton.ButtonType.custom)
        cartBtn?.setImage(YTImage("tab_shopping_selected"), for: UIControl.State.normal)
        cartBtn?.addTarget(self, action: #selector(cartBtnClick), for: UIControl.Event.touchUpInside)
        bgView?.addSubview(cartBtn!)
    }
}
extension MeGoodsCell {
    //MARK: - 加入购物车
    @objc func cartBtnClick(_ sender:UIButton) {
        if loginStatus() {
            self.currentViewController()?.navigationController?.pushViewController(LoginViewController(), animated: true)
        }else{
            delegate?.addCart(string: priceLab?.text ?? "暂无数据",currentCell: self)
        }
    }
}
extension MeGoodsCell {
    override func layoutSubviews() {
        superview?.layoutSubviews()
        bgView?.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(0)
        })
        
        goodsImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(80)
        })
        
        nameLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(goodsImg!.snp_bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(44)
        })
        
        priceLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(nameLab!.snp_bottom).offset(10)
            make.right.equalTo(-10)
            make.left.equalTo(10)
            make.height.equalTo(20)
        })
        
        cartBtn?.snp.makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.width.equalTo(24)
            make.height.equalTo(24)
        })
    }
}
