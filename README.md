# VerificationCode

### 仿滴滴获取验证码功能
![效果](https://github.com/lintongSD/VerificationCode/blob/master/demo.png)

### 在网上找了很多例子但是或多或少都会有些小bug

#### 问题1: 长按验证码TextFeild会被全选, 然后验证码功能失效
#### 问题2:```滴滴6位验证码```输入多位后把光标选中前面输入框点击删除,会造成连续删除两位验证码

### VerificationCode(不过也有问题2333)

#### 优点:
代码注释齐全, 使用简单, 高定制性
当你不喜欢当前样式时可以直接重写```CancelActionTextField```, 对```VerificationCodeView```可以完全无视

代码分类清晰, 所有代码都有明确分类

![CancelActionTextField.swift](https://github.com/lintongSD/VerificationCode/blob/master/showCode0.png)
![代码](https://github.com/lintongSD/VerificationCode/blob/master/showCode1.png)

#### 问题1: 光标不居中(UI细节问题)
![问题产生原因](https://github.com/lintongSD/VerificationCode/blob/master/problem.png)
