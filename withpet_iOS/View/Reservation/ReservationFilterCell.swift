//
//  ReservationFilterCell.swift
//  withpet_iOS
//
//  Created by Doyun Park on 2022/03/08.
//

import UIKit

enum ReservationFilterOptions: Int,CaseIterable {
    case apply = 0
    case receive
    
    var description: String{
        switch self {
        case .apply: return "돌봄 신청 내역"
        case .receive : return "돌봄 받은 내역"
        }
    }
}

class ReservationFilterCell: UICollectionViewCell {
    
    //MARK: - Property
    static let reuseIdentifier = "ReservationFilterCell"
    
    var option : ReservationFilterOptions! {
        didSet{ titleLabel.text = option.description }
    }
    
    let titleLabel = UILabel().then{
        $0.textColor = .lightGray
        $0.text = "Test Filter"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .mainColor : .lightGray
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
