//
//  MyPetCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/12.
//

import UIKit

class MyPetCell: UICollectionViewCell {
    
    private let petImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .white
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 80 / 2
        $0.image = UIImage(named: "petImage")
    }
    
    private let petNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "콩이"
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(petImageView)
        petImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(30)
            make.width.height.equalTo(80)
        }
        
        addSubview(petNameLabel)
        petNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(petImageView.snp.bottom).offset(15)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    func setupLayout() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 8
        layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
