//
//  ProfileCollectionViewCell.swift
//  Assessment
//
//  Created by Hive Innovation on 24/10/2022.
//

import Foundation
import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconBgView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        iconBgView.layer.cornerRadius = iconBgView.frame.width / 2
        
        
    }
    
    func configCell(category: Category) {
        titleLabel.text = category.title
        iconImageView.image = UIImage(named: category.icon ?? "")
    }
    
}
