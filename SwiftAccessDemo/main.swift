//
//  main.swift
//  SwiftAccessDemo
//
//  Created by 曾文斌 on 2017/7/31.
//  Copyright © 2017年 yww. All rights reserved.
//

import Foundation

import TestModule


private class PrivateClass : NSObject {
    private let msg = "world"
    //fileprivate let fileprivateMsg  = "free world"
}
// private 类可以扩展
extension PrivateClass {
    func say() {
//        print("say\(self.msg)")// 扩展中无法访问私有变量
    }
}
// 可以继承
private class SubPrivateClass : PrivateClass {
    func say2() {
//        print(self.msg)// 错误, 子类中无法访问父类的私有属性
    }
}
// 可以实例化
PrivateClass()
// 可以在同文件中访问非 private 变量
//PrivateClass().fileprivateMsg
//PrivateClass().msg// 错误, 私有变量无法访问

class FileprivateClass : NSObject {
    fileprivate let msg = "world"
}

//InternalModuleClass() // 错误不可访问

PublicModuleClass() // public 可以跨模块访问
PublicModuleClass().msg //public 属性可以访问
//PublicModuleClass().internalMsg //错误 internal 属性不可跨模块
// class SubPublicModuleClass : PublicModuleClass {} // 无法继承
extension PublicModuleClass {} //可以扩展

class SubOpenModuleClass: OpenModuleClass {
    override func openFunc(){}
//    override func publicFunc(){}// public 方法不可重写
}



