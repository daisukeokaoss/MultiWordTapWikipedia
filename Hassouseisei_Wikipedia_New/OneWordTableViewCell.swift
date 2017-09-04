//
//  OneWordTableViewCell.swift
//  Hassouseisei_Wikipedia_New
//
//  Created by 岡大輔 on 2017/09/03.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class OneWordTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBAction func enableDisableSwitchClickExecute(_ sender: UISwitch) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.setOfWordArray[IdentityNo].Enable = sender.isOn
    }

    @IBOutlet weak var EnableDisableSwitch: UISwitch!
    @IBOutlet weak var wordSetSelectionLabel: UILabel!
    
    var IdentityNo = -1
}
