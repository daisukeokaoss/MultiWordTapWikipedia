//
//  GoogleSearchViewController.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/06.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

enum CountryOfGoogleSite{
    case JapaneseGoogle
    case AmericalGoogle
    case defaultGoogle
}

class GoogleSearchViewController: UIViewController {
    
    var webView:UIWebView = UIWebView()
    var SearchString:String?
    var btn:UIButton?
    
    var googlesite:CountryOfGoogleSite = .JapaneseGoogle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + 80, width: self.view.bounds.size.width, height: self.view.bounds.size.height-80)
        self.webView.autoresizingMask = UIViewAutoresizing()
        self.webView.scalesPageToFit = true
        self.view.addSubview(webView)
        
        let query:String? = self.SearchString?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        
        var url:String?
        if(self.googlesite == .JapaneseGoogle){
            url = "https://www.google.co.jp/m/search?q=" + query!
        }else if(self.googlesite == .AmericalGoogle){
            url = "https://www.google.com/m/search?q=" + query!
        }else{
            url = "https://www.google.com/m/search?q=" + query!
        }
        
        let request:NSURLRequest = NSURLRequest(url: NSURL(string:url!)! as URL)
        
        webView.loadRequest(request as URLRequest)
        
        btn = UIButton();
        btn?.frame = CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: 60)
        btn?.backgroundColor = UIColor.gray
        
        btn?.setTitle("戻る", for: UIControlState.normal)
        btn?.setTitle("戻る", for: UIControlState.highlighted)
        btn?.setTitle("戻る", for: UIControlState.disabled)
        btn?.addTarget(self, action: #selector(self.returnBack), for: UIControlEvents.touchDown)
        
    }
    
    func returnBack(){
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
