//
//  FollowedCareCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/14.
//

import UIKit
import MaterialComponents

private let reuseIdentfier = "ChipCell"

class FollowedCareCell: UITableViewCell {

    private let list = ["목욕","집앞 픽업","미용","소독","마당 보유"]
    
    private lazy var headerContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(20)
        }
        
        $0.addSubview(positionLabel)
        positionLabel.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(20)
            make.top.equalTo(profileImageView.snp.top).offset(10)
        }
        
        $0.addSubview(nameTextLabel)
        nameTextLabel.snp.makeConstraints { make in
            make.left.equalTo(positionLabel.snp.left)
            make.top.equalTo(positionLabel.snp.bottom).offset(15)
        }
        
        let ul1 = UIView()
        ul1.backgroundColor = .lightGray

        $0.addSubview(ul1)
        ul1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
            make.height.equalTo(1)
        }
        $0.addSubview(chipsNameLabel)
        chipsNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(ul1.snp.bottom).offset(16)
        }
        
        $0.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(chipsNameLabel.snp.bottom).offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray
        $0.layer.borderWidth = 4
        $0.layer.borderColor = UIColor.white.cgColor
        $0.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        $0.layer.cornerRadius = 80 / 2
    }
    
    private let positionLabel = UILabel().then {
        $0.text = "논현 1동"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let nameTextLabel = UILabel().then {
        $0.text = "홍길동"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let chipsNameLabel = UILabel().then{
        $0.text = "이용 가능 서비스"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    private var collectionView = UICollectionView(frame: .zero,collectionViewLayout: MDCChipCollectionViewFlowLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        configureCollectionView()
        
        addSubview(headerContainerView)
        headerContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-5)
            make.right.equalToSuperview().offset(-20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }

    func configureCollectionView(){
        let layout = MDCChipCollectionViewFlowLayout()
        layout.sectionInset = .init(top: 5, left: 16, bottom: 5, right: 16)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MDCChipCollectionViewCell.self,forCellWithReuseIdentifier: reuseIdentfier)
    }
    
    func setupLayout() {
        headerContainerView.layer.shadowColor = UIColor.black.cgColor
        headerContainerView.layer.shadowOpacity = 0.1
        headerContainerView.layer.shadowRadius = 8
        headerContainerView.layer.cornerRadius = 10
    }
}

extension FollowedCareCell : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentfier, for: indexPath) as! MDCChipCollectionViewCell
        cell.chipView.titleLabel.text = list[indexPath.row]
        cell.chipView.invalidateIntrinsicContentSize()
        cell.sizeToFit()
        cell.chipView.setBackgroundColor(.mainColor, for: .selected)
        cell.chipView.setTitleColor(.white, for: .selected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
}
