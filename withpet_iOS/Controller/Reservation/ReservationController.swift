//
//  ReservationViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import Foundation
import UIKit

class ReservationController: UIViewController {
    
    private var collectionView: UICollectionView!
    
//    private let filterBar = ReservationFilterView()
    
    private var selectedFilter: ReservationFilterOptions = .apply {
        didSet { collectionView.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "예약 내역"
        
        configureCollectionView()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //MARK: - configure
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ReservationCell.self, forCellWithReuseIdentifier: ReservationCell.reuseIdentifier)
        collectionView.register(ReservationFilterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReservationFilterView.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ReservationController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let state = ReservationStateOption.init(rawValue: Int.random(in: 0...2))
        
        let vc = UINavigationController(rootViewController: ReservationDetailController(state: state!))
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false)
    }
}
extension ReservationController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReservationCell.reuseIdentifier, for: indexPath) as? ReservationCell else {
            print("error")
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReservationFilterView.reuseIdentifier, for: indexPath) as! ReservationFilterView
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
}

extension ReservationController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 60, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}
//MARK: - ProfileFilterViewDelegate
extension ReservationController: ReservationFilterViewDelegate {
    //tweet,tweet&replies,likes 상태바 터치 상태 변화.
    func filterView(_ view: ReservationFilterView, didSeletect index: Int) {
        guard let filter = ReservationFilterOptions(rawValue: index) else { return }
        selectedFilter = filter
    }
}
