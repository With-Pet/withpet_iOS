//
//  AddCertificationViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/04.
//

import UIKit

protocol AddCertificationControllerDelegate: class {
    func addCerticiation(CertificationName title:String,CertificationSource source: String,CertificationDate date:Date)
}

class AddCertificationController: UIViewController {
    //MARK: - Properties
    weak var delegate : AddCertificationControllerDelegate?
    private let imagePicker = UIImagePickerController()
    private var certificationImage: UIImage?
    private let datePicker = UIDatePicker()
    
    private let plusPhotoButton = UIButton(type: .system).then{
        $0.backgroundColor = .lightGray
        $0.setImage(UIImage(systemName: "camera"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
    }
    
    private lazy var nameInputContainter = UIView().then{
        $0.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
        
        let label = Utilities().makeLabel(with: "자격증 이름",font: 20)
        $0.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().offset(8)
        }
        
        let tf = Utilities().textField(withPlaceholder: "자격증")
        $0.addSubview(tf)
        tf.snp.makeConstraints { make in
            make.left.equalTo(label.snp.right).offset(8)
            make.centerY.equalTo(label.snp.centerY)
            make.right.equalToSuperview()
        }
        
        let dividerView = UIView()
        dividerView.backgroundColor = .lightGray
        $0.addSubview(dividerView)
        
        dividerView.snp.makeConstraints { make in
            make.right.left.equalTo(tf)
            make.bottom.equalTo(label.snp.bottom).offset(2)
            make.height.equalTo(0.75)
        }
        
    }
    
    private lazy var sourceInputContainter = UIView().then {
        
        $0.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
        
        let label = Utilities().makeLabel(with: "발행 기관", font: 20)
        $0.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().offset(8)
        }
        
        let tf = Utilities().textField(withPlaceholder: "발행 기관")
        $0.addSubview(tf)
        tf.snp.makeConstraints { make in
            make.left.equalTo(label.snp.right).offset(23)
            make.centerY.equalTo(label.snp.centerY)
            make.right.equalToSuperview()
        }
        
        let dividerView = UIView()
        dividerView.backgroundColor = .lightGray
        $0.addSubview(dividerView)
        
        dividerView.snp.makeConstraints { make in
            make.right.left.equalTo(tf)
            make.bottom.equalTo(label.snp.bottom).offset(2)
            make.height.equalTo(0.75)
        }
    }
    
    private lazy var dateInputContainer = UIView().then {
        $0.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
        let label = Utilities().makeLabel(with: "발행 일시",font:20)
        $0.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().offset(8)
        }
        $0.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.left.equalTo(label.snp.right).offset(21)
            make.centerY.equalTo(label.snp.centerY)
        }
        
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .mainColor
        $0.addTarget(self, action: #selector(didTapCompleted), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(plusPhotoButton)
        
        plusPhotoButton.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(160)
        }
        
        plusPhotoButton.layer.cornerRadius = 10
        
        let stack = UIStackView(arrangedSubviews: [nameInputContainter,sourceInputContainter,dateInputContainer])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.top.equalTo(plusPhotoButton.snp.bottom)
        }
        
        view.addSubview(completeButton)
        completeButton.snp.makeConstraints { make in
            make.left.equalTo(65)
            make.right.equalTo(-65)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    //MARK: - Lifecycle
    func configure() {
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
    }
    
    //MARK: - Selector
    @objc func handleAddProfilePhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleDatePicker() {
        print(datePicker.date)
    }
    
    @objc func didTapCompleted() {
        delegate?.addCerticiation(CertificationName: "자격증 이름", CertificationSource: "정부 기관", CertificationDate: Date())
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - UIImagePickerControllerDelegate
extension AddCertificationController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let certificationImage = info[.editedImage] as? UIImage else { return }
        self.certificationImage = certificationImage
        
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderWidth = 3
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.setImage(certificationImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //        dismiss(animated: true)
    }
    
}

