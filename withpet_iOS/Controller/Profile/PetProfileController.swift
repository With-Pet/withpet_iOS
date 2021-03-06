//
//  PetController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/04.
//

import UIKit

class PetProfileController: UIViewController {
    
    //MARK: - Properties
    let nameList = ["이름","종류","품종","성별","몸무게","중성화"]
    
    private let petImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .white
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.black.cgColor
        $0.largeContentTitle = "펫 사진입니다!"
        $0.image = UIImage(named: "petImage")
    }
    
    private let nameInputLabel = UILabel().then {
        $0.text = "콩이"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(kindsLabel)
        kindsLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(20)
        }
        
        $0.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(kindsLabel.snp.centerY)
            make.left.equalTo(kindsLabel.snp.right).offset(110)
        }
        
        $0.addSubview(sexLabel)
        sexLabel.snp.makeConstraints { make in
            make.centerY.equalTo(detailLabel.snp.centerY)
            make.left.equalTo(detailLabel.snp.right).offset(110)
        }

        $0.addSubview(kindsInputLabel)
        kindsInputLabel.snp.makeConstraints { make in
            make.left.equalTo(kindsLabel.snp.left)
            make.top.equalTo(kindsLabel.snp.bottom).offset(20)
        }

        $0.addSubview(detailInputLabel)
        detailInputLabel.snp.makeConstraints { make in
            make.left.equalTo(detailLabel)
            make.top.equalTo(kindsInputLabel.snp.top)
        }
        
        $0.addSubview(sexInputLabel)
        sexInputLabel.snp.makeConstraints { make in
            make.left.equalTo(sexLabel.snp.left)
            make.top.equalTo(kindsInputLabel.snp.top)
        }

        $0.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(kindsInputLabel.snp.bottom).offset(30)
        }
        
        $0.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.left.equalTo(detailLabel.snp.left)
            make.top.equalTo(ageLabel.snp.top)
        }
        
        $0.addSubview(neuteringLabel)
        neuteringLabel.snp.makeConstraints { make in
            make.left.equalTo(sexLabel)
            make.top.equalTo(ageLabel.snp.top)
        }
        
        $0.addSubview(ageInputLabel)
        ageInputLabel.snp.makeConstraints { make in
            make.left.equalTo(kindsInputLabel.snp.left)
            make.top.equalTo(ageLabel.snp.bottom).offset(30)
        }
        
        $0.addSubview(weightInputLabel)
        weightInputLabel.snp.makeConstraints { make in
            make.left.equalTo(detailInputLabel.snp.left)
            make.top.equalTo(ageInputLabel.snp.top)
        }
        
        $0.addSubview(neuteringInputLabel)
        neuteringInputLabel.snp.makeConstraints { make in
            make.top.equalTo(weightInputLabel.snp.top)
            make.left.equalTo(sexInputLabel.snp.left)
        }
        let underLine = UIView()
        underLine.backgroundColor = .lightGray
        
        $0.addSubview(underLine)
        underLine.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }

    }
    
    private let kindsLabel = UILabel().then {
        $0.text = "종류"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let detailLabel = UILabel().then {
        $0.text = "품종"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let sexLabel = UILabel().then {
        $0.text = "성별"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let ageLabel = UILabel().then {
        $0.text = "나이"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let weightLabel = UILabel().then {
        $0.text = "몸무게"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let neuteringLabel = UILabel().then {
        $0.text = "중성화"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    
    private let kindsInputLabel = UILabel().then {
        $0.text = "강아지"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .lightGray
    }
    
    private let detailInputLabel = UILabel().then {
        $0.text = "말티즈"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .lightGray
    }
    
    private let sexInputLabel = UILabel().then {
        $0.text = "여성"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .lightGray
    }
    private let weightInputLabel = UILabel().then {
        $0.text = "2.8kg"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .lightGray
    }
    private let ageInputLabel =  UILabel().then {
        $0.text = "3살"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .lightGray
    }
    private let neuteringInputLabel = UILabel().then {
        $0.text = "O"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .lightGray
    }
    
    private let section2TitleLabel = UILabel().then {
        $0.text = "특이사항"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    private let introLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18) // Set font color.
        $0.textColor = .lightGray // Set left justified.
        $0.textAlignment = .left
        $0.text = "간단한 소개나 주의사항을 적어주세요 :)"
    }
    
    private var titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "체험 후기"
    }
    private let moreButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(didTapCompleted), for: .touchUpInside)
    }
    
    private lazy var ratingContainer = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
        }
        
        $0.addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(20)
            make.height.width.equalTo(20)
        }
        
        let ratingView = RatingView(frame: .zero)
        
        $0.addSubview(ratingView)
        ratingView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
    }
    
    //MARK: - Lifecycle
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
        
        view.addSubview(nameInputLabel)
        nameInputLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(petImageView.snp.bottom).offset(20)
        }
        let section1 = UIView()
        section1.backgroundColor = .lightGray
        
        view.addSubview(section1)
        section1.snp.makeConstraints { make in
            make.top.equalTo(nameInputLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(section1.snp.bottom)
            make.height.equalTo(210)
        }

        view.addSubview(section2TitleLabel)
        section2TitleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        view.addSubview(introLabel)
        introLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section2TitleLabel.snp.bottom).offset(20)
        }
        
        let underline = UIView()
        underline.backgroundColor = .lightGray
        
        view.addSubview(underline)
        underline.snp.makeConstraints { make in
            make.top.equalTo(introLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
        
        view.addSubview(ratingContainer)
        ratingContainer.snp.makeConstraints { make in
            make.top.equalTo(underline.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(220)
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
        navigationController?.popViewController(animated: false)
    }

    @objc func didTapCompleted(){
        
    }
}
