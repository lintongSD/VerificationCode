//
//  ViewController.swift
//  VerificationCode2
//
//  Created by EBIZM2 on 2019/4/24.
//  Copyright © 2019 EBIZM2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let codeView = VerificationCodeView.init(frame: CGRect.init(x: 0, y: 270, width: view.bounds.size.width, height: 100))
        
        codeView.codeBeiginEditting()
        
        codeView.succeedAction = { (string) in
            print(string)
        }
        
        view.addSubview(codeView)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

