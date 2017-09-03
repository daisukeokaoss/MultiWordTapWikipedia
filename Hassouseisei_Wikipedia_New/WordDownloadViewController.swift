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
        self.ProcessStopButton.isHidden = true
        
        self.ProcessPlotTextView.text = "hogehoge";
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.update), name: Notification.Name(rawValue: "wordFetchNotification"), object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(notification: Notification?) {
        print("Notification")
        
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
    @IBAction func StopProcessExecute(_ sender: Any) {
        if(CancelFlag == false){
            let alertController: UIAlertController = UIAlertController(title: "確認", message: "プロセスを中止しますか？", preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                
            }
            
            let logintAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
                //Notificationを送信
                //NSNotificationのインスタンスを作成。["value":100]という辞書型のデータを持たせる
                let n : Notification = Notification(name: Notification.Name(rawValue: "killProcess"), object: self)
                //通知を送る
                NotificationCenter.default.post(n)
                self.CancelFlag = true
                self.changeUserInterfaceStopProcessing()
                
            }
            alertController.addAction(cancelAction)
            
            alertController.addAction(logintAction)
            
            
            
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        self.CancelFlag = false
        

        
    }
    
    
    func changeUserInterfaceStartProcessing()
    //ユーザーインターフェースをダウンロード中に変える
    {
        self.DownloadButton.isHidden = true
        self.ProcessPlotTextView.isHidden = false
        self.ProcessStopButton.isHidden = false
    }
    
    func changeUserInterfaceStopProcessing()
    //ユーザーインターフェースを待機中に変える
    {
        self.DownloadButton.isHidden = false
        self.ProcessPlotTextView.isHidden = true
        self.ProcessStopButton.isHidden = true
    }
    
    var CancelFlag = true
   
    @IBAction func DownLoadExecute(_ sender: Any) {
        var inputTextField: UITextField?
        
        let alertController: UIAlertController = UIAlertController(title: "単語", message: "キーワードを入力してください", preferredStyle: .alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Pushed CANCEL")
            self.changeUserInterfaceStopProcessing()
        }
        alertController.addAction(cancelAction)
        
        let logintAction: UIAlertAction = UIAlertAction(title: "収集", style: .default) { action -> Void in
            self.CancelFlag = false
            
            self.changeUserInterfaceStartProcessing()
            //ここに入力された値を入れる
            self.ProcessPlotTextView.text = "";
            self.ProcessPlotTextView.text.append("ワード収集を始めます\n")
            let backgroundQueue = DispatchQueue.global(qos: .default)
            
            
            
            backgroundQueue.async(execute: {
                // Backgroundで行いたい重い処理はここ
                
                let getWordArrayIterativeScript = CollectSpecifiedWordIteration()
                
                
                let wordArray = getWordArrayIterativeScript.collectWordIteration(seedString: (inputTextField?.text)!, Count: 1000)
                
                
                if(wordArray.count == 0){
                    DispatchQueue.main.async(execute: {
                        self.ProcessPlotTextView.text.append("\(wordArray)")
                        
                        print(wordArray)
                        
                        
                        
                        let alertController: UIAlertController = UIAlertController(title: "確認", message: "ワードが収集できませんでした", preferredStyle: .alert)
                        
                        let logintAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
                            //self.RegisterWordArray(wordArray, seedWord: (inputTextField?.text)!)
                        }
                        
                        
                        alertController.addAction(logintAction)
                        
                        
                        
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                        self.changeUserInterfaceStopProcessing()
                        
                        self.CancelFlag = true
                        
                    })
                    
                }
                
                
                DispatchQueue.main.async(execute: {
                    self.ProcessPlotTextView.text.append("\(wordArray)")
                    
                    print(wordArray)
                    
                    
                    
                    let alertController: UIAlertController = UIAlertController(title: "確認", message: "ワードライブラリに加えますか？", preferredStyle: .alert)
                    
                    let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                        self.changeUserInterfaceStopProcessing()
                    }
                    
                    let logintAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
                        //self.RegisterWordArray(wordArray, seedWord: (inputTextField?.text)!)
                        //ここで、単語セットをワードセットに登録する
                        self.changeUserInterfaceStopProcessing()
                    }
                    alertController.addAction(cancelAction)
                    
                    alertController.addAction(logintAction)
                    
                    self.present(alertController, animated: true, completion:nil)
                    
                    
                })
            })
        }
        
        alertController.addAction(logintAction)
        
        alertController.addTextField { textField -> Void in
            inputTextField = textField
            textField.placeholder = "キーワード"
        }
        
        
        present(alertController, animated: true, completion: {()
            //
        })
    }

    @IBOutlet weak var ProcessStopButton: UIButton!
    @IBOutlet weak var ProcessPlotTextView: UITextView!

    @IBOutlet weak var DownloadButton: UIButton!
}
