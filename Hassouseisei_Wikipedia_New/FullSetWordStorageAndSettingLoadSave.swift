//
//  FullSetWordStorageAndSettingLoadSave.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/03.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class FullSetWordStorageAndSettingLoadSave: NSObject {
    
    let defaults = UserDefaults.standard
    
    func loadDefaultWordSet()
    {
        let appdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let MathWord = OneSetWordStorage()
        
        MathWord.CaptionString = MathmaticalJPDefaultWordSet.ReturnCaption()
        MathWord.Enable = true
        MathWord.wordSetArray = MathmaticalJPDefaultWordSet.ReturnWordArray()
        appdelegate.setOfWordArray.append(MathWord)
        
        let ChemicalWord = OneSetWordStorage()
        ChemicalWord.CaptionString = ChemicalJPDefaultWord.ReturnCaption()
        ChemicalWord.Enable = true
        ChemicalWord.wordSetArray = ChemicalJPDefaultWord.ReturnWordArray()
        appdelegate.setOfWordArray.append(ChemicalWord)
        
        let BungakuWord = OneSetWordStorage()
        BungakuWord.CaptionString = BungakuJPDefaultWord.ReturnCaption()
        BungakuWord.Enable = true
        BungakuWord.wordSetArray = BungakuJPDefaultWord.ReturnWordArray()
        appdelegate.setOfWordArray.append(BungakuWord)
        
        
    }
    
    func loadDefaultSetting()
    {
        let appdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appdelegate.setOfWordArray = []
        
        self.loadDefaultWordSet()
        
        
        
        let firsttime_ = defaults.integer(forKey: "FirstTime")
        if(firsttime_ == 0){
            self.loadDefaultWordSet()
        }
        let count = defaults.integer(forKey: "WordSetCount")
        
        for i in 0..<count{
            let oneWordStorage = OneSetWordStorage();
            oneWordStorage.CaptionString = defaults.string(forKey: "WordSetCaptionNo\(i)")!
            oneWordStorage.wordSetArray  = defaults.object(forKey: "WordSetArrayNo\(i)") as! Array<String>
            
            oneWordStorage.Enable = defaults.bool(forKey: "WordSetEnable\(i)")
            
            appdelegate.setOfWordArray.append(oneWordStorage)
        }
        
    }
    
    func saveSetting()
    {
        let appdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        defaults.set(4, forKey:"FirstTime")
        
        defaults.set(appdelegate.setOfWordArray.count, forKey: "WordSetCount")
        
        for i in 0..<appdelegate.setOfWordArray.count{
            defaults.set(appdelegate.setOfWordArray[i].CaptionString, forKey: "WordSetCaptionNo\(i)")
            defaults.set(appdelegate.setOfWordArray[i].wordSetArray, forKey: "WordSetArrayNo\(i)")
            defaults.set(appdelegate.setOfWordArray[i].Enable, forKey: "WordSetEnable\(i)")
        }
    }

    

}
