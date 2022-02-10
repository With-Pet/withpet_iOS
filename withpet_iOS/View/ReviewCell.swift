//
//  ReviewsCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/05.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    private lazy var viewContainer = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(petImageView)
        petImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.width.height.equalTo(60)
        }
        
        let infoStack = UIStackView(arrangedSubviews: [nameLabel,dateLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 10
        infoStack.distribution = .fillEqually
        
        $0.addSubview(infoStack)
        infoStack.snp.makeConstraints { make in
            make.left.equalTo(petImageView.snp.right).offset(25)
            make.top.equalToSuperview().offset(25)
            make.height.equalTo(50)
        }
    
        let categoryStack = UIStackView(arrangedSubviews: [servicesMenuLabel,reservationDateLabel,priceLabel])
        categoryStack.axis = .vertical
        categoryStack.spacing = 10

        $0.addSubview(categoryStack)
        categoryStack.snp.makeConstraints { make in
            make.top.equalTo(petImageView.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(80)
        }

        let inputStack = UIStackView(arrangedSubviews: [inputMenuLabel,inputDateLabel,inputPriceLabel])
        inputStack.axis = .vertical
        inputStack.spacing = 10
        
        $0.addSubview(inputMenuLabel)
        inputMenuLabel.snp.makeConstraints { make in
            make.left.equalTo(categoryStack.snp.right).offset(20)
            make.top.equalTo(categoryStack.snp.top)
        }
        
        $0.addSubview(inputDateLabel)
        inputDateLabel.snp.makeConstraints { make in
            make.left.equalTo(categoryStack.snp.right).offset(20)
            make.top.equalTo(inputMenuLabel.snp.bottom).offset(10)
        }

        $0.addSubview(inputPriceLabel)
        inputPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(categoryStack.snp.right).offset(20)
            make.top.equalTo(inputDateLabel.snp.bottom).offset(10)
        }
        
        $0.addSubview(introduceLabel)
        introduceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(categoryStack.snp.bottom)
            make.height.equalTo(100)
        }

        let underline = UIView()
        underline.backgroundColor = .lightGray

        $0.addSubview(underline)
        underline.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private let petImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .white
        $0.layer.borderWidth = 4
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 60 / 2
        $0.image = UIImage(named: "petImage")
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "홍길동"
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "2021년 12월 3일"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    private let servicesMenuLabel = UILabel().then {
        $0.text = "서비스"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    private let reservationDateLabel = UILabel().then {
        $0.text = "예약 날짜"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "비용"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    private let inputMenuLabel = UILabel().then {
        $0.text = "돌봄"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    private let inputDateLabel = UILabel().then {
        $0.text = "2022년 1월 17일"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    private let inputPriceLabel = UILabel().then {
        $0.text = "10000원/시간"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    private let introduceLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.text = "저희 아이들이 너무 좋아해요 \n 처음 후기 남겨보는데 자주 애용하겠습니다. \n 너무 친절하셔요 :)"
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 18)
        $0.numberOfLines = 0
    }
    
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        addSubview(viewContainer)
        viewContainer.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.bottom.right.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
