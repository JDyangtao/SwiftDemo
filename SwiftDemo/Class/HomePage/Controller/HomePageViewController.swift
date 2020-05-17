//
//  HomePageViewController.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/14.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let HomeCellID = "HomeCellID"
    let HomeHeader = "HomeHeaderView"
    //数据源
    var data :[GoodsModel] = []{
        didSet{
            self.tableView?.reloadData()
        }
    }
    //懒加载
    lazy var tableView:UITableView? = {
        let tempTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-49-BottomSafeHeight()), style: UITableView.Style.grouped)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor = UIColor.white
        tempTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tempTableView.register(HomeCell.self, forCellReuseIdentifier: HomeCellID)
        tempTableView.register(HomeHeaderView.self, forHeaderFooterViewReuseIdentifier: HomeHeader)
        if #available(iOS 11.0, *) {
            tempTableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        return tempTableView
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //影藏导航栏
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() //设置界面
        loadData()//请求数据
    }
}
    //MARK: setupUI
    extension HomePageViewController{
        func setupUI(){
            self.view.addSubview(tableView!)
        }
        func loadData(){
            var models = [GoodsModel]()
            
            for index in 1...20 {
                let model = GoodsModel.init()
                if index % 3 == 0 {
                    model.goodsImg = "ad_1"
                }else if index % 3 == 1 {
                    model.goodsImg = "ad_2"
                }else{
                    model.goodsImg = "ad_3"
                }
                model.name = String(format: "我是商品%d", index)
                model.detail = String(format: "商品介绍%d,商品介绍%d,商品介绍%d,商品介绍%d", index,index,index,index)
                model.peice = Double(index+80)
                models.append(model)
            }
            self.data = models
        }
        
}
    //MARK:TableViewData,TableViewDelegate
    extension HomePageViewController{
        /*
            *tableView代理方法
            */
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return self.data.count
           }

           func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return 100.0
           }
           func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
               return 230
           }
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: HomeCellID) as! HomeCell
               let cellModel: GoodsModel = self.data[indexPath.row] 
               cell.showAppInfoWithModel(model: cellModel)
               return cell
           }
           func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
               let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeHeader) as! HomeHeaderView
               return header
           }
           func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               NSLog("%ld", indexPath.row)
           }
    }
   
   
