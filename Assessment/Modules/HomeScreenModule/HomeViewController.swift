//
//  HomeViewController.swift
//  Assessment
//
//  Created by Hive Innovation on 23/10/2022.

import Foundation
import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    
    // MARK: Delegate initialization
    var presenter: HomeViewToPresenterProtocol?
    var interactor =  HomeInteractor()
    let disposeBag = DisposeBag()
    
    // MARK: Outlets
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    // MARK: Custom initializers go here
    var productResponse = [Product]()
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.getProducts()
    }
    
    // MARK: User Interaction - Actions & Targets
    
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        collectionViewSetup()
    }
    
    private func collectionViewSetup() {
        productCollectionView.collectionViewLayout = .productLayout
        productCollectionView.registerCell(type: ProductCollectionViewCell.self)
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
//    @objc func favouriteTap(_ sender:UIButton){
//        let tag = sender.tag
//        productResponse[tag].favourite = !(productResponse[tag].favourite ?? false)
//        DispatchQueue.main.async {
//            self.productCollectionView.reloadData()
////            let indexPath = IndexPath(row: tag, section: 0)
////            self.productCollectionView.reloadItems(at: [indexPath])
//        }
//    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productResponse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(withType: ProductCollectionViewCell.self, for: indexPath) as! ProductCollectionViewCell
        cell.favButton.tag = indexPath.row
        cell.plusButton.tag = indexPath.row
        cell.minusButton.tag = indexPath.row
        cell.addToCartView.tag = indexPath.row
        cell.delegate = self
        cell.configCell(product: productResponse[indexPath.row])

        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}


// MARK: - Presenter to View
extension HomeViewController: HomePresenterToViewProtocl {
    
    func initialControlSetup() {
        defaultSetup()
    }
    
    func getAllProduct(_ data: [Product]) {
        self.productResponse = data
        DispatchQueue.main.async {
            self.productCollectionView.reloadData()
        }
    }
    
}

extension HomeViewController: ProductActionDelegate {
    func plusClick(count: Int, room: Int) {
        self.productResponse[room].count = count
        reloadRow(row: room)
    }
    
    func minusClick(count: Int, room: Int) {
        self.productResponse[room].count = count
        reloadRow(row: room)
    }
    
    func onTapFavourite(isFavourite: Bool, room: Int) {
        self.productResponse[room].favourite = isFavourite
        reloadRow(row: room)
    }
    
    func reloadRow(row: Int){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: row, section: 0)
            self.productCollectionView.reloadItems(at: [indexPath])
        }
    }
}
