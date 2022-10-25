//
//  ProductCollectionViewCell.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.



import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var favImageView: UIImageView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDesLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var cartCountView: UIView!
    @IBOutlet weak var discountView: UIView!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var addedCartView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    var delegate : ProductActionDelegate?
    
    private var favourite : Bool = false {
        didSet {
            if favourite == true {
                favImageView.image = UIImage.imageName(.favourited)
            } else {
                favImageView.image = UIImage.imageName(.unfavourite)
            }
        }
    }
    
    private var count = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        
        discountView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        cartCountView.isHidden = true
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.addtoCart(_:)))
        self.addToCartView.addGestureRecognizer(gesture)
    }
    
    @objc func addtoCart(_ sender:UITapGestureRecognizer){
        count = count + 1
        delegate?.plusClick(count: count, room: addToCartView.tag)
    }
    
    @IBAction func favClicked(sender: UIButton){
        favourite = !favourite
        delegate?.onTapFavourite(isFavourite: favourite, room: sender.tag)
    }
    
    func configCell(product: Product) {
        productNameLabel.text = product.title
        productPriceLabel.text = "$\(product.price ?? 0.0)"
        productImageView.kf.setImage(with: URL(string: product.image ?? ""))
        productDesLabel.text = product.category
        if product.promotion != nil {
            discountView.isHidden = false
            promotionLabel.text = "- \(product.promotion ?? "") %"
        }
        else {
            discountView.isHidden = true
        }
        favourite = product.favourite ?? false
        count = product.count ?? 0
        if count > 0 {
            countLabel.text = "\(count)"
            addedCartView.isHidden = false
            addToCartView.isHidden = true
        }
        else {
            addedCartView.isHidden = true
            addToCartView.isHidden = false
        }
        
    }
    
    @IBAction func plusClicked(sender: UIButton){
        count = count + 1
        delegate?.plusClick(count: count, room: sender.tag)
    }
    
    @IBAction func minusClicked(sender: UIButton){
//        if count > 1 {
//            count = count - 1
//            countLabel.text = "\(count)"
//        }
//        else {
//            addedCartView.isHidden = true
//            addToCartView.isHidden = false
//        }
        count = count - 1
        delegate?.plusClick(count: count, room: sender.tag)
        
    }
    
}
