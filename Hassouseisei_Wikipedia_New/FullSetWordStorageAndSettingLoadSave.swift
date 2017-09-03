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
        //let appdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let MathWord = OneSetWordStorage()
        
        MathWord.CaptionString = MathmaticalJPDefaultWordSet.ReturnCaption()
        MathWord.Enable = true
        MathWord.wordSetArray = MathmaticalJPDefaultWordSet.ReturnWordArray()
        
        let ChemicalWord = OneSetWordStorage()
        ChemicalWord.CaptionString = ChemicalJPDefaultWord.ReturnCaption()
        ChemicalWord.Enable = true
        ChemicalWord.wordSetArray = ChemicalJPDefaultWord.ReturnWordArray()
        
        let BungakuWord = OneSetWordStorage()
        BungakuWord.CaptionString = BungakuJPDefaultWord.ReturnCaption()
        BungakuWord.Enable = true
        BungakuWord.wordSetArray = BungakuJPDefaultWord.ReturnWordArray()
        
        
    }
    
    func loadDefaultSetting()
    {
        let appdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appdelegate
        
    }

    

}
