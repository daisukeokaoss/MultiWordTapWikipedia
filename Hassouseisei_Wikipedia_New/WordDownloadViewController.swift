//
//  WordDownloadViewController.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/01.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class WordDownloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ProcessPlotTextView.isHidden = true;
        self.DownloadButton.isHidden = false;
        
        self.ProcessPlotTextView.text = "";
        
        NotificationCenter.default.addObserver(self, selector: Selector("update:"), name: NSNotification.Name(rawValue: "wordFetchNotification"), object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(notification: NSNotification?) {
        print("NSNotification")
        
        if let userInfo = notification!.userInfo {
            let result = userInfo["value"] as! String
            let count = userInfo["CurrentWordCount"] as! Int
            print("受信した数値：\(result)")
            
            ProcessPlotTextView.text.append(String("「\(result)」の関連ワードを取得しました\n"))
            ProcessPlotTextView.text.append(String("\(count)個のワードを取得しました\n"))
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   
    @IBAction func DownLoadExecute(_ sender: Any) {
        self.DownloadButton.isHidden = true
        self.ProcessPlotTextView.isHidden = false
    }

    @IBOutlet weak var ProcessPlotTextView: UITextView!

    @IBOutlet weak var DownloadButton: UIButton!
}
