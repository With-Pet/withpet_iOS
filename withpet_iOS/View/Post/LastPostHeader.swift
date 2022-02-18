//
//  LastPostHeaderView.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/18.
//

import UIKit

class LastPostHeader: UICollectionReusableView {
    //MARK: - Properties
    static let reuseIdentifier = "LastPostHeader"
    
    private let services = ["목욕","미용","소독"]
    
    private let progressBar = SteppedProgressBar(frame: .zero, index: 5)
    
    private var collectionView : UICollectionView!
    
    private let petNameLabel = UILabel().then {
        $0.text = "콩이"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private let locationLabel = UILabel().then {
        $0.text = "동네"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let locationInputLabel = UILabel().then {
        $0.text = "논현 1동"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let serviceLabel = UILabel().then {
        $0.text = "서비스 상세"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "예약 날짜"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let dateInputLabel = UILabel().then {
        $0.text = "2022년 2월 14일 AM 09:00 - 2022년 2월 14일 AM 12:00"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "보상/비용"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let priceInputLabel = UILabel().then {
        $0.text = "10000원"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let requirementLabel = UILabel().then {
        $0.text = "요청 사항"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let requirementInputLabel = UILabel().then {
        $0.text = "가파른 산은 가급적 피해주시길 바랍니다."
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let selectImageLabel = UILabel().then {
        $0.text = "선택된 사진 목록"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureCollectionView()
        addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-10)
            make.left.right.equalToSuperview()
            make.height.equalTo(130)
        }
        
        addSubview(petNameLabel)
        petNameLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
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
        
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section1.snp.bottom).offset(12)
        }
        
        addSubview(locationInputLabel)
        locationInputLabel.snp.makeConstraints { make in
            make.left.equalTo(locationLabel.snp.left)
            make.top.equalTo(locationLabel.snp.bottom).offset(12)
        }
        
        addSubview(serviceLabel)
        serviceLabel.snp.makeConstraints { make in
            make.left.equalTo(locationLabel)
            make.top.equalTo(locationInputLabel.snp.bottom).offset(12)
        }
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(serviceLabel.snp.bottom).offset(12)
            make.height.equalTo(40)
        }
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(serviceLabel.snp.left)
            make.top.equalTo(collectionView.snp.bottom).offset(12)
        }
        
        addSubview(dateInputLabel)
        dateInputLabel.snp.makeConstraints { make in
            make.left.equalTo(dateLabel.snp.left)
            make.top.equalTo(dateLabel.snp.bottom).offset(12)
        }
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(dateLabel.snp.left)
            make.top.equalTo(dateInputLabel.snp.bottom).offset(12)
        }
        
        addSubview(priceInputLabel)
        priceInputLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(priceLabel.snp.bottom).offset(12)
        }
        
        let section2 = UIView()
        section2.backgroundColor = .lightGray
        
        addSubview(section2)
        section2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(priceInputLabel.snp.bottom).offset(12)
            make.height.equalTo(1)
        }
        
        addSubview(requirementLabel)
        requirementLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section2.snp.bottom).offset(12)
        }
        
        addSubview(requirementInputLabel)
        requirementInputLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(requirementLabel.snp.bottom).offset(12)
        }
        
        let section3 = UIView()
        section3.backgroundColor = .lightGray
        
        addSubview(section3)
        section3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(requirementInputLabel.snp.bottom).offset(12)
            make.height.equalTo(1)
        }
        
        addSubview(selectImageLabel)
        selectImageLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(section3.snp.bottom).offset(12)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 5, left: 10, bottom: 5, right: 10)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        collectionView.allowsMultipleSelection = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ServiceCell.self,forCellWithReuseIdentifier: ServiceCell.reuseIdentifier)
        
    }
}

extension LastPostHeader : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCell.reuseIdentifier, for: indexPath) as! ServiceCell
        cell.configure(name: services[indexPath.item])
        cell.backgroundColor = .mainColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ServiceCell.fittingSize(availableHeight: 35, name: services[indexPath.item])
    }
}

