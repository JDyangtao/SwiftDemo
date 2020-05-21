//
//  MeViewController.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/15.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit

let MeGoodsCellID = "MeGoodsCell"
let MeHeader = "MeHeaderView"

class MeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //数据源
    var data :[GoodsModel] = []{
        didSet{
            self.collectionView?.reloadData()
        }
    }
    //MARK: - 懒加载
    lazy var collectionView:UICollectionView? = {
        let layout = UICollectionViewFlowLayout.init()
        let tempCollectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-49-BottomSafeHeight()), collectionViewLayout: layout)
        tempCollectionView.delegate = self
        tempCollectionView.dataSource = self
        tempCollectionView.backgroundColor = YTF1Color
        tempCollectionView.register(MeGoodsCell.self, forCellWithReuseIdentifier: MeGoodsCellID)
        tempCollectionView.register(MeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MeHeader)
        if #available(iOS 11.0, *) {
            tempCollectionView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        return tempCollectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //影藏导航栏
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() //设置界面
    }
}
//MARK: setupUI
extension MeViewController{
    func setupUI(){
        self.view.addSubview(collectionView!)
    }
}
//MARK: - UICollectionView代理方法
extension MeViewController {
    //返回组数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //返回cell的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    //设置cell的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (kScreenWidth-30)/2, height: 180)
    }
    
    //设置cell的左右之间的最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    //设置cell的上下之间的最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //设置cell的偏移
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 10, bottom: 10, right: 10)
    }
    
    //设置header高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: kScreenWidth, height: 491)
    }
    
    //返回自定义cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MeGoodsCell = collectionView.dequeueReusableCell(withReuseIdentifier: MeGoodsCellID, for: indexPath) as! MeGoodsCell
        cell.delegate = self
        return cell
    }
    
    //设定header和footer的方法，根据kind不同进行不同的判断即可
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView : MeHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MeHeader, for: indexPath) as! MeHeaderView
        return headerView
    }
    
    //cell选中
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print(indexPath.row)
    }
}
//MARK: - 实现Cell代理
extension MeViewController:LikeCartProtocol {
    func addCart(string: String,currentCell:MeGoodsCell) {
        //获取当前商品图片
        if let imageView = currentCell.goodsImg{
            //做动画
            let window = UIApplication.shared.keyWindow
            //起始位置frame
            let fromF = currentCell.convert(imageView.frame, to: window)
            PurchaseCarAnimationTool.shareTool.startAnimation(starView: imageView, rect: fromF, finishPoint: CGPoint(x: kScreenWidth/4*2.5, y: kScreenHeight-49-BottomSafeHeight())) { (animationIsFinish:Bool) in
                if animationIsFinish {
                    //获取tabbar按钮
                    let tabbarBtn = self.tabBarController?.tabBar.subviews[3]
                    if let button = tabbarBtn {                    PurchaseCarAnimationTool.shareTool.shakeAnimation(shakeView: button)
                    }
                }
            }
        }
    }
}
