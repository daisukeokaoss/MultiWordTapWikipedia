//
//  WordCollectionTableViewController.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/03.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class WordCollectionTableViewController: UITableViewController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        appdelegate.setting.saveSetting()
    }
    
    var MyTableView:UITableView?
    
    var firstLoadFlag = 0;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        if firstLoadFlag == 0{
            appdelegate.setting.loadSetting()
            firstLoadFlag = 1
        }
        
        
        self.MyTableView?.reloadData()
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.MyTableView = tableView
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell", for: indexPath)
            
            return cell
        }else if(indexPath.row > appdelegate.setOfWordArray.count){
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell", for: indexPath)
            
            return cell
        }
        
        if(indexPath.row >= 1 && indexPath.row <= (appdelegate.setOfWordArray.count + 1)){
            let cell:OneWordTableViewCell = tableView.dequeueReusableCell(withIdentifier: "wordCollectionCell", for: indexPath) as! OneWordTableViewCell
            cell.EnableDisableSwitch.isOn = appdelegate.setOfWordArray[indexPath.row-1].Enable
            cell.wordSetSelectionLabel.text = appdelegate.setOfWordArray[indexPath.row-1].CaptionString
            cell.IdentityNo = indexPath.row - 1
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            print("削除")
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.setOfWordArray.remove(at: indexPath.row - 1)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appdelegate.setOfWordArray.count+2
    }

}
