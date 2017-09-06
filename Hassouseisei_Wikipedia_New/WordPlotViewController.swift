//
//  WordPlotViewController.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/06.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class WordPlotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.wordPlotScrollView.superViewController = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var wordPlotScrollView: WordPlotScrollView!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
