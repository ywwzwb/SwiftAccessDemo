# SwiftAccessDemo
相对于 Objective-C, swift 多了很多访问控制符, 除了其他语言常见的 private, public 之外, swift 还多了 open, fileprivate 等
访问控制符根据可访问性排序为
`open` > `public` > `internal` > `fileprivate` > `private`, 其中, `internal` 是默认访问控制符
1. private
对于属性来说, private 最为严格, 只能在声明的地方使用, 例如, 在 class 中声明一个 private 属性, 除了在这个声明中能使用之外, 其他地方, 包括扩展中均无法使用.
private 用于类时, 可以在当前模块实例化, 继承, 不可跨模块访问
 值得注意的是, private 修饰的类, 依旧可以在外部, 别的文件中访问, 实例化.
```
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

```
2. fileprivate 
整体类似于 private, 区别在于限制范围由定义所在域 改为 当前文件
3. internal 
这个是默认访问控制符, 表示在当前模块内可访问, 超出此模块不可访问.
在编写 framework时, 若你需要声明一个只在内部使用的类, 但是此类又需要在内部的多个文件中使用, 使用 internal 就是一个非常不错的选择.
```
// 模块内定义
class InternalModuleClass : NSObject {
    let msg = "world"
}
// 模块外调用
//InternalModuleClass() // 错误, 不可访问
```
4. public
用此方法申明的类, 可以跨模块访问, 不过不能跨模块继承. 在编写 framework ,想要编写一些不想在模块外被继承的类, 但又需要在内部能够继承时很有用
```
// 模块内定义
public class PublicModuleClass : NSObject {
    public let msg = "world"
    let internalMsg = "internal" // 默认为 internal
}
// 模块外调用
PublicModuleClass() // public 可以跨模块访问
PublicModuleClass().msg
//PublicModuleClass().internalMsg //错误 internal 属性不可跨模块
// class SubPublicModuleClass : PublicModuleClass {} // 无法继承
extension PublicModuleClass {} //可以扩展
```
5. open
无任何限制
```
// 模块内定义
open class OpenModuleClass : NSObject {
    open let msg = "world"
    open func openFunc(){}
    public func publicFunc(){}
}
// 模块外调用
class SubOpenModuleClass: OpenModuleClass {
    override func openFunc(){}
    override func publicFunc(){}// public 方法不可重写
}
```


