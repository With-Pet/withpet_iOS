//
//  DetailFeedFooter.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/24.
//

import UIKit

class DetailFeedFooter: UICollectionReusableView {
    
    static let reuseIdentifier = "DetailFeedFooter"
    
    private var locationLabel = UILabel().then {
        $0.attributedText = Utilities().iconLabel(with: UIImage(named:"outline_place_black_36pt"), text: "논현 1동")
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private var petNameLabel = UILabel().then {
        $0.text = "콩이"
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    private var petInfoView = PetInfoView()
    
    private let serviceInfoLabel = UILabel().then {
        $0.text = "서비스 종류"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private let selectServiceInfoLabel = UILabel().then {
        $0.attributedText = Utilities().iconLabel(with: UIImage(named: "walk"), text: "산책")
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17)
    }
    
    private let servicesDetailLabel = UILabel().then {
        $0.text = "서비스 상세"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var selectServiceCollectionView:UICollectionView!
    
    private let dateLabel = UILabel().then {
        $0.text = "날짜"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private var startDateLabel = UILabel().then {
        $0.text = "02월 14일 AM 09:00"
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private var endDateLabel = UILabel().then {
        $0.text = "02월14일 PM 12:00"
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "보상/비용"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private let priceInputLabel = UILabel().then {
        $0.text = "10000원"
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let cautionLabel = UILabel().then {
        $0.text = "특이사항"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private let cautionInputLabel = UILabel().then {
        $0.text = "청력이 약해서 소리를 잘 듣지 못합니다. 큰 개를 무서워합니다."
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    
    private let requirementLabel = UILabel().then {
        $0.text = "요구사항"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private let requirementInputLabel = UILabel().then {
        $0.text = "가파른 산은 가급적 피해주시길 바랍니다."
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let guardinanLabel = UILabel().then {
        $0.text = "보호자"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 15)
    }
    private let guardianImageView = UIImageView(frame: .init(x: 0, y: 0, width: 60, height: 60)).then {
        $0.backgroundColor = .blue
        $0.image = UIImage(systemName: "xmark")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 60/2
        $0.layer.masksToBounds = true
    }

    private let guardianNameLabel = UILabel().then {
        $0.text = "홍길동"
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionViewConfigure()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        backgroundColor = .white
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        addSubview(line)
        line.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        }
        
        addSubview(petNameLabel)
        petNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
        }
        
        let section1 = UIView()
        section1.backgroundColor = .lightGray
        
        addSubview(section1)
        section1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(petNameLabel.snp.bottom).offset(15)
            make.height.equalTo(1)
        }
        
        addSubview(petInfoView)
        petInfoView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(section1.snp.bottom).offset(10)
            make.height.equalTo(160)
        }
        
        addSubview(serviceInfoLabel)
        serviceInfoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(petInfoView.snp.bottom).offset(15)
        }
        
        addSubview(selectServiceInfoLabel)
        selectServiceInfoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(serviceInfoLabel.snp.bottom).offset(8)
        }
        
        addSubview(servicesDetailLabel)
        servicesDetailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(selectServiceInfoLabel.snp.bottom).offset(15)
        }
        
        addSubview(selectServiceCollectionView)
        selectServiceCollectionView.snp.makeConstraints { make in
            make.top.equalTo(servicesDetailLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(45)
        }
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(selectServiceCollectionView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
        }
        
        addSubview(startDateLabel)
        startDateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(dateLabel.snp.bottom).offset(15)
        }
        
        let middleLine = UIView()
        middleLine.backgroundColor = .lightGray
        
        addSubview(middleLine)
        middleLine.snp.makeConstraints { make in
            make.left.equalTo(startDateLabel.snp.right).offset(15)
            make.width.equalTo(6)
            make.height.equalTo(2)
            make.centerY.equalTo(startDateLabel.snp.centerY)
        }
        
        addSubview(endDateLabel)
        endDateLabel.snp.makeConstraints { make in
            make.left.equalTo(middleLine.snp.right).offset(15)
            make.centerY.equalTo(startDateLabel.snp.centerY)
        }
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(endDateLabel.snp.bottom).offset(15)
        }
        
        addSubview(priceInputLabel)
        priceInputLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(priceLabel.snp.bottom).offset(15)
        }
        
        let section2 = UIView()
        section2.backgroundColor = .lightGray
        
        addSubview(section2)
        section2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(priceInputLabel.snp.bottom).offset(14)
        }
        
        addSubview(cautionLabel)
        cautionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(section2.snp.bottom).offset(15)
        }
        
        addSubview(cautionInputLabel)
        cautionInputLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(cautionLabel.snp.bottom).offset(15)
            
        }
        
        let section3 = UIView()
        section3.backgroundColor = .lightGray
        
        addSubview(section3)
        section3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(cautionInputLabel.snp.bottom).offset(14)
        }
        
        addSubview(requirementLabel)
        requirementLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(section3.snp.bottom).offset(15)
        }
        
        addSubview(requirementInputLabel)
        requirementInputLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(requirementLabel.snp.bottom).offset(15)
            
        }
        
        let section4 = UIView()
        section4.backgroundColor = .lightGray
        
        addSubview(section4)
        section4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(requirementInputLabel.snp.bottom).offset(14)
        }
        addSubview(guardinanLabel)
        guardinanLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(section4.snp.bottom).offset(14)
        }
        
        addSubview(guardianImageView)
        guardianImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(guardinanLabel.snp.bottom).offset(8)
        }
        
        addSubview(guardianNameLabel)
        guardianNameLabel.snp.makeConstraints { make in
            make.left.equalTo(guardianImageView.snp.right).offset(10)
            make.centerY.equalTo(guardianImageView.snp.centerY)
        }
        
        
    }
    
    func collectionViewConfigure(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        selectServiceCollectionView = UICollectionView(frame:.zero, collectionViewLayout: layout)
        selectServiceCollectionView.delegate = self
        selectServiceCollectionView.dataSource = self
        selectServiceCollectionView.register(ServiceCell.self, forCellWithReuseIdentifier: ServiceCell.reuseIdentifier)
        selectServiceCollectionView.backgroundColor = .white
        selectServiceCollectionView.isUserInteractionEnabled = false
    }
}

extension DetailFeedFooter : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCell.reuseIdentifier, for: indexPath) as! ServiceCell
        cell.isSelected = true
        cell.configure(name: "확인")
        cell.backgroundColor = .mainColor
        return cell
    }
}

extension DetailFeedFooter : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ServiceCell.fittingSize(availableHeight: 30, name: "확인")
    }
}
