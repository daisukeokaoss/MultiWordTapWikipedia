//
//  WordPlotScrollView.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/05.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit


/*extension Array {
    
    mutating func shuffle() {
        for i in 0..<self.count {
            let j = Int(arc4random_uniform(UInt32(self.indices.last!)))
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
    
    var shuffled: Array {
        var copied = Array<Element>(self)
        copied.shuffle()
        return copied
    }
}*/

class WordPlotScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    internal var superViewController:UIViewController!
    
    var DrawedFlag = false
    
    var generateButton:UIButton!
    var Label1st:UILabel!
    var Label2nd:UILabel!
    var Label3rd:UILabel!
    var Label4th:UILabel!
    var Label5th:UILabel!
    var Label6th:UILabel!
    var Label7th:UILabel!
    var Label8th:UILabel!
    
    
    internal func drawUserInterface( height:CGFloat = UIScreen.main.bounds.size.height, width:CGFloat = UIScreen.main.bounds.size.width)
    {
        print("Drowed")
        
        if self.DrawedFlag == false {
            self.DrawedFlag = true
        }else{
            self.Label1st.removeFromSuperview()
            self.Label2nd.removeFromSuperview()
            self.Label3rd.removeFromSuperview()
            self.Label4th.removeFromSuperview()
            self.Label5th.removeFromSuperview()
            self.Label6th.removeFromSuperview()
            self.Label7th.removeFromSuperview()
            self.Label8th.removeFromSuperview()
            self.generateButton.removeFromSuperview()
        }
        
        let rowHeight = height/13
        let xCoordinateOfStartingWord = width/24
        
        let labelHeight = CGFloat(30)
        
        let xLabel = xCoordinateOfStartingWord
        
        let labelWidth = xCoordinateOfStartingWord*22
        
        self.Label1st = UILabel(frame: CGRect(x: xLabel, y: rowHeight, width: labelWidth, height: labelHeight))
        self.Label2nd = UILabel(frame: CGRect(x: xLabel, y: rowHeight*2, width: labelWidth, height: labelHeight))
        self.Label3rd = UILabel(frame: CGRect(x: xLabel, y: rowHeight*3, width: labelWidth, height: labelHeight))
        self.Label4th = UILabel(frame: CGRect(x: xLabel, y: rowHeight*4, width: labelWidth, height: labelHeight))
        self.Label5th = UILabel(frame: CGRect(x: xLabel, y: rowHeight*5, width: labelWidth, height: labelHeight))
        self.Label6th = UILabel(frame: CGRect(x: xLabel, y: rowHeight*6, width: labelWidth, height: labelHeight))
        self.Label7th = UILabel(frame: CGRect(x: xLabel, y: rowHeight*7, width: labelWidth, height: labelHeight))
        self.Label8th = UILabel(frame: CGRect(x: xLabel, y: rowHeight*8, width: labelWidth, height: labelHeight))
        
        self.Label1st.text = ""
        self.Label2nd.text = ""
        self.Label3rd.text = ""
        self.Label4th.text = ""
        self.Label5th.text = ""
        self.Label6th.text = ""
        self.Label7th.text = ""
        self.Label8th.text = ""
        
        self.contentSize = CGSize(width: xLabel + self.Label1st.sizeThatFits(CGSize(width: 1000, height: 1000)).width, height: self.bounds.size.height)
        
        self.Label1st.isUserInteractionEnabled = true;
        self.Label2nd.isUserInteractionEnabled = true
        self.Label3rd.isUserInteractionEnabled = true
        self.Label4th.isUserInteractionEnabled = true
        self.Label5th.isUserInteractionEnabled = true
        self.Label6th.isUserInteractionEnabled = true
        self.Label7th.isUserInteractionEnabled = true
        self.Label8th.isUserInteractionEnabled = true
        
        self.Label1st.tag = 1
        self.Label2nd.tag = 2
        self.Label3rd.tag = 3
        self.Label4th.tag = 4
        self.Label5th.tag = 5
        self.Label6th.tag = 6
        self.Label7th.tag = 7
        self.Label8th.tag = 8
        
        self.addSubview(self.Label1st)
        self.addSubview(self.Label2nd)
        self.addSubview(self.Label3rd)
        self.addSubview(self.Label4th)
        self.addSubview(self.Label5th)
        self.addSubview(self.Label6th)
        self.addSubview(self.Label7th)
        self.addSubview(self.Label8th)
        
        self.generateButton = UIButton()
        self.generateButton.frame = CGRect(x: xLabel, y: rowHeight*9, width: labelWidth, height: rowHeight*2.85)
        
        self.generateButton.backgroundColor = UIColor(red: 243.0/255.0, green: 152.0/255.0, blue: 0, alpha: 1.0)
        
        self.generateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.generateButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.generateButton.setTitle("Push", for: UIControlState.normal)
        
        self.generateButton.addTarget(self, action: #selector(self.generateButtonClick), for: .touchDown)
        
        self.addSubview(self.generateButton)
        
    }
    
    func generateButtonClick()
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        var wordArray = Array<String>()
        
        for i in 0..<delegate.setOfWordArray.count{
            if(delegate.setOfWordArray[i].Enable){
                wordArray += delegate.setOfWordArray[i].wordSetArray
            }
        }
        
        wordArray.shuffle()
        wordArray = wordArray.shuffled
        
        self.Label1st.text = ""
        self.Label2nd.text = ""
        self.Label3rd.text = ""
        self.Label4th.text = ""
        self.Label5th.text = ""
        self.Label6th.text = ""
        self.Label7th.text = ""
        self.Label8th.text = ""
        
        if(wordArray.count > 0){
            self.Label1st.text = wordArray[0]
            self.Label2nd.text = wordArray[1]
            self.Label3rd.text = wordArray[2]
            self.Label4th.text = wordArray[3]
            self.Label5th.text = wordArray[4]
            self.Label6th.text = wordArray[5]
            self.Label7th.text = wordArray[6]
            self.Label8th.text = wordArray[7]
            
            self.Label1st.sizeToFit()
            self.Label2nd.sizeToFit()
            self.Label3rd.sizeToFit()
            self.Label4th.sizeToFit()
            self.Label5th.sizeToFit()
            self.Label6th.sizeToFit()
            self.Label7th.sizeToFit()
            self.Label8th.sizeToFit()
            
            var maxWidth:CGFloat = 0
            
            var width:CGFloat = self.Label1st.bounds.origin.x + self.Label1st.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            if(width > maxWidth){
                maxWidth = width
            }
            width = self.Label2nd.bounds.origin.x + self.Label2nd.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            width = self.Label3rd.bounds.origin.x + self.Label3rd.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            width = self.Label4th.bounds.origin.x + self.Label4th.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            width = self.Label5th.bounds.origin.x + self.Label5th.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            width = self.Label6th.bounds.origin.x + self.Label6th.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            width = self.Label7th.bounds.origin.x + self.Label7th.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            width = self.Label8th.bounds.origin.x + self.Label8th.bounds.size.width
            if(width > maxWidth){
                maxWidth = width
            }
            
            self.contentSize.width = maxWidth
            
            self.sizeToFit()
        }
    }
    
   /* func shuffle<T>( array: inout [T]) {
        for j in ((0 + 1)...array.count - 1).reversed() {
            let k = Int(arc4random_uniform(UInt32(j + 1))) // 0 <= k <= j
            if k == j{
                continue
            }
            swap(&array[k], &array[j])
        }
    }*/
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let googleSearchViewController:GoogleSearchViewController = GoogleSearchViewController()
        googleSearchViewController.googlesite = .JapaneseGoogle
        
        for touch:AnyObject in touches{
            let t:UITouch = touch as! UITouch
            if(t.view?.tag == self.Label1st.tag){
                googleSearchViewController.SearchString = self.Label1st.text
            }else if(t.view?.tag == self.Label2nd.tag){
                googleSearchViewController.SearchString = self.Label2nd.text
            }else if(t.view?.tag == self.Label3rd.tag){
                googleSearchViewController.SearchString = self.Label3rd.text
            }else if(t.view?.tag == self.Label4th.tag){
                googleSearchViewController.SearchString = self.Label4th.text
            }else if(t.view?.tag == self.Label5th.tag){
                googleSearchViewController.SearchString = self.Label5th.text
            }else if(t.view?.tag == self.Label6th.tag){
                googleSearchViewController.SearchString = self.Label6th.text
            }else if(t.view?.tag == self.Label7th.tag){
                googleSearchViewController.SearchString = self.Label7th.text
            }else if(t.view?.tag == self.Label8th.tag){
                googleSearchViewController.SearchString = self.Label8th.text
            }else{
                return
            }
        }
        googleSearchViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.superViewController.present(googleSearchViewController, animated: true, completion: nil)
    }
    


}
