//
//  PostStep2Controller.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit

class ThirdPostController: UIViewController {
    
    //MARK: - Properties
    private let progressBar = SteppedProgressBar(frame: .zero, index: 2)
    
    private let startDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    private let endDatePicker = UIDatePicker()
    
    private let startDateLabel = UILabel().then {
        $0.text = "시작 날짜"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private let endDateLabel = UILabel().then {
        $0.text = "종료 날짜"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        $0.setTitleColor(.black, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceRightToLeft
        
        $0.setTitleColor(.mainColor, for: .normal)
        $0.tintColor = .mainColor
        $0.addTarget(self, action: #selector(didTapNextstep), for: .touchUpInside)
        
    }
    
    private let previousButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.setTitle("이전", for: .normal)
        
        $0.setTitleColor(.black, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceLeftToRight
        
        $0.setTitleColor(.mainColor, for: .normal)
        $0.tintColor = .mainColor
        
        $0.addTarget(self, action: #selector(didTapPreviousstep), for: .touchUpInside)
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureDatePicker()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Configure
    
    func configureUI(){
        view.backgroundColor = .white
        configureDatePicker()
        navigationItem.title = "등록"
        view.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.left.right.equalToSuperview()
            make.height.equalTo(130)
        }
        
        view.addSubview(startDateLabel)
        startDateLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        view.addSubview(startDatePicker)
        startDatePicker.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(startDateLabel.snp.bottom).offset(20)
            make.height.equalTo(150)
        }
        
        view.addSubview(endDateLabel)
        endDateLabel.snp.makeConstraints { make in
            make.centerX.equalTo(startDateLabel.snp.centerX)
            make.top.equalTo(startDatePicker.snp.bottom).offset(20)
        }
        
        view.addSubview(endDatePicker)
        endDatePicker.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(endDateLabel.snp.bottom).offset(20)
        }
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-30)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        view.addSubview(previousButton)
        previousButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(nextButton.snp.centerY)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }
    
    func configureDatePicker() {
        
        let currentDate = Date()
        var dateComponents = DateComponents()
        let calendar = Calendar.init(identifier: .gregorian)
        dateComponents.month = 3
        let maxDate = calendar.date(byAdding: dateComponents, to: currentDate)

        startDatePicker.datePickerMode = .dateAndTime
        startDatePicker.preferredDatePickerStyle = .wheels
        startDatePicker.setValue(UIColor.darkText, forKey: "textColor")
        startDatePicker.locale = Locale(identifier: "ko-KR")
        startDatePicker.addTarget(self, action: #selector(handleStartDatePicker), for: .valueChanged)
        startDatePicker.minimumDate = Date()
        startDatePicker.maximumDate = maxDate
        
        
        endDatePicker.datePickerMode = .dateAndTime
        endDatePicker.preferredDatePickerStyle = .wheels
        endDatePicker.setValue(UIColor.darkText, forKey: "textColor")
        endDatePicker.locale = Locale(identifier: "ko-KR")
        endDatePicker.addTarget(self, action: #selector(handleEndDatePicker), for: .valueChanged)
        endDatePicker.minimumDate = Date()
        endDatePicker.maximumDate = maxDate
        
        
    }
    
    //MARK: - selector
    @objc func didTapNextstep() {
        let vc = FourthPostController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func didTapPreviousstep() {
        navigationController?.popViewController(animated: true)
    }
    @objc func handleStartDatePicker() {
        let date = startDatePicker.date
        print(date)
    }
    
    @objc func handleEndDatePicker() {
        let date = endDatePicker.date
        print(date)
    }
}

