//
//  Extension.swift
//  CodeTest
//
//  Created by Hive Innovation on 23/10/2022.
//

import UIKit

extension UIImage{
    
    static func imageName(_ name: ImageAssets) -> UIImage? {
        return UIImage(named: name.rawValue)
    }
}

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}

extension UICollectionViewLayout {
    
    static var productLayout: UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 16, height: UIScreen.main.bounds.width / 1.9)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = .zero
        return layout
    }
    
    static var categoryLayout: UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 4), height: UIScreen.main.bounds.width / 3.5)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = .zero
        return layout
    }
    
}

extension UICollectionView {
    
    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
}

extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

