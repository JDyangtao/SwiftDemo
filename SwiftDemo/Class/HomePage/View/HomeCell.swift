//
//  HomeCell.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/14.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit
import SnapKit

//MARK: - 代理
protocol AddCartProtocol:NSObjectProtocol {
    func addCart(string:String)
}

class HomeCell: UITableViewCell {
    //商品图片
    var goodsImg:UIImageView?
    //商品名称
    var nameLab:UILabel?
    //商品价格
    var priceLab:UILabel?
    //商品详情
    var detailLab:UILabel?
    //购物车图标
    var cartBtn:UIButton?
    //分割线
    var line:UIView?
    //代理对象
    weak var delegate:AddCartProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        //创建视图
        self.createCellUI()
    }
    
    func createCellUI() {
        goodsImg = UIImageView.init()
        goodsImg?.image = UIImage(named: "ad_1")
        self.contentView.addSubview(goodsImg!)
        goodsImg?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(80)
        })
        
        nameLab = UILabel.init()
        nameLab?.text = "商品名称商品名称商品名称商品名称商品名称商品名称"
        nameLab?.textColor = UIColor.black
        nameLab?.font = UIFont.systemFont(ofSize: 20)
        self.contentView.addSubview(nameLab!)
        nameLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(goodsImg!.snp_right).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(20)
        })
        
        detailLab = UILabel.init()
        detailLab?.text = "我是商品介绍我是商品介绍我是商品介绍我是商品介绍我是商品介绍我是商品介绍我是商品介绍"
        detailLab?.numberOfLines = 0
        detailLab?.textColor = RGB16(0x666666)
        detailLab?.font = PFM14
        self.contentView.addSubview(detailLab!)
        detailLab?.snp.makeConstraints({ (make) in
            make.top.equalTo(nameLab!.snp_bottom).offset(0)
            make.left.equalTo(goodsImg!.snp_right).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(40)
        })
        
        priceLab = UILabel.init()
        priceLab?.text = "￥99.00"
        priceLab?.textColor = YTRedColor
        priceLab?.font = PFM14
        self.contentView.addSubview(priceLab!)
        priceLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(goodsImg!.snp_right).offset(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(0)
            make.height.equalTo(20)
        })
        
        cartBtn = UIButton.init(type: UIButton.ButtonType.custom)
        cartBtn?.setImage(YTImage("tab_shopping_selected"), for: UIControl.State.normal)
        cartBtn?.addTarget(self, action: #selector(cartBtnClick), for: UIControl.Event.touchUpInside)
        self.contentView.addSubview(cartBtn!)
        cartBtn?.snp.makeConstraints({ (make) in
            make.width.equalTo(24)
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.height.equalTo(24)
        })
        
        line = UIView.init()
        line?.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(line!)
        line?.snp.makeConstraints({ (make) in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(1)
            make.bottom.equalTo(0)
        })
    }
    
    // 赋值方法 - 显示 cell 内容方法
    func showAppInfoWithModel(model: GoodsModel) {
        goodsImg?.image = UIImage(named: model.goodsImg!)
        nameLab?.text = model.name!
        detailLab?.text = model.detail!
        priceLab?.text = String(format: "￥%.02f", model.peice!)
    }
    
    //MARK: - 加入购物车
    @objc func cartBtnClick(_ sender:UIButton) {
        delegate?.addCart(string: priceLab?.text ?? "暂无数据")
    }
}
