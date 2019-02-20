//
//  ViewController.m
//  MsgView
//
//  Created by EBIZM2 on 2019/2/19.
//  Copyright © 2019年 EBIZM2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (nonatomic, strong) NSArray <UIButton *>*btnArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    _btnArr = @[_btn1, _btn2, _btn3, _btn4];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    textField.hidden = YES;
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    NSUInteger index = range.location;
    if (index >= 3 && ![string isEqualToString:@""]) {  //位数够了不再编辑
        [textField endEditing:YES];
        textField.hidden = NO;
        textField.text = [NSString stringWithFormat:@"%@%@", textField.text, string];
    }
    if (index >= 4) {       //输入到第四位的时候防止替换最后字符
        NSMutableString *strM = [NSMutableString string];
        for (UIButton *btn in _btnArr) {
            [strM appendString:btn.titleLabel.text];
        }
        textField.text = strM;
        [textField endEditing:YES];
        textField.hidden = NO;
        return NO;
    }
    
    UIButton *btn = _btnArr[index];
    if ([string isEqualToString:@""]) {     //删除
        [btn setTitle:@"|" forState:UIControlStateNormal];
        return YES;
    } else {   //添加
        [btn setTitle:string forState:UIControlStateNormal];
        return YES;
    }
}


@end
