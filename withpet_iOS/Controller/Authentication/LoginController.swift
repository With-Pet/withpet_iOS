//
//  LoginController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/06.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import NaverThirdPartyLogin
import GoogleSignIn

class LoginController: UIViewController {
    
    private let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    private let googleSignInConfig = GIDConfiguration.init(clientID: "516297221995-78bi44kk5tsa72u2t64ei6mi02m7cdh4.apps.googleusercontent.com")
    
    
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
        $0.setImage(UIImage(named:"kakao_login_large_narrow"), for: .normal)
        $0.addTarget(self, action: #selector(handleKakaoLogin), for: .touchUpInside)
        $0.contentMode = .scaleAspectFit
    }
    
    private let naverLoginButton = UIButton().then {
        
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 19)
        $0.setImage(UIImage(named:"btnG_완성형"), for: .normal)
        $0.layer.cornerRadius = 5
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(handleNaverLogin), for: .touchUpInside)
    }
    
    private let googleLoginButton = UIButton().then {
        $0.setImage(UIImage(named:"btn_google_dark_normal_ios"), for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor.hexStringToUIColor("#4285F4")
        $0.setTitle("Sign in with Google", for: .normal)
        $0.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
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
            make.width.equalTo(240)
            make.height.equalTo(50)
        }
        
        view.addSubview(naverLoginButton)
        naverLoginButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(50)
        }
        
        view.addSubview(googleLoginButton)
        googleLoginButton.snp.makeConstraints { make in
            make.top.equalTo(naverLoginButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(50)
        }
    }
    
    @objc func handleKakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            loginWithApp()
        } else {
            loginWithWeb()
        }
    }
    
    @objc func handleNaverLogin(){
        loginInstance?.delegate = self
        loginInstance?.requestThirdPartyLogin()
    }
    
    @objc func handleGoogleLogin(){
        GIDSignIn.sharedInstance.signIn(with: googleSignInConfig, presenting: self) { [weak self] user,error in
            guard error == nil else {
                return
            }
            print(user?.userID)
            self?.presentToMain()
            
        }
    }
    // 화면 전환 함수
    func presentToMain() {
        let nextVC = MainTapController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
}
//MARK: - KakaoLogin
extension LoginController {
    func loginWithApp(){
        UserApi.shared.loginWithKakaoTalk {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoTalk() success.")
                
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.presentToMain()
                    }
                }
            }
        }
    }
    
    func loginWithWeb() {
        UserApi.shared.loginWithKakaoAccount {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.presentToMain()
                    }
                }
            }
        }
    }
    
}

//MARK: - NaverLogin
extension LoginController : NaverThirdPartyLoginConnectionDelegate{
    
    //success loign
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("DEBUG : Success Naver Login")
    }
    
    // refreshtoken
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        
    }
    
    // logout -> delegate token
    func oauth20ConnectionDidFinishDeleteToken() {
        
    }
    
    // handle error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("DEBUG : \(error.localizedDescription)")
    }
    
    
}

//MARK: - Google Login
extension LoginController {
    
}
