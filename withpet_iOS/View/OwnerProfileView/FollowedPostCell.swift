//
//  FollowedPetCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/14.
//

import UIKit

class FollowedPostCell: UITableViewCell {

    private lazy var containerView = UIView()
    
    private lazy var innerView = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(petProfileImage)
        petProfileImage.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(125)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
        
        $0.addSubview(followButton)
        followButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        $0.addSubview(positionLabel)
        positionLabel.snp.makeConstraints { make in
            make.left.equalTo(petProfileImage.snp.right).offset(15)
            make.top.equalToSuperview().offset(20)
        }
        
        $0.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(petProfileImage.snp.right).offset(10)
            make.top.equalTo(positionLabel.snp.bottom).offset(5)
        }
        
        $0.addSubview(reservationDateLabel)
        reservationDateLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        let verticalLine = UIView()
        verticalLine.backgroundColor = .darkGray
        verticalLine.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(10)
        }
        
        $0.addSubview(animalLabel)
        animalLabel.snp.makeConstraints { make in
            make.left.equalTo(reservationDateLabel.snp.left)
            make.top.equalTo(reservationDateLabel.snp.bottom).offset(5)
        }
        
        $0.addSubview(verticalLine)
        verticalLine.snp.makeConstraints { make in
            make.centerY.equalTo(animalLabel.snp.centerY)
            make.left.equalTo(animalLabel.snp.right).offset(3)
        }
        
        $0.addSubview(serviceLabel)
        serviceLabel.snp.makeConstraints { make in
            make.left.equalTo(verticalLine.snp.right).offset(3)
            make.centerY.equalTo(animalLabel.snp.centerY)
        }
        
        $0.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(serviceLabel.snp.centerY)
            make.right.equalToSuperview().offset(-10)
        }
        
    }
    
    private let petProfileImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray
    }
    
    private let followButton = UIButton().then {
        $0.setImage(UIImage(systemName: "star.fill"), for: .normal)
        $0.tintColor = .orange
        $0.addTarget(self, action: #selector(handleFollow), for: .touchUpInside)
        $0.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
    }
    
    private let positionLabel = UILabel().then {
        let attributeText = Utilities().iconLabel(with: UIImage(named: "outline_place_black_36pt"), text: "논현 1동")
        $0.attributedText = attributeText
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 16)
    }

    private let titleLabel = UILabel().then {
        $0.text = "3시간정도 한강 공원 산책시켜주실 분 구해요"
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    private let reservationDateLabel = UILabel().then {
        $0.text = "02/14 09:00 - 02/14 12:00"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let animalLabel = UILabel().then {
        $0.text = "강아지"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let serviceLabel = UILabel().then {
        let attributeText = Utilities().iconLabel(with: UIImage(named: "walk"), text: "산책")
        $0.attributedText = attributeText
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "10000원/시간"
        $0.textColor = .red
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-8)
            make.right.equalToSuperview().offset(-20)
        }
        
        containerView.addSubview(innerView)
        innerView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupLayout() {
//        headerContainerView.clipsToBounds = true
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowRadius = 10
        innerView.layer.cornerRadius = 10
        innerView.clipsToBounds = true
    }
    
    @objc func handleFollow() {
        print("DEBUG : Did tap follow button")
    }
    
}
