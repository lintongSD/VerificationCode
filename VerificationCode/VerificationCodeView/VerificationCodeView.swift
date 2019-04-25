//
//  VerificationCodeView.swift
//  VerificationCode2
//
//  Created by 林同 on 2019/4/24.
//  Copyright © 2019 林同. All rights reserved.
//

import UIKit

class VerificationCodeView: UIView, UITextFieldDelegate {

    
    // 页面样式
    var margin = 20.0 {
        didSet {
            layoutUI()
        }
    }
    var codeCount = 4 {
        didSet {
            layoutUI()
        }
    }
    
    // 文本框属性
    var codeBackgroundColor = UIColor.white {
        didSet {
            setupTextFieldStyle()
        }
    }
    var codeTextColor = UIColor.black {
        didSet {
            setupTextFieldStyle()
        }
    }
    var codeTextFont = UIFont.boldSystemFont(ofSize: 20) {
        didSet {
            setupTextFieldStyle()
        }
    }
    
    // 文本框layer属性
    var codeCornerRadius = 0.0  as CGFloat {
        didSet {
            setupTextFieldStyle()
        }
    }
    var codeBorderColor = UIColor.orange {
        didSet {
            setupTextFieldStyle()
        }
    }
    var codeBorderWidth = 1.0 as CGFloat {
        didSet {
            setupTextFieldStyle()
        }
    }
    var textFeildTintColor = UIColor.orange {
        didSet {
            setupTextFieldStyle()
        }
    }
    
    private var textFieldArr = Array<UITextField>()
    
    var succeedAction = {(_ codeString: String) in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutUI() {
        for view in self.subviews {
            view.removeFromSuperview()
            textFieldArr.removeAll()
        }
        
        let leadding = 30.0
        let selfWidth = Double(self.bounds.width)
        let totalMargin = margin * Double(codeCount - 1)
        let width = (selfWidth - leadding * 2 - totalMargin) / Double(codeCount)
        let textSize = CGSize.init(width: width, height: width)
        
        for i in 0..<codeCount {
            
            let rect = CGRect.init(x: CGFloat(leadding) + (textSize.width + CGFloat(margin)) * CGFloat(i) , y: 30.0, width: textSize.width, height: textSize.height)
            
            let textField = CancelActionTextField.init(frame: rect)
            textField.tag = 100 + i
            textField.delegate = self
            //防止输入时删除按钮不响应
            textField.text = " "
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            textField.layer.masksToBounds = true
            self.addSubview(textField)
            
            textFieldArr.append(textField)
        }
        setupTextFieldStyle()
    }
    
    func setupTextFieldStyle() {
        for textField in textFieldArr {
            textField.backgroundColor = codeBackgroundColor
            textField.textColor = codeTextColor
            textField.font = codeTextFont
            textField.layer.cornerRadius = codeCornerRadius
            textField.layer.borderColor = codeBorderColor.cgColor
            textField.layer.borderWidth = codeBorderWidth
            textField.tintColor = textFeildTintColor
        }
    }
    
    func codeBeiginEditting() {
        textFieldArr.first?.becomeFirstResponder()
    }
    
    // 使光标聚焦到最后一个字符串
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let p = textField.endOfDocument
        textField.selectedTextRange = textField.textRange(from: p, to: p)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //删除操作
        if string.isEmpty {
            if textField.tag != 100 {
                let previousTF =  textFieldArr[textField.tag - 1 - 100]
                // 不加延时会把前一文本框置空
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.001) {
                    // 文本框为空时点击删除不会走该回调方法
                    // 设为" "为了做删除操作后前一文本框可以进入编辑状态
                    textField.text = " "
                    previousTF.becomeFirstResponder()
                }
            }
        } else {
            textField.text = String.init(string.first!)
            if textField.tag != 100 + codeCount - 1 {
                let nextTF =  textFieldArr[textField.tag + 1 - 100]
                nextTF.becomeFirstResponder()
            } else {
                var codeString = ""
                for subTextField in textFieldArr {
                    codeString = codeString + (subTextField.text ?? "")
                }
                // 包含空格或位数不对
                if codeString.contains(" ") || codeString.count != codeCount{
                } else {
                    succeedAction(codeString)
                    self.endEditing(true)
                }
            }
        }
        return true
    }
}
