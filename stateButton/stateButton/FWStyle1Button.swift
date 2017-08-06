//
//  FWStyle1Button.swift
//  FreeWeddingApp
//
//  Created by 张天琛 on 2017/8/3.
//  Copyright © 2017年 sc. All rights reserved.
//

import Foundation

//必须为custom  不然高亮没办法修改。。

class FWStyle1Button: UIButton{
    
//    convenience  init(){
//        self.init(type: .custom)
//    }
    
     override init(frame: CGRect) {
        super.init(frame: frame)
//        self.frame = frame
        //必须为custom  不然高亮没办法修改。。
        self.setValue("UIButtonType.custom", forKey: "buttonType")
        assert(self.buttonType == .custom, "必须为custom  不然高亮没办法修改")
        self.initUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue("UIButtonType.custom", forKey: "buttonType")
        //必须为custom  不然高亮没办法修改。。
        assert(self.buttonType == .custom, "必须为custom  不然高亮没办法修改")
        self.initUI()
    }
    
    func initUI() {
        //不同状态
        //取消掉默认的状态
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false
        self.reversesTitleShadowWhenHighlighted = false
        //正常
        self .setTitleColor(.white, for: .normal)
        self .setBackgroundColor(FWUIGetColor("DF2645"), for: .normal)
        self .titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        self.tintColor = .black
        //按住
        self .setTitleColor(FWUIGetColor("FFFFFF").withAlphaComponent(0.6), for: .highlighted)
        self .setBackgroundColor(FWUIGetColor("BB0B2B"), for: .highlighted)
        
        //disabel
       
        self .setBackgroundColor(FWUIGetColor("ceced7"), for: .disabled)
       
        self .setTitleColor(FWUIGetColor("FFFFFF").withAlphaComponent(0.6), for: .disabled)
    }
    
//    override func didAddSubview(_ subview: UIView) {
//        self.initUI()
//    }
    
//    override var isHighlighted: Bool{
//        set{
//
//        }
//        get{
//
//        }
//    }
    
    
    func setBackgroundColor(_ color: UIColor?, for state: UIControlState) {
        self .setBackgroundImage(UIImage.imageWith(color!), for: state)
    }
    
    
}
