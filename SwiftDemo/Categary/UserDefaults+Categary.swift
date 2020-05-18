//
//  UserDefaults+Categary.swift
//  SwiftDemo
//
//  Created by 阳涛 on 2020/5/15.
//  Copyright © 2020 yangtao. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum AccountKeys: String {
        case userToken     // 用户Token
        case loginStatus   // 登录状态
        case userLogo      // 用户头像
        case userName      // 用户名
        case userPassword  // 密码
        case coinNumber    // 金币数量
    }
    
    static func set(value: String, forKey key: AccountKeys) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }

    static func string(forKey key: AccountKeys) -> String? {
        let key = key.rawValue
        return UserDefaults.standard.string(forKey: key)
    }
}
