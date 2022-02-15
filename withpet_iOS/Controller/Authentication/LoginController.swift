//
//  LoginController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/06.
//

import UIKit

class LoginController: UIViewController {

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .red
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "WithPet"
        $0.font = .boldSystemFont(ofSize: 25)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let orLabel = UILabel().then {
        $0.text = "또는"
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.textColor = .lightGray
    }
    
    private let introduceLabel = UILabel().then {
        $0.numberOfLines = 0
        
        let attributedTitle = NSMutableAttributedString(string: "우리의 반려동물에게\n제공하는", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24)
                ,NSAttributedString.Key.foregroundColor : UIColor.black])
        
        attributedTitle.append(NSAttributedString(string: " 최고의\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24)
                   ,NSAttributedString.Key.foregroundColor : UIColor.blue]))
        
        attributedTitle.append(NSAttributedString(string: "맡김 서비스", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24)
                   ,NSAttributedString.Key.foregroundColor : UIColor.black]))
        
        $0.attributedText = attributedTitle
    }
    
    private let kakaoLoginButton = UIButton().then {
        $0.setImage(UIImage(named:"kakao_login_medium_wide"), for: .normal)
        $0.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    private let appleLoginButton = UIButton().then {
        $0.backgroundColor = .black
        $0.tintColor = .white
        $0.setTitle("Sign up with Apple", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 19)
        $0.setImage(UIImage(named:"Logo - SIWA - Left-aligned - White - Large"), for: .normal)
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(70)
            make.width.height.equalTo(70)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(10)
            make.centerY.equalTo(imageView.snp.centerY)
        }
        
        view.addSubview(introduceLabel)
        introduceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(45)
            make.top.equalTo(imageView.snp.bottom).offset(100)
        }
        
        view.addSubview(kakaoLoginButton)
        kakaoLoginButton.snp.makeConstraints { make in
            make.top.equalTo(introduceLabel.snp.bottom).offset(200)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(45)
        }
        
        let leftLine = UIView()
        leftLine.backgroundColor = .lightGray
        
        let rightLine = UIView()
        rightLine.backgroundColor = .lightGray
        
        view.addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(52)
        }
        
        view.addSubview(leftLine)
        leftLine.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(1)
            make.centerY.equalTo(orLabel)
            make.right.equalTo(orLabel.snp.left).offset(-45)
        }
        
        view.addSubview(rightLine)
        rightLine.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(1)
            make.centerY.equalTo(orLabel)
            make.left.equalTo(orLabel.snp.right).offset(45)
        }
        
        view.addSubview(appleLoginButton)
        appleLoginButton.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(52)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(45)
        }
    
        
    }
    
    @objc func handleLogin() {
        print("Did tap login")
    }

}
