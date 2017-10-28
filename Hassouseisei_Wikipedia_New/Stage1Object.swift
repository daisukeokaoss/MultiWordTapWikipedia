//
//  Stage1Object.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/10/26.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class Stage1Object: OneStage {
    
    var dissmissLabel:UILabel!
    
    override func updateFrame(selfView:UIView)
    {
        if(phase == 0){
            
        }
    }
    
    func phase0Preparation(selfView:UIView)
    {
        
    }
    
    override func initializeStage(selfView:UIView)
    {
        self.phase = 0
        self.dissmissLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        self.dissmissLabel.font = UIFont(name: "HiraginoSans-W3", size: 80)
        self.dissmissLabel.text = "×"
        
        selfView.addSubview(self.dissmissLabel)
    }
    
    override func finalizeStage(selfView:UIView)
    {
        
    }
    
    override func revokedWhenTouchEnded(_ touches: Set<UITouch>, with event: UIEvent?)
        //タッチされた時に呼び出される関数
    {
        
    }

}
