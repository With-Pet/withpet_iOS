//
//  EditOwnerProfileHeader.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/10.
//

import UIKit
import MaterialComponents.MaterialChips

protocol EditOwnerProfileHeaderDelegate : class {
    func didTapChangeProfilePhoto()
    func handleAddCetification()
}

private let reuseIdentfier = "ChipCell"
class EditOwnerProfileHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    let services = ["병원","목욕","픽업","미용","소독"]
    
    weak var delegate : EditOwnerProfileHeaderDelegate?
    
    var selectedImage: UIImage? {
        didSet {
            editImageButton.setImage(selectedImage, for: .normal)
        }
    }
    
    private let editImageButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .white
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 120 / 2
        $0.setImage(UIImage(named: "petImage"), for: .normal)
        $0.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
    }
    
    private lazy var headerContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.addSubview(editImageButton)
        
        editImageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.width.height.equalTo(120)
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
            make.top.equalTo(editImageButton.snp.bottom).offset(20)
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
        
        let ul1 = UIView()
        ul1.backgroundColor = .lightGray
        
        $0.addSubview(ul1)
        ul1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(exprienceStack.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
        
        
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
    private let countLabel = UILabel().then {
        $0.text = "거래 16회"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    //MARK: - NicknameContainerView
    private lazy var nicknameContainerView = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(nicknameLabel)
        nicknameLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
        }
        
        $0.addSubview(nicknameTextField)
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
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
    
    private let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let nicknameTextField = UITextField().then {
        $0.text = "홍길동"
        $0.backgroundColor = .white
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 18)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.layer.cornerRadius = 4
    }
    
    private lazy var locationContainerView = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        $0.addSubview(setLocationLabel)
        setLocationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
        }
        
        $0.addSubview(setLocationButton)
        setLocationButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(setLocationLabel.snp.trailing).offset(5)
            make.width.height.equalTo(15)
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
    
    private let locationLabel = UILabel().then {
        $0.text = "동네"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let setLocationLabel = UILabel().then {
        $0.text = "논현 1동"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .lightGray
    }
    
    private let setLocationButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.addTarget(self, action: #selector(handleSetLocation), for: .touchUpInside)
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .black
    }
    
    private lazy var introContrainerView = UIView().then {
        $0.backgroundColor = .white
        $0.addSubview(introTitleLabel)
        introTitleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
        }
        
        $0.addSubview(introTextView)
        introTextView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-18)
            make.top.equalTo(introTitleLabel.snp.bottom).offset(16)
            make.height.equalTo(180)
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
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let introTextView = UITextView().then {
        $0.text = "현재 6세 말티즈를 키우고 있으며, 자격증을 보유하고 있습니다."
        $0.backgroundColor = .white
        $0.textColor = .lightGray
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 18)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private lazy var chipContrainerView = UIView().then {
        $0.backgroundColor = .white
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
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    private var titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
        $0.text = "자격 및 교육"
    }
    
    private let addButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.addTarget(self, action: #selector(handleAddCeritification), for: .touchUpInside)
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .black
    }
    
    //MARK: - Lifecycle
    override init(frame: CGRect){
        super.init(frame: frame)
        configureCollectionView()
        backgroundColor = .white
        
        addSubview(headerContainerView)
        headerContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(230)
        }
        
        addSubview(nicknameContainerView)
        nicknameContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerContainerView.snp.bottom)
            make.height.equalTo(130)
        }
        
        addSubview(locationContainerView)
        locationContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(nicknameContainerView.snp.bottom)
            make.height.equalTo(80)
        }
        
        addSubview(introContrainerView)
        introContrainerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(locationContainerView.snp.bottom)
            make.height.equalTo(260)
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
        
        addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - selector
    @objc func handleAddProfilePhoto() {
        delegate?.didTapChangeProfilePhoto()
    }
    @objc func handleSetLocation(){
        
    }
    @objc func handleAddCeritification(){
        print("DEBUG : did tap handleAddCeitification")
        delegate?.handleAddCetification()
    }
    
    //MARK: - Configure
    func configureCollectionView(){
        let layout = MDCChipCollectionViewFlowLayout()
        layout.sectionInset = .init(top: 5, left: 16, bottom: 5, right: 16)
        //
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        collectionView.register(MDCChipCollectionViewCell.self,forCellWithReuseIdentifier: reuseIdentfier)
    }
}


extension EditOwnerProfileHeader : UICollectionViewDelegate,UICollectionViewDataSource {
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


