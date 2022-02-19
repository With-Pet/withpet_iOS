//
//  MyPetCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/12.
//

import UIKit

class MyPetCell: UICollectionViewCell {
    
    //MARK: - Properties
    private let petImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 100 / 2
        $0.image = UIImage(named: "petImage")
    }
    
    private let petNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
        $0.text = "콩이"
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(petImageView)
        petImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(30)
            make.width.height.equalTo(100)
        }
        
        addSubview(petNameLabel)
        petNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(petImageView.snp.bottom).offset(10)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    func setupLayout() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 8
        layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
