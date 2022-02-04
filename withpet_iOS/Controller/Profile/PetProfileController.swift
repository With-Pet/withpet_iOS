//
//  PetController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/04.
//

import UIKit

class PetProfileController: UIViewController {
    
    let nameList = ["이름","종류","품종","성별","몸무게","중성화"]
    
    private let petImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .white
        $0.layer.borderWidth = 4
        $0.layer.borderColor = UIColor.black.cgColor
        $0.largeContentTitle = "펫 사진입니다!"
        $0.layer.cornerRadius = 30 / 2
        $0.image = UIImage(named: "pet")
    }
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .white
        $0.addSubview(section1TitleLabel)
        
        section1TitleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(18)
        }
        
        let titleStack = UIStackView(arrangedSubviews: [nameLabel,kindsLabel,sexLabel,detailLabel,weightLabel,neuteringLabel])
        
        titleStack.axis = .vertical
        titleStack.spacing = 18
        titleStack.distribution = .fillEqually
        
        $0.addSubview(titleStack)
        titleStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section1TitleLabel.snp.bottom).offset(30)
//            make.height.equalTo(300)
        }

        let underLine = UIView()
        underLine.backgroundColor = .lightGray
        
        $0.addSubview(nameInputLabel)
        nameInputLabel.snp.makeConstraints { make in
            make.left.equalTo(titleStack.snp.right).offset(30)
            make.bottom.equalTo(nameLabel.snp.bottom)
        }
        
        $0.addSubview(kindsInputLabel)
        kindsInputLabel.snp.makeConstraints { make in
            make.left.equalTo(titleStack.snp.right).offset(30)
            make.bottom.equalTo(kindsLabel.snp.bottom)
        }
        
        $0.addSubview(sexInputLabel)
        sexInputLabel.snp.makeConstraints { make in
            make.left.equalTo(titleStack.snp.right).offset(30)
            make.bottom.equalTo(sexLabel.snp.bottom)
        }
        
        $0.addSubview(detailInputLabel)
        detailInputLabel.snp.makeConstraints { make in
            make.left.equalTo(titleStack.snp.right).offset(30)
            make.bottom.equalTo(detailLabel.snp.bottom)
        }
        
        $0.addSubview(weightInputLabel)
        weightInputLabel.snp.makeConstraints { make in
            make.left.equalTo(titleStack.snp.right).offset(30)
            make.bottom.equalTo(weightLabel.snp.bottom)
        }
        
        $0.addSubview(neuteringInputLabel)
        neuteringInputLabel.snp.makeConstraints { make in
            make.left.equalTo(titleStack.snp.right).offset(30)
            make.bottom.equalTo(neuteringLabel.snp.bottom)
        }
        
        
    }
    
    private let section1TitleLabel = UILabel().then {
        $0.text = "기본 정보"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let kindsLabel = UILabel().then {
        $0.text = "종류"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let detailLabel = UILabel().then {
        $0.text = "품종"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let sexLabel = UILabel().then {
        $0.text = "성별"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let weightLabel = UILabel().then {
        $0.text = "몸무게"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let neuteringLabel = UILabel().then {
        $0.text = "중성화"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let nameInputLabel = UILabel().then {
        $0.text = "콩이"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .darkText
    }
    
    private let kindsInputLabel = UILabel().then {
        $0.text = "강아지"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .darkText
    }
    
    private let detailInputLabel = UILabel().then {
        $0.text = "말티즈"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .darkText
    }
    
    private let sexInputLabel = UILabel().then {
        $0.text = "여성"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .darkText
    }
    private let weightInputLabel = UILabel().then {
        $0.text = "2.8kg"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .darkText
    }
    private let neuteringInputLabel = UILabel().then {
        $0.text = "O"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .darkText
    }
    
    private let section2TitleLabel = UILabel().then {
        $0.text = "특이사항 및 참고사항"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    private let textField = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.font = UIFont.systemFont(ofSize: 16) // Set font color.
        $0.textColor = .darkText // Set left justified.
        $0.textAlignment = .left
        $0.isEditable = false
        $0.text = "간단한 소개나 주의사항을 적어주세요 :)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationbar()

    }
    
    //MARK: - Configure
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(petImageView)
        
        petImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.height.equalTo(120)
        }
        petImageView.layer.cornerRadius = 120/2
        
        let section1 = UIView()
        section1.backgroundColor = .lightGray
        
        view.addSubview(section1)
        section1.snp.makeConstraints { make in
            make.top.equalTo(petImageView.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.height.equalTo(8)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(section1.snp.bottom)
            make.height.equalTo(330)
        }
        
        let section2 = UIView()
        section2.backgroundColor = .lightGray
        
        view.addSubview(section2)
        section2.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(8)
        }
        
        view.addSubview(section2TitleLabel)
        section2TitleLabel.snp.makeConstraints { make in
            make.top.equalTo(section2.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(section2TitleLabel.snp.bottom).offset(30)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.height.equalTo(140)
        }
        
        
    }
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "프로필"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
    }

    
    //MARK: - selector
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }


}
