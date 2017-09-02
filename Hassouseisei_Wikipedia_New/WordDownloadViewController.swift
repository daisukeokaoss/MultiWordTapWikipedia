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
        
        self.ProcessPlotTextView.isHidden = true
        self.DownloadButton.isHidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
