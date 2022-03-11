//
//  ReservationFilterView.swift
//  withpet_iOS
//
//  Created by Doyun Park on 2022/03/08.
//

import UIKit

protocol ReservationFilterViewDelegate: class {
    func filterView(_ view: ReservationFilterView,didSeletect index: Int)
}

class ReservationFilterView: UICollectionReusableView {

    static let reuseIdentifier = "ReservationFilterView"
    weak var delegate: ReservationFilterViewDelegate?
    
    private var collectionView: UICollectionView!

    private let underlineView = UIView().then{
        $0.backgroundColor = .mainColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionView()
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        //초기에 indexPath(0,0)을 선택하도록 설정.
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .left)
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        print("DEBUG: did layout subviews")
        addSubview(underlineView)
        underlineView.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.width.equalTo(frame.width/2)
            make.height.equalTo(2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - configure
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.register(ReservationFilterCell.self, forCellWithReuseIdentifier: ReservationFilterCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDataSource
extension ReservationFilterView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ReservationFilterOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReservationFilterCell.reuseIdentifier, for: indexPath) as? ReservationFilterCell else {
            return UICollectionViewCell()
        }
        let option = ReservationFilterOptions(rawValue: indexPath.row)
        cell.option = option
        print(option)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension ReservationFilterView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let xPosition = cell?.frame.origin.x ?? 0
        
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = xPosition
        }
        delegate?.filterView(self, didSeletect: indexPath.row)
    }
}



//MARK: - UICollectionViewDelegateFlowLayout
extension ReservationFilterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count = CGFloat(ReservationFilterOptions.allCases.count)
        
        return CGSize(width: frame.width/count - 6, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

