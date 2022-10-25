//
//  ProfileViewController.swift
//  Assessment
//
//  Created Hive Innovation on 24/10/2022.
//  

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: Delegate initialization
    var presenter: ProfileViewToPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileBgView: UIView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
    }
    
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: User Interaction - Actions & Targets
    
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileBgView.layer.cornerRadius = profileBgView.frame.width / 2
        cameraButton.layer.cornerRadius = cameraButton.frame.width / 2
        collectionViewSetup()
    }
    
    private func collectionViewSetup() {
        profileCollectionView.collectionViewLayout = .categoryLayout
        profileCollectionView.registerCell(type: ProfileCollectionViewCell.self)
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(withType: ProfileCollectionViewCell.self, for: indexPath) as! ProfileCollectionViewCell
        cell.configCell(category: categoryList[indexPath.row])
        return cell
    }
    
}

extension ProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 8 {
            showAlert(with: sorryTitle, message: sorryMessage)
        }
    }
    
}

// MARK: - Extension
/**
 - Documentation for purpose of extension
 */
extension ProfileViewController {
    
}

// MARK: - Presenter to View
extension ProfileViewController: ProfilePresenterToViewProtocl {
    
    func initialControlSetup() {
        defaultSetup()
        self.profileCollectionView.reloadData()
    }
    
}
