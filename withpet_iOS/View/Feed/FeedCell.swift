//
//  PostFeedCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FeedCell"
    
    private var isFollowed : Bool = false
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 8
        
        $0.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.width.equalTo(120)
        }
        
        $0.addSubview(positionLabel)
        positionLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalToSuperview().offset(15)
        }
        
        $0.addSubview(followButton)
        followButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.width.height.equalTo(20)
        }
        
        $0.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalTo(positionLabel.snp.bottom).offset(3)
        }
        
        $0.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        
        $0.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalTo(infoLabel.snp.bottom).offset(3)
        }
        
        $0.addSubview(serviceLabel)
        serviceLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
        }
        
        $0.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-9)
            make.bottom.equalToSuperview().offset(-7)
        }
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray

    }
    
    private let followButton = UIButton().then {
        $0.setImage(UIImage(named: "star"), for: .normal)
        $0.contentMode = .scaleToFill
        $0.backgroundColor = .white
        $0.tintColor = .orange
        $0.addTarget(self, action: #selector(handleFollowButton), for: .touchUpInside)
    }
    
    private let positionLabel = UILabel().then {
        $0.attributedText = Utilities().iconLabel(with: UIImage(named:"outline_place_black_36pt"), text: "논현1동")
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .lightGray
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 14)
        $0.numberOfLines = 0
        $0.text = "3시간 정도 산책 시켜주실 분~"
    }
 
    private let infoLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 10)
        $0.text = "강아지 - 콩이"
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12)
        $0.text = "02/14 AM 09:00 - 02/14 PM 12:00"
    }
    
    private let serviceLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12)
        $0.attributedText = Utilities().iconLabel(with: UIImage(named:"walk"), text: "산책")
    }
    
    private let priceLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 12)
        $0.text = "무료"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - selector
    @objc func handleFollowButton() {
        isFollowed.toggle()
    }
}
