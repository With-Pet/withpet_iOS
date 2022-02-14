//
//  MypetProfileController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/06.
//

import UIKit

class EditPetProfileController: UIViewController {
    
    //MARK: - Properties
    private let imagePicker = UIImagePickerController()
    private let kindsPickerView = UIPickerView()
    private let sexPickerView = UIPickerView()
    private let neuteringPickerView = UIPickerView()
    private let datePicker = UIDatePicker()
    
    private let kindsList = ["강아지","고양이","나머지"]
    private let sexList = ["남성","여성"]
    private let neuteringList = ["O","X"]
    
    private var selectedImage: UIImage? {
        didSet{
            editImageButton.setImage(selectedImage, for: .normal)
        }
    }
    
    private lazy var contentView = UIView().then {
        $0.backgroundColor = .white
        $0.addSubview(editImageButton)
        
        editImageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.width.height.equalTo(120)
        }
        
        let underline = UIView()
        underline.backgroundColor = .lightGray
        
        $0.addSubview(underline)
        underline.snp.makeConstraints { make in
            make.top.equalTo(editImageButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
        
        $0.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(underline).offset(20)
            make.leading.equalTo(underline).offset(25)
        }
        
        $0.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(360)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        $0.addSubview(kindsLabel)
        kindsLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
        }
        
        $0.addSubview(kindsTextField)
        kindsTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(150)
            make.top.equalTo(kindsLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        $0.addSubview(sexLabel)
        sexLabel.snp.makeConstraints { make in
            make.leading.equalTo(kindsLabel).offset(200)
            make.top.equalTo(kindsLabel.snp.top)
        }
        
        $0.addSubview(sexTextField)
        sexTextField.snp.makeConstraints { make in
            make.leading.equalTo(sexLabel.snp.leading)
            make.top.equalTo(kindsTextField.snp.top)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        $0.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(kindsTextField.snp.bottom).offset(20)
        }
        
        $0.addSubview(detailTextField)
        detailTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(360)
            make.top.equalTo(detailLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        $0.addSubview(birthLabel)
        birthLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(detailTextField.snp.bottom).offset(20)
        }
        
        $0.addSubview(birthTextField)
        birthTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(360)
            make.top.equalTo(birthLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        $0.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(birthTextField.snp.bottom).offset(20)
        }
        
        $0.addSubview(weightTextField)
        weightTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(150)
            make.top.equalTo(weightLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        $0.addSubview(neuteringLabel)
        neuteringLabel.snp.makeConstraints { make in
            make.leading.equalTo(sexLabel.snp.leading)
            make.top.equalTo(birthTextField.snp.bottom).offset(20)
        }
        
        $0.addSubview(neuteringTextField)
        neuteringTextField.snp.makeConstraints { make in
            make.leading.equalTo(neuteringLabel.snp.leading)
            make.top.equalTo(weightTextField.snp.top)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        let underline1 = UIView()
        underline1.backgroundColor = .lightGray
        
        $0.addSubview(underline1)
        underline1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(neuteringTextField.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
        
        $0.addSubview(precautionLabel)
        precautionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.top.equalTo(underline1.snp.bottom).offset(20)
        }
        
        $0.addSubview(precautionTextField)
        precautionTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(precautionLabel.snp.bottom).offset(20)
            make.height.equalTo(200)
        }
    }
    private lazy var scrollView = UIScrollView().then {
        $0.isScrollEnabled = true
        $0.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1100)
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
        $0.addTarget(self, action: #selector(handdleEditImage), for: .touchUpInside)
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textColor = .black
    }
    
    private let nameTextField = Utilities().layerTextField(text: "콩이", inputView: nil)
    
    private let kindsLabel = UILabel().then {
        $0.text = "종류"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private lazy var kindsTextField = Utilities().layerTextField(text: "강아지", inputView: kindsPickerView)
    
    private let sexLabel = UILabel().then {
        $0.text = "성별"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private lazy var sexTextField = Utilities().layerTextField(text: "남성", inputView: sexPickerView)
    
    private let detailLabel = UILabel().then {
        $0.text = "품종"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private lazy var detailTextField = Utilities().layerTextField(text: "말티즈", inputView: nil)
    
    private let birthLabel = UILabel().then {
        $0.text = "생일"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private lazy var birthTextField = Utilities().layerTextField(text: "2021년 1월 3일", inputView: datePicker)
    
    private let weightLabel = UILabel().then {
        $0.text = "몸무게"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private lazy var weightTextField = Utilities().layerTextField(text: "2.8kg", inputView: nil)
    
    private let neuteringLabel = UILabel().then {
        $0.text = "중성화"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private lazy var neuteringTextField = Utilities().layerTextField(text: "O", inputView: neuteringPickerView)
    
    private let precautionLabel = UILabel().then {
        $0.text = "특이사항"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    private let precautionTextField = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.font = UIFont.systemFont(ofSize: 16) // Set font color.
        $0.textColor = .darkText // Set left justified.
        $0.textAlignment = .left
        $0.isEditable = true
        $0.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        $0.text = "간단한 소개나 주의사항을 적어주세요 :)"
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurePickerView()
        configureTextField()
        configureUI()
        configureNavigationbar()
        configureImagePicker()
        
    }
    //MARK: - Configure
    func configureUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "프로필"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "outline_done_black_36pt"), style: .done, target: self, action: #selector(handleDone))
    }
    func configurePickerView() {
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        
        kindsPickerView.delegate = self
        kindsPickerView.dataSource = self
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        neuteringPickerView.delegate = self
        neuteringPickerView.dataSource = self
    }
    
    func configureImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func createToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        
        let doneBT = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didTapDonePicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBT = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapDonePicker))
        // 만든 아이템들을 세팅해주고
        toolBar.setItems([cancelBT,flexibleSpace,doneBT], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
        
    }
    
    func configureTextField() {
        detailTextField.delegate = self
        birthTextField.delegate = self
        neuteringTextField.delegate = self
        weightTextField.delegate = self
        precautionTextField.delegate = self
//        kindsTextField.inputAccessoryView = createToolbar()
    }
    //MARK: - selector
    @objc func handleDismissal(){
        navigationController?.popViewController(animated: true)
    }
    @objc func handleDone() {
        print("DEBUG : handle done button")
    }
    @objc func handdleEditImage() {
        present(imagePicker, animated: false, completion: nil)
    }
    @objc func didTapDonePicker(){
        
    }
    @objc func didTapDatepicker(){
        print("DEBUG : tap datepicker")
    }
    @objc func handleDatePicker() {
        
    }
    
}

extension EditPetProfileController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        self.selectedImage = image
        
        dismiss(animated: true, completion: nil)
    }
}

extension EditPetProfileController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == kindsPickerView {
            return kindsList.count
        } else if pickerView == sexPickerView {
            return sexList.count
        } else {
            return neuteringList.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == kindsPickerView {
            return kindsList[row]
        } else if pickerView == sexPickerView {
            return sexList[row]
        } else {
            return neuteringList[row]
        }
        
    }
    // textfield의 텍스트에 pickerview에서 선택한 값을 넣어준다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == kindsPickerView {
            kindsTextField.text = kindsList[row]
            kindsTextField.resignFirstResponder()
        } else if pickerView == sexPickerView {
            sexTextField.text = sexList[row]
            sexTextField.resignFirstResponder()
        } else {
            neuteringTextField.text = neuteringList[row]
            neuteringTextField.resignFirstResponder()
        }
    }
    
}

extension EditPetProfileController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: (textField.frame.origin.y) - 250), animated: true)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

extension EditPetProfileController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: (textView.frame.origin.y) - 250), animated: true)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}
