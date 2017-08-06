# OOstateButton
使用swift对button的封装。button不同state不同类型不同样式。
# 一些说明
代码比较简单，主要用于记录作用。
最开始因为整个应用的button 风格比较统一。但是UED要求 按钮的 长按和不可按需要特定的UI，而不是系统自带的风格。所以对按钮进行了封装。在封装过程中遇到了一些问题，所以记录下来。

1. 系统样式无法禁止。虽然系统提供了。

```swift
setBackgroundImage state api
```


但是，对背景色无该方法。所以自定义了自动转纯色图片api


```swift
class func imageWith(_ color: UIColor) -> UIImage
```

2. 发现系统自定义的样式无法禁止。于是google了一些解决方案。
1）使用以下属性，但是依然无效

```swift
self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false
```
2）终于发现原因。button的type必须是custom。才能禁止系统自定义
```swift
let button = UIButton.init(type: .custom)
```

3）但是这样子，封装的代码使用者很容易忽略该属性设置。而且，因为type是readOnly属性。所以没有办法在封装过程中进行修改。

首先进行了断言处理
```swift
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        assert(self.buttonType == .custom, "必须为custom  不然高亮没办法修改")
        self.initUI()
    }
```

但是感觉这种方案并不好。使用者在运行过程中才知道自己编写有问题。于是尝试在编译过程中就报错。尝试了一下，并没有解决。如果有朋友知道怎么在编译过程中，如果button属性未设置为custom就编译不过去，希望能告知。
再打算放弃的时候。突然想到KVC可以强制修改readOnly属性。于是有了下面代码
```swift
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue("UIButtonType.custom", forKey: "buttonType")
        //必须为custom  不然高亮没办法修改。。
        assert(self.buttonType == .custom, "必须为custom  不然高亮没办法修改")
        self.initUI()
    }
```
完美。解决了。。
        

## 几个重点。
button 设置不同状态的问题需要满足下面条件：
1.  adjustsImageWhenHighlighted，adjustsImageWhenDisabled属性设置false
2.  button 的type必须是custom。（在封装过程使用kvc解决之）
