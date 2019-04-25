//
//  CancelActionTextField.swift
//  VerificationCode2
//
//  Created by 林同 on 2019/4/24.
//  Copyright © 2019 林同. All rights reserved.
//

import UIKit

// 该类也可以用来自定义输入框样式
// 为了项目中获取验证码样式统一这里就没有做其它样式的验证码
// 有兴趣的话可以把流行的验证码样式以枚举的形式放在里面

class CancelActionTextField: UITextField {

    // 取消文本框的复制粘贴功能
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

}
