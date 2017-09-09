//
//  CollectSpecifiedWordIteration.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/01.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit


extension Array {
    
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
}

class CollectSpecifiedWordIteration: NSObject {
    
    var StopFlag = 0
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(self.CancelProcess(notification:)), name: Notification.Name(rawValue: "killProcess"), object: nil)
    }
    
    func CancelProcess(notification: Notification?){
        self.StopFlag = 1
    }
    
    let internalRegexp: NSRegularExpression = try! NSRegularExpression( pattern: "\\d", options: NSRegularExpression.Options.caseInsensitive)
    let internalRegexp2: NSRegularExpression = try! NSRegularExpression( pattern: ".*Wikipedia.*", options: NSRegularExpression.Options.caseInsensitive)
    //let internalRegexp3: NSRegularExpression = try! NSRegularExpression( pattern: ".*[０-９].*", options: NSRegularExpression.Options.caseInsensitive)
    //let internalRegexp4: NSRegularExpression = try! NSRegularExpression( pattern: ".*ISO.*", options: NSRegularExpression.Options.caseInsensitive)
    
    
    
    let deleteWordRegExpression = ["[0-9]","Wikipedia","[０-９]"]
    
    
   /* func shuffle<T>( array: inout [T]) {
        for j in ((0 + 1)...array.count - 1).reversed() {
            let k = Int(arc4random_uniform(UInt32(j + 1))) // 0 <= k <= j
            if k == j{
                continue
            }
            swap(&array[k], &array[j])
        }
    }*/
    
    func collectWordIteration(seedString :String,Count:Int) -> Array<String>
    {
        var wordArray = Array<String>()
        let getWordArrayFrom = GetWordArrayFromWikipedia();
        
        wordArray = getWordArrayFrom.getWordArrayFromStringJp(seedWord: seedString);
        
        if(wordArray.count == 0){
            return []
        }
        
        wordArray.shuffle()
        wordArray = wordArray.shuffled
        //shuffle(array: &wordArray);
        
        var pointer:Int = 0
        
        var i = 0;
        while(i < wordArray.count){
            if (self.internalRegexp.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                
                wordArray.remove(at: i)
            }else if (self.internalRegexp2.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                wordArray.remove(at: i)
            }/*else if (self.internalRegexp3.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                wordArray.remove(at: i)
            }else if (self.internalRegexp4.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                wordArray.remove(at: i)
            }*/
            i += 1;
        }
        

        
        var wordSet = Set(wordArray)
        
        var maxIterationCount = 100
        
        while wordSet.count <= Count{
            if(wordArray.count == 0){
                return []
            }
            
            maxIterationCount -= 1
            if maxIterationCount <= 0{
                return []
            }
            
            
            let PointerString = wordArray[pointer]
            pointer += 1
            sleep(2)
            
            if(StopFlag == 1){
                return []
            }
            
            print(PointerString+"のワードを取得します\n")
            
            //NSNotificationのインスタンスを作成。["value":100]という辞書型のデータを持たせる
            
            DispatchQueue.main.async(execute: {
                // 処理が終わった後UIスレッドでやりたいことはここ
                //print("aaaaa")
                
                let n : Notification = Notification(name: Notification.Name(rawValue: "wordFetchNotification"), object: self, userInfo: ["value": PointerString,"CurrentWordCount":wordSet.count])
                //通知を送る
                NotificationCenter.default.post(n)
                
            })
            
            wordArray += getWordArrayFrom.getWordArrayFromStringJp(seedWord: PointerString)
            
            var i = 0;
            while(i < wordArray.count){
                if (self.internalRegexp.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                    wordArray.remove(at: i)
                }else if (self.internalRegexp2.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                    wordArray.remove(at: i)
                }/*else if (self.internalRegexp3.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                    wordArray.remove(at: i)
                }else if (self.internalRegexp4.firstMatch ( in: wordArray[i], options: [], range:NSMakeRange(0, wordArray[i].characters.count) ) != nil){
                    wordArray.remove(at: i)
                }*/
                i += 1;
            }
            
            wordArray.append(seedString)
            
            wordSet = Set(wordArray)
        }
        
        return Array(wordSet)

    }
    


}
