//
//  TestModule.swift
//  SwiftAccessDemo
//
//  Created by 曾文斌 on 2017/7/31.
//  Copyright © 2017年 yww. All rights reserved.
//

import Foundation

class InternalModuleClass : NSObject {
    let msg = "world"
}


public class PublicModuleClass : NSObject {
    public let msg = "world"
    let internalMsg = "internal" // 默认为 internal
}
open class OpenModuleClass : NSObject {
    open let msg = "world"
    open func openFunc(){}
    public func publicFunc(){}
}
