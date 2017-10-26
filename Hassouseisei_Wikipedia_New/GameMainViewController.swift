//
//  GameMainViewController.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/10/23.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class GameMainViewController: UIViewController {
    
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    var Stage:Int = 0
    var Phase:Int = 0

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawUserInterface()
    {
        
    }
    
    func update(tm: Timer) {
        // do something
        print("timer")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
