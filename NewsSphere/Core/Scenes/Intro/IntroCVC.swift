//
//  IntroCVC.swift
//  Emoji_Merge_IOS
//
//  Created by Tran Nghia Pro on 23/7/24.
//

import UIKit
import MarqueeLabel

class IntroCVC: UICollectionViewCell {

    @IBOutlet weak var bgIntro: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var asplectRatio: NSLayoutConstraint!
    
    @IBOutlet weak var stackView: UIStackView!
    private var blackColor: UIColor = UIColor(hex: "212121")
    private let whiteColor: UIColor = UIColor(hex: "E0E0E0")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configStackView()
    }
    
    func configStackView() {
        for view in stackView.arrangedSubviews {
            view.setCornerRadius(2)
        }
    }
    
    func setupCurrent(at index: Int) {
        var i = 0
        for view in stackView.arrangedSubviews {
            if index == i {
                view.backgroundColor = blackColor
            } else {
                view.backgroundColor = whiteColor
            }
            i += 1
        }
    }
}
