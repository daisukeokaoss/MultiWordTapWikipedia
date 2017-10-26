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
        
        self.wordPlotScrollView.drawUserInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var wordPlotScrollView: WordPlotScrollView!
    
    var DrawedFlag = false
    
    var gameStartButton:UIButton!
    
    internal func drawUserInterface( height:CGFloat = UIScreen.main.bounds.size.height, width:CGFloat = UIScreen.main.bounds.size.width)
    {
        print("Drowed")
        
        if self.DrawedFlag == false {
            self.DrawedFlag = true
        }else{
            self.gameStartButton.removeFromSuperview()
        }
        
        let rowHeight = height/13
        let xCoordinateOfStartingWord = width/24
        
        let xLabel = xCoordinateOfStartingWord
        
        let labelWidth = xCoordinateOfStartingWord*22
        
        self.gameStartButton = UIButton()
        self.gameStartButton.frame = CGRect(x: xLabel, y: rowHeight*4, width: labelWidth, height: rowHeight*2.85)
        
        self.gameStartButton.backgroundColor = UIColor(red: 243.0/255.0, green: 152.0/255.0, blue: 0, alpha: 1.0)
        
        self.gameStartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.gameStartButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.gameStartButton.setTitle("Game Start", for: UIControlState.normal)
        
        self.gameStartButton.addTarget(self, action: #selector(self.gameStartButtonClick), for: .touchDown)
        
        self.view.addSubview(self.gameStartButton)
        
    }
    
    func gameStartButtonClick()
    {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "GameMainVC")
        self.present(next,animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        if(UIDevice.current.userInterfaceIdiom == .pad){
            self.wordPlotScrollView.drawUserInterface(height: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width)
        }
    }

}
