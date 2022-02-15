//
//  OwnerProfileHeader.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/07.
//

import UIKit
import MaterialComponents

protocol OwnerProfileHeaderDelegate: class {
    func didTapViewPosts()
}
private let reuseIdentfier = "chipCell"
class OwnerProfileHeader: UICollectionReusableView {

    //MARK: - Properties
    let services = ["병원","목욕","집 앞 픽업","미용","소독"]
    
    weak var delegate: OwnerProfileHeaderDelegate?
    
    private lazy var headerContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
        }
        
        $0.addSubview(positionLabel)
        positionLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        $0.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(positionLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        let walkStack = UIStackView(arrangedSubviews: [walkLabel,walkCountLabel])
        walkStack.axis = .vertical
        walkStack.spacing = 8
        walkStack.distribution = .fillProportionally
        
        let partition1 = UIView()
        partition1.backgroundColor = .lightGray
        
        let careStack = UIStackView(arrangedSubviews: [careLabel,careCountLabel])
        careStack.axis = .vertical
        careStack.spacing = 8
        careStack.distribution = .fillProportionally
        
        let partition2 = UIView()
        partition2.backgroundColor = .lightGray

        let exprienceStack = UIStackView(arrangedSubviews: [exprienceLabel,exprienceCountLabel])
        exprienceStack.axis = .vertical
        exprienceStack.spacing = 8
        exprienceStack.distribution = .fillProportionally
        
        $0.addSubview(careStack)
        careStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        $0.addSubview(partition1)
        partition1.snp.makeConstraints { make in
            make.centerY.equalTo(careStack.snp.centerY)
            make.right.equalTo(careStack.snp.left).offset(-25)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        $0.addSubview(walkStack)
        walkStack.snp.makeConstraints { make in
            make.centerY.equalTo(careStack)
            make.right.equalTo(careStack.snp.left).offset(-50)
        }
        
        $0.addSubview(partition2)
        partition2.snp.makeConstraints { make in
            make.centerY.equalTo(careStack.snp.centerY)
            make.left.equalTo(careStack.snp.right).offset(25)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
                                
        $0.addSubview(exprienceStack)
        exprienceStack.snp.makeConstraints { make in
            make.centerY.equalTo(careStack)
            make.left.equalTo(careStack.snp.right).offset(50)
        }

        $0.addSubview(viewPostButton)
        viewPostButton.snp.makeConstraints { make in
            make.top.equalTo(exprienceStack.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(60)
        }
        let ul1 = UIView()
        ul1.backgroundColor = .lightGray

        $0.addSubview(ul1)
        ul1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray
        $0.layer.borderWidth = 4
        $0.layer.borderColor = UIColor.white.cgColor
        $0.snp.makeConstraints { make in
            make.width.height.equalTo(120)
        }
        $0.layer.cornerRadius = 120 / 2
    }
    
    private let positionLabel = UILabel().then {
        $0.text = "논현 1동"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 18)
    }
    private let nameTextLabel = UILabel().then {
        $0.text = "홍길동"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 22)
    }
    private let walkLabel = UILabel().then{
        $0.text = "산책"
        $0.textColor = .darkText
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let walkCountLabel = UILabel().then{
        $0.text = "12건"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20)
    }
    
    private let careLabel = UILabel().then{
        $0.text = "돌봄"
        $0.textColor = .darkText
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let careCountLabel = UILabel().then{
        $0.text = "4건"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20)
    }
    
    private let exprienceLabel = UILabel().then{
        $0.text = "체험"
        $0.textColor = .darkText
        $0.font = .systemFont(ofSize: 18)
    }
    private let exprienceCountLabel = UILabel().then{
        $0.text = "0건"
        $0.textColor = .darkText
        $0.font = .systemFont(ofSize: 20)
    }
    private let nameLabel = UILabel().then{
        $0.text = "홍길동"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private let locationLabel = UILabel().then {
        $0.text = "서울시 강남구 논현동"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private let viewPostButton = UIButton().then {
        $0.backgroundColor = .mainColor
        $0.setTitle("게시물 모아보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(handleViewPosts), for: .touchUpInside)
    }
    private lazy var introContrainerView = UIView().then {
        
        $0.addSubview(introTitleLabel)
        introTitleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
        }
        
        $0.addSubview(introLabel)
        introLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-18)
            make.top.equalTo(introTitleLabel.snp.bottom).offset(16)
        }
        
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        $0.addSubview(line)
        line.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    private let introTitleLabel = UILabel().then {
        $0.text = "자기소개"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private let introLabel = UILabel().then {
        $0.text = "현재 6세 말티즈를 키우고 있으며, 자격증을 보유하고 있습니다."
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 20)
    }
    

    private lazy var chipContrainerView = UIView().then {
        $0.addSubview(chipsNameLabel)
        chipsNameLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
        }
        
        $0.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(chipsNameLabel.snp.bottom).offset(20)
            make.height.equalTo(100)
        }
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        $0.addSubview(line)
        line.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: MDCChipCollectionViewFlowLayout())
    
    private let chipsNameLabel = UILabel().then{
        $0.text = "이용 가능 서비스"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        
    }
    override init(frame:CGRect) {
        super.init(frame:.zero)
        backgroundColor = .white
        
        configureCollectionView()
        
        addSubview(headerContainerView)
        headerContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(400)
        }
        
        addSubview(introContrainerView)
        introContrainerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(headerContainerView.snp.bottom)
            
            let height = Utilities().heightForView(text: "현재 6세 말티즈를 키우고 있으며, 자격증을 보유하고 있습니다.", font: .systemFont(ofSize: 20), width: frame.width-36)
            
            make.height.equalTo(80 + height)
        }

        addSubview(chipContrainerView)
        chipContrainerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(introContrainerView.snp.bottom)
            make.height.equalTo(130)
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(chipContrainerView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
        }

    }
    
    private var titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "자격 및 교육"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
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
            
    @objc func handleViewPosts() {
        delegate?.didTapViewPosts()
    }
}

extension OwnerProfileHeader: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentfier, for: indexPath) as! MDCChipCollectionViewCell
        cell.chipView.titleLabel.text = services[indexPath.row]
        cell.chipView.invalidateIntrinsicContentSize() 
        cell.sizeToFit()
        cell.chipView.setBackgroundColor(.mainColor, for: .selected)
        cell.chipView.setTitleColor(.white, for: .selected)
        
        return cell
    }
}
