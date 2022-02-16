//
//  MyPetsController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/12.
//

import UIKit

private let reuseIdentifier = "MyPetCell"

class MyPetsController: UICollectionViewController {

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        configureNavigationbar()

        self.collectionView!.register(MyPetCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    //MARK: - Configure
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "프로필"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addPetProfile))
    }
    
    //MARK: - selector
    @objc func handleDismissal() {
        dismiss(animated: false)
    }
    @objc func addPetProfile() {
        let vc = EditPetProfileController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyPetsController {
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyPetCell
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PetProfileController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension MyPetsController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 30, right: 20)
    }
}
