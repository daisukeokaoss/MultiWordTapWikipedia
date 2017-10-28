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
    var ruleOfGameLabel:UILabel!
    var mainWordLabel:UILabel!
    var count:Int = 0
    
    var wordSetArray:Array<String> = []
    
    override func updateFrame(selfView:UIView)
    {
        if(phase == 0){

            ruleOfGameLabel = UILabel()
            ruleOfGameLabel.font = UIFont.systemFont(ofSize: 15)
            ruleOfGameLabel.textColor = UIColor.blue
            ruleOfGameLabel.text = "最初に提示された単語と同じ単語をタップしてください"
            ruleOfGameLabel.tag = 1
            
            let labelX = selfView.frame.size.width / 2 - self.ruleOfGameLabel.sizeThatFits(CGSize(width: 100, height: 50)).width / 2
            let labelY = selfView.frame.size.height / 2 - self.ruleOfGameLabel.sizeThatFits(CGSize(width: 100, height: 50)).height / 2
            let labelHeight = self.ruleOfGameLabel.sizeThatFits(CGSize(width: 100, height: 50)).height
            let labelWidth = self.ruleOfGameLabel.sizeThatFits(CGSize(width: 100, height: 50)).width
            
            ruleOfGameLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
            selfView.addSubview(self.ruleOfGameLabel)
            phase = 1
            count = 2
        }else if(phase == 1){
            if(count > 0){
                count -= 1
            }else{
                phase = 2
            }
        }else if(phase == 2){
            ruleOfGameLabel.text = "ゲームスタート"
            phase = 3
        }else if(phase == 3){
            mainWordLabel = UILabel()
            mainWordLabel.text = wordSetArray[0]
            mainWordLabel.font = UIFont.boldSystemFont(ofSize: 15)
            let labelX = selfView.frame.size.width / 2 -  self.mainWordLabel.sizeThatFits(CGSize(width: 100, height: 50)).width/2
            let  labelY = selfView.frame.size.height / 2 - self.mainWordLabel.sizeThatFits(CGSize(width: 100, height: 50)).height/2
            let labelHeight = self.mainWordLabel.sizeThatFits(CGSize(width: 100, height: 50)).height
            let labelWidth = self.mainWordLabel.sizeThatFits(CGSize(width: 100, height: 50)).width
            mainWordLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
            selfView.addSubview(mainWordLabel)
            self.phase = 4
        }
    }
    

    func prepareForWordSet()
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        var wordArray = Array<String>()
        
        for i in 0..<delegate.setOfWordArray.count{
            if(delegate.setOfWordArray[i].Enable){
                wordArray += delegate.setOfWordArray[i].wordSetArray
            }
        }
        
        wordArray.shuffle()
        self.wordSetArray = wordArray.shuffled
    }
    
    override func initializeStage(selfView:UIView)
    {
        self.phase = 0
        self.dissmissLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        self.dissmissLabel.font = UIFont.systemFont(ofSize: 80)
        self.dissmissLabel.text = "×"
        self.dissmissLabel.tag = 0
        
        selfView.addSubview(self.dissmissLabel)
        
        self.prepareForWordSet()
    }
    
    override func finalizeStage(selfView:UIView)
    {
        
    }
    
    override func revokedWhenTouchEnded(_ touches: Set<UITouch>, with event: UIEvent?,parentViewController:UIViewController)
        //タッチされた時に呼び出される関数
    {
        for touch:AnyObject in touches{
            let t:UITouch = touch as! UITouch
            if(t.view?.tag == self.dissmissLabel.tag){
                parentViewController.dismiss(animated: true, completion: nil)
            }
        }
        
    }

}
