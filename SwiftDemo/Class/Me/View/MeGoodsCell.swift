//
//  MeGoodsCell.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/18.
//  Copyright © 2020 yangtao. All rights reserved.
//

import UIKit

class MeGoodsCell: UICollectionViewCell {
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
        self.contentView.backgroundColor = UIColor.blue
    }
}
