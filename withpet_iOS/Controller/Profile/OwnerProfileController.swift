//
//  OwnerViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/03.
//

import UIKit
import MaterialComponents.MaterialChips
import MaterialComponents

private let reuseIdentfier = "chipCell"
class OwnerProfileController: UIViewController {
    
    //MARK: - HeaderContainer

    private lazy var headerContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(18)
        }
        
        $0.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalTo(profileImageView.snp.right).offset(20)
        }
        
        $0.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.left.equalTo(nameLabel.snp.right).offset(20)
        }
        
        $0.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        $0.addSubview(fieldLabel)
        fieldLabel.snp.makeConstraints { make in
            make.left.equalTo(countLabel.snp.right).offset(20)
            make.centerY.equalTo(countLabel.snp.centerY)
        }
        $0.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.bottom.equalToSuperview().offset(-25)
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
            make.width.height.equalTo(80)
        }
        $0.layer.cornerRadius = 80 / 2
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
    private let countLabel = UILabel().then {
        $0.text = "거래 16회"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    
    private let fieldLabel = UILabel().then {
        $0.text = "산책전문"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private let textField = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.font = UIFont.systemFont(ofSize: 18) // Set font color.
        $0.textColor = .darkText // Set left justified.
        $0.textAlignment = .left
        $0.isEditable = false
        $0.text = "간단한 자기소개를 적어주세요 :)"
    }
    
    //MARK: - ChipContrainerView
    
    private var chipsCollectionView : UICollectionView!
    
    private lazy var chipsContainerView = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(chipsNameLabel)
        chipsNameLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
        }
        
        $0.addSubview(chipsCollectionView)
        chipsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(chipsNameLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(250)
        }
        
        let chipsUnderline = UIView()
        chipsUnderline.backgroundColor = .lightGray
        
        $0.addSubview(chipsUnderline)
        chipsUnderline.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private let chipsNameLabel = UILabel().then{
        $0.text = "이용 가능 서비스"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    //MARK: - CertificationContrainerView
    
    private lazy var certificationContainerView = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(certiciationLabel)
        
        certiciationLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
        }
        
        $0.addSubview(addbutton)
        addbutton.snp.makeConstraints { make in
            make.top.equalTo(certiciationLabel.snp.top)
            make.right.equalToSuperview().offset(-16)
        }
        
        let certiciationView = CertificationView()
        $0.addSubview(certiciationView)
        
        certiciationView.snp.makeConstraints { make in
            make.top.equalTo(certiciationLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(120)
        }
    }
    
    private let certiciationLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.text = "자격 및 인증"
    }
    
    private let addbutton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        $0.tintColor = .black
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationbar()
        configureCollectionView()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Confiture
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerContainerView)
        headerContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(260)
        }
        
        view.addSubview(chipsContainerView)
        chipsContainerView.snp.makeConstraints { make in
            make.top.equalTo(headerContainerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(chipsCollectionView.snp.height)
        }
        view.addSubview(certificationContainerView)
        certificationContainerView.snp.makeConstraints { make in
            make.top.equalTo(chipsContainerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "프로필"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "outline_settings_black_24pt_1x"), style: .plain, target: self, action: #selector(didTapSetting))
    }
    
    func configureCollectionView() {
        let layout = MDCChipCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        
        chipsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        chipsCollectionView.backgroundColor = .white
        chipsCollectionView.delegate = self
        chipsCollectionView.dataSource = self

        chipsCollectionView.register(MDCChipCollectionViewCell.self,forCellWithReuseIdentifier: reuseIdentfier)
        
        chipsCollectionView.allowsMultipleSelection = true
        chipsCollectionView.reloadData()
    }
    
    //MARK: - selector
    @objc func handleDismissal(){
        dismiss(animated: true)
    }
    @objc func didTapSetting() {
        print("DEBUG : tapped setting button")
    }
    
    @objc func didTapAdd() {
        print("DEBUG : tapped add button")
        let vc = AddCertificationController()
        vc.delegate = self
        present(vc, animated: true, completion:nil)
    }
}


extension OwnerViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentfier, for: indexPath) as! MDCChipCollectionViewCell
        
        cell.chipView.titleLabel.text = "테스트용"
        cell.chipView.invalidateIntrinsicContentSize()
        cell.sizeToFit()
        cell.chipView.setTitleColor(.black, for: .selected)
        return cell
    }
}

extension OwnerViewController : AddCertificationControllerDelegate {
    func addCerticiation(CertificationName title: String, CertificationSource source: String, CertificationDate date: Date) {
        print("title : \(title)")
        print("source : \(source)")
        print("Date : \(date)")
    }
}
