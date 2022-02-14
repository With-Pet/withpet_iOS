//
//  RegisterController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/11.
//

import UIKit

class RegisterController: UIViewController {

    //MARK: - Properties
    private let imagePicker = UIImagePickerController()
    private var profileImage : UIImage?
    
    private let plusPhotoButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        return button
        
    }()
    
    private let nicknameLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17)
    }
    
    private let nicknameTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.text = "닉네임"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 16)
        $0.clearButtonMode = .whileEditing
        $0.tintColor = .black
    }
    
    private let registerButton = UIButton().then {
        $0.backgroundColor = .mainColor
        $0.setTitle("등록하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        configureNavigationbar()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: nicknameTextField.frame.size.height-1, width: nicknameTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.black.cgColor
        
        nicknameTextField.layer.addSublayer(border)
    }
    
    //MARK: - configure
    func configureUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(128)
        }
        
        view.addSubview(nicknameLabel)
        nicknameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(35)
            make.top.equalTo(plusPhotoButton.snp.bottom).offset(43)
        }
        
        view.addSubview(nicknameTextField)
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel).offset(45)
            make.left.equalToSuperview().offset(35)
            make.right.equalToSuperview().offset(-35)
            make.height.equalTo(40)
        }
        
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(35)
            make.right.equalToSuperview().offset(-35)
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
    }

    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "회원 가입"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
    }
    //MARK: - selector
    @objc func handleAddProfilePhoto(){
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleRegister() {
        let mainController = MainTapController()
        mainController.modalPresentationStyle = .fullScreen
        present(mainController,animated: false)
    }

}

//MARK: - UIImagePickerControllerDelegate
extension RegisterController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        print(profileImage)
        self.profileImage = profileImage
        
        plusPhotoButton.layer.cornerRadius = 128 / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderWidth = 3
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true)
    }
    
}
