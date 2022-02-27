//
//  FilterViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/02.
//

import Foundation
import UIKit

class FilterController : UIViewController {
    
    //MARK: - Properties
    private var datePicker = UIDatePicker()
    
    private let nameLabel = UILabel().then {
        $0.text = "서비스 종류"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private let servicesSegment = UISegmentedControl(items: ["전체","산책","돌봄","체험"]).then {
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
        $0.selectedSegmentTintColor = .mainColor
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .white
        $0.tintColor = .red
        $0.addTarget(self, action: #selector(servicesSelect), for: .valueChanged)
    }
    
    private let petLabel = UILabel().then {
        $0.text = "반려동물 종류"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private let petSegment = UISegmentedControl(items: ["전체","강아지","고양이","기타"]).then {
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.layer.borderWidth = 1
        $0.selectedSegmentTintColor = .mainColor
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .white
        $0.tintColor = .red
        $0.addTarget(self, action: #selector(servicesSelect), for: .valueChanged)
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "날짜"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private lazy var startDateTextField = UITextField().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.textColor = .darkGray
        $0.addLeftPadding(image: UIImage(named: "event"))
        $0.tintColor = .mainColor
        $0.inputView = datePicker
        $0.font = .systemFont(ofSize: 12)
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancel = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: #selector(didTapCancel))
        let barButton = UIBarButtonItem(title: "확인", style: .done, target: target, action: #selector(didTapDone))
        
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        
        $0.inputAccessoryView = toolBar
    }
    
    private lazy var endDateTextField = UITextField().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.textColor = .darkGray
        $0.addLeftPadding(image: UIImage(named: "event"))
        $0.tintColor = .mainColor
        $0.inputView = datePicker
        $0.font = .systemFont(ofSize: 14)
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancel = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: #selector(didTapCancel))
        let barButton = UIBarButtonItem(title: "확인", style: .done, target: target, action: #selector(didTapDone))
        
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        
        $0.inputAccessoryView = toolBar
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "날짜"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private let resetButton = UIButton().then {
        $0.setTitle("초기화", for: .normal)
        $0.setTitleColor(.mainColor, for: .normal)
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
    }
    
    private let registerButton = UIButton().then {
        $0.setTitle("적용 하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.backgroundColor = .mainColor
        $0.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureDatePicker()
        configureUI()
    }
    
    //MARK: - Configure
    func configureUI() {
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        view.addSubview(servicesSegment)
        servicesSegment.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(nameLabel.snp.bottom).offset(35)
            make.height.equalTo(50)
        }
        
        let section1 = UIView()
        section1.backgroundColor = .lightGray
        
        view.addSubview(section1)
        section1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(servicesSegment.snp.bottom).offset(35)
        }
        
        view.addSubview(petLabel)
        petLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section1.snp.bottom).offset(20)
        }
        
        view.addSubview(petSegment)
        petSegment.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(petLabel.snp.bottom).offset(35)
            make.height.equalTo(50)
        }
        
        let section2 = UIView()
        section2.backgroundColor = .lightGray
        
        view.addSubview(section2)
        section2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(petSegment.snp.bottom).offset(35)
        }
        
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(section2.snp.bottom).offset(20)
        }
        
        view.addSubview(startDateTextField)
        startDateTextField.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
        
        let middleLine = UIView()
        middleLine.backgroundColor = .lightGray
        
        view.addSubview(middleLine)
        middleLine.snp.makeConstraints { make in
            make.centerY.equalTo(startDateTextField.snp.centerY)
            make.width.equalTo(12)
            make.height.equalTo(1)
            make.left.equalTo(startDateTextField.snp.right).offset(14)
        }
        
        view.addSubview(endDateTextField)
        endDateTextField.snp.makeConstraints { make in
            make.centerY.equalTo(startDateTextField.snp.centerY)
            make.left.equalTo(middleLine.snp.right).offset(14)
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
        
        let section3 = UIView()
        section3.backgroundColor = .lightGray
        
        view.addSubview(section3)
        section3.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(endDateTextField.snp.bottom).offset(35)
        }
        
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(section3).offset(35)
            make.left.equalToSuperview().offset(20)
        }
        
        let section4 = UIView()
        section4.backgroundColor = .lightGray
        
        view.addSubview(section4)
        section4.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(priceLabel.snp.bottom).offset(90)
        }
        
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(section4).offset(25)
            make.width.equalTo(72)
            make.height.equalTo(44)
        }
        
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.left.equalTo(resetButton.snp.right).offset(14)
            make.top.equalTo(section4).offset(25)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(44)
        }
    }
    
    func configureDatePicker() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
    }
    //MARK: - selector
    @objc func servicesSelect() {
        
    }
    
    @objc func didTapCancel() {
        if startDateTextField.isFirstResponder {
            startDateTextField.resignFirstResponder()
        }
        if endDateTextField.isFirstResponder {
            endDateTextField.resignFirstResponder()
        }
    }
    
    @objc func didTapDone() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd a hh:mm"
        if startDateTextField.isFirstResponder {
            startDateTextField.resignFirstResponder()
            let date = dateFormatter.string(from: datePicker.date)
            startDateTextField.text = date
        }
        
        if endDateTextField.isFirstResponder {
            endDateTextField.resignFirstResponder()
            let date = dateFormatter.string(from: datePicker.date)
            endDateTextField.text = date
        }
        
    }
    
    @objc func handleReset(){
        servicesSegment.selectedSegmentIndex = 0
        petSegment.selectedSegmentIndex = 0
        startDateTextField.text = ""
        endDateTextField.text = ""
    }
    
    @objc func handleRegister() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
