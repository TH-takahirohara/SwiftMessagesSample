//
//  ViewController.swift
//  SwiftMessagesSample
//
//  Created by hara on 2020/03/03.
//  Copyright © 2020 hara. All rights reserved.
//

import UIKit
import SwiftMessages

class ViewController: UIViewController {
    
    // 各メッセージビューの生成
    let firstView  = MessageView.viewFromNib(layout: .centeredView)
    let secondView = MessageView.viewFromNib(layout: .centeredView)
    let thirdView  = MessageView.viewFromNib(layout: .centeredView)
    let forthView  = MessageView.viewFromNib(layout: .centeredView)

    // 設定用の変数
    var config = SwiftMessages.Config()
    
    // 画像データ
    let imgTutorial1 = UIImage.init(named: "imgTutorial1")
    let imgTutorial2 = UIImage.init(named: "imgTutorial2")
    let imgTutorial3 = UIImage.init(named: "imgTutorial3")
    let imgTutorial4 = UIImage.init(named: "imgTutorial4")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 見やすいように背景を灰色に変更
        self.view.backgroundColor = .gray
        
        setFirstView()
        setSecondView()
        setThirdView()
        setForthView()
        configure()
        
        // メッセージの表示
        SwiftMessages.show(config: config, view: firstView)
        SwiftMessages.show(config: config, view: secondView)
        SwiftMessages.show(config: config, view: thirdView)
        SwiftMessages.show(config: config, view: forthView)
    }

    // １枚目のメッセージビューの設定
    func setFirstView() {
        firstView.configureContent(title: nil, body: nil, iconImage: imgTutorial1, iconText: "いらっしゃいませ！", buttonImage: nil, buttonTitle: "つぎへ") { (button) in
            SwiftMessages.hide()
        }
        
        (firstView.backgroundView as? CornerRoundingView)?.cornerRadius = 4
        
        firstView.iconLabel?.font = UIFont(name: "HiraginoSans-W3", size: 18)
        
        firstView.iconImageView?.contentMode = .scaleAspectFit
        
        firstView.bodyLabel?.widthAnchor.constraint(equalToConstant: 248).isActive = true
        firstView.bodyLabel?.font = UIFont(name: "HiraginoSans-W3", size: 13)
        firstView.bodyLabel?.textAlignment = NSTextAlignment.left
        firstView.bodyLabel?.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        let attributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle,]
        let attributedText = NSAttributedString(
            string: "iettyから物件提案をお届けします。\n物件をタップすると、お部屋の詳細を見ることができます。",
            attributes: attributes as [NSAttributedString.Key : Any]
        )
        firstView.bodyLabel?.attributedText = attributedText
        
        firstView.button?.widthAnchor.constraint(equalToConstant: 248).isActive = true
        firstView.button?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        firstView.button?.titleLabel?.font = UIFont(name: "HiraginoSans-W6", size: 14)
        firstView.button?.backgroundColor = UIColor(red: 255/255, green: 152/255, blue: 0/255, alpha: 1)
        firstView.button?.setTitleColor(.white, for: .normal)
        firstView.button?.layer.cornerRadius = 4
    }
    
    // 2枚目のメッセージビューの設定
    func setSecondView() {
        secondView.configureContent(title: nil, body: "内見するボタンを押すと、お部屋の内見予約をすることができます。", iconImage: imgTutorial2, iconText: "物件を評価しよう！", buttonImage: nil, buttonTitle: "つぎへ") { (button) in
            SwiftMessages.hide()
        }
        
        secondView.iconLabel?.font = UIFont(name: "HiraginoSans-W3", size: 18)
        secondView.bodyLabel?.font = UIFont(name: "HiraginoSans-W3", size: 13)
        secondView.bodyLabel?.textAlignment = NSTextAlignment.left
        secondView.bodyLabel?.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    // 3枚目のメッセージビューの設定
    func setThirdView() {
        thirdView.configureContent(title: nil, body: "「お気に入り」ボタンを押すとお部屋について質問できます。", iconImage: imgTutorial3, iconText: "お部屋について質問しよう", buttonImage: nil, buttonTitle: "つぎへ") { (button) in
            SwiftMessages.hide()
        }
        
        thirdView.iconLabel?.font = UIFont(name: "HiraginoSans-W3", size: 18)
        thirdView.bodyLabel?.font = UIFont(name: "HiraginoSans-W3", size: 13)
        thirdView.bodyLabel?.textAlignment = NSTextAlignment.left
        thirdView.bodyLabel?.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    // 4枚目のメッセージビューの設定
    func setForthView() {
        forthView.configureContent(title: nil, body: "ご要望やご質問に不動産のプロがお答えします。\nお気軽にチャットで話しかけてください！", iconImage: imgTutorial4, iconText: "チャットで相談しよう", buttonImage: nil, buttonTitle: "はじめる") { (button) in
            SwiftMessages.hide()
        }
        
        forthView.iconLabel?.font = UIFont(name: "HiraginoSans-W3", size: 18)
        forthView.bodyLabel?.font = UIFont(name: "HiraginoSans-W3", size: 13)
        forthView.bodyLabel?.textAlignment = NSTextAlignment.left
        forthView.bodyLabel?.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    // 全てのメッセージビューに共通する設定
    func configure() {
        // メッセージが消えないようにする設定
        config.duration = .forever
        // メッセージが縦方向で見て中央に来るようにする設定
        config.presentationStyle = .center
    }
}

