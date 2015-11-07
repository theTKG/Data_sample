//
//  ViewController.swift
//  Data_sample
//
//  Created by Ooguchi Taiga on 2015/11/05.
//  Copyright © 2015年 Ooguchi Taiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField: UITextField!
    var mySaveButton: UIButton!
    var myLoadButton: UIButton!
    var myDeleteButton: UIButton!
    var myStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 説明ラベル
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,500,50))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "テキストボックス入力＆ボタン押下"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 50)
        self.view.addSubview(myLabel)
        
        // テキストフィールド
        myTextField = UITextField(frame: CGRectMake(50, 100, 300, 200))
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.delegate = self
        self.view.addSubview(myTextField)
        
        // 説明ラベル
        myStateLabel = UILabel(frame: CGRectMake(0,0,500,50))
        myStateLabel.backgroundColor = UIColor.orangeColor()
        myStateLabel.layer.masksToBounds = true
        myStateLabel.layer.cornerRadius = 20.0
        myStateLabel.text = "【状態】"
        myStateLabel.textColor = UIColor.whiteColor()
        myStateLabel.textAlignment = NSTextAlignment.Center
        myStateLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 350)
        self.view.addSubview(myStateLabel)

        // 保存ボタン
        mySaveButton = UIButton()
        mySaveButton.frame = CGRectMake(0,0,200,40)
        mySaveButton.backgroundColor = UIColor.redColor()
        mySaveButton.setTitle("保存", forState: UIControlState.Normal)
        mySaveButton.layer.masksToBounds = true
        mySaveButton.layer.cornerRadius = 20.0
        mySaveButton.layer.position = CGPoint(x: self.view.frame.width/2, y:425)
        mySaveButton.tag = 1
        mySaveButton.addTarget(self, action: "respondToSaveButtonClick:", forControlEvents: .TouchUpInside)
        self.view.addSubview(mySaveButton)
        
        
        // 読み込みボタン
        myLoadButton = UIButton()
        myLoadButton.frame = CGRectMake(0,0,200,40)
        myLoadButton.backgroundColor = UIColor.redColor()
        myLoadButton.setTitle("読み込み", forState: UIControlState.Normal)
        myLoadButton.layer.masksToBounds = true
        myLoadButton.layer.cornerRadius = 20.0
        myLoadButton.layer.position = CGPoint(x: self.view.frame.width/2, y:500)
        myLoadButton.tag = 2
        myLoadButton.addTarget(self, action: "respondToLoadButtonClick:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myLoadButton)
        
        
        // 削除ボタン
        myDeleteButton = UIButton()
        myDeleteButton.frame = CGRectMake(0,0,200,40)
        myDeleteButton.backgroundColor = UIColor.redColor()
        myDeleteButton.setTitle("保存データ削除", forState: UIControlState.Normal)
        myDeleteButton.layer.masksToBounds = true
        myDeleteButton.layer.cornerRadius = 20.0
        myDeleteButton.layer.position = CGPoint(x: self.view.frame.width/2, y:575)
        myDeleteButton.tag = 3
        myDeleteButton.addTarget(self, action: "respondToDeleteClick:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myDeleteButton)
        
        
    }
    
    // 保存
    func respondToSaveButtonClick(sender: UIButton) {
        // 生成
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(myTextField.text, forKey: "Key")
        let successful = defaults.synchronize()
        if successful {
            print("データの保存に成功しました。")
            myStateLabel.text = "【状態】データを保存しました"
        }
    }
    
    // 読込
    func respondToLoadButtonClick(sender: UIButton) {
        // 生成
        let defaults = NSUserDefaults.standardUserDefaults()
        if let texts = defaults.objectForKey("Key") {
            print(texts)
            
            myTextField.text  = texts as? String
            myStateLabel.text = "【状態】データを読み込みました"
            
        }
    }
    
    // 削除
    func respondToDeleteClick(sender: UIButton) {
        // 生成
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("Key")
        print("データの削除に成功しました。")
        myStateLabel.text = "【状態】データを削除しました"
    }
    
    // キーボードの「return」を押すと、キーボードを隠す
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

