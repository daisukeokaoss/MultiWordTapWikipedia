//
//  GetWordArrayFromWikipedia.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/01.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import Foundation

class GetWordArrayFromWikipedia: NSObject , XMLParserDelegate{
    
    var endFlag = false
    var WordArray:Array<String> = []
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if(elementName == "pl"){
            WordArray.append(attributeDict["title"]!)
        }
    }
    
    func getWordArrayFromStringJp(seedWord:String) -> Array<String>
    {
        WordArray = []
        
        
        
        let url = NSURL(string: "https://ja.wikipedia.org/w/api.php?format=xml&action=query&prop=links&titles=" + seedWord.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)! + "&&pllimit=1000")
        self.endFlag = true
        let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
            
            let parser : XMLParser = XMLParser(data: data!)
            
            parser.delegate = self
            parser.parse()
            self.endFlag = false
        })
        
        task.resume()
        
        while self.endFlag == true{
            usleep(100)
        }
        
        
        
        return WordArray
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
    }

}
