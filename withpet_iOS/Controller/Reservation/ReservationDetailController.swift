//
//  ReservationDetailController.swift
//  withpet_iOS
//
//  Created by Doyun Park on 2022/03/08.
//

import UIKit

class ReservationDetailController: UIViewController {

    private var state : ReservationStateOption = .before {
        didSet {
            configure()
        }
    }
    
    private var reservationStateLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.text = "test"
    }
    private var petInfoView = PetInfoView()
    
    private let positionLabel = UILabel().then {
        $0.text = "위치"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .lightGray
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "날짜/시간"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .lightGray
    }
    
    private let careLabel = UILabel().then {
        $0.text = "보호자"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .lightGray
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = "카테고리"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .lightGray
    }
    
    private let requirementLabel = UILabel().then {
        $0.text = "요청사항"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .lightGray
    }
    
    private var reservationPostionLabel = UILabel().then {
        $0.text = "서울시 강남구 논현동"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private var reservationDateLabel = UILabel().then {
        $0.text = "22.01.07 PM 01:30"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private var reservationCareLabel = UILabel().then {
        $0.text = "홍길동"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private var reservationCategoryLabel = UILabel().then {
        $0.text = "돌봄"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private var reservationRequirementLabel = UILabel().then {
        $0.text = "관절이 약하니 주의해주세요!"
        $0.font = .systemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    
    private lazy var addReviewButton = UIButton().then {
        $0.backgroundColor = .mainColor
        $0.setTitle("리뷰작성", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(didTapAddReview), for: .touchUpInside)
    }
    
    init(state : ReservationStateOption) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavigationBar()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        reservationStateLabel.text = state.description
    }

    private func configureNavigationBar(){
        
        let cancleButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.leftBarButtonItem = cancleButton
        navigationController?.navigationBar.tintColor = .black
    }
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(reservationStateLabel)
        reservationStateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
        }
        
        view.addSubview(petInfoView)
        petInfoView.snp.makeConstraints { make in
            make.top.equalTo(reservationStateLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview()
            make.height.equalTo(180)
        }
        
        view.addSubview(positionLabel)
        positionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(petInfoView.snp.bottom).offset(20)
        }
        
        view.addSubview(reservationPostionLabel)
        reservationPostionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(positionLabel.snp.centerY)
            make.left.equalTo(positionLabel.snp.right).offset(100)
        }
        
        let section1 = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        view.addSubview(section1)
        section1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(positionLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section1.snp.bottom).offset(20)
        }
        
        view.addSubview(reservationDateLabel)
        reservationDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dateLabel.snp.centerY)
            make.left.equalTo(reservationPostionLabel.snp.left)
        }
        
        let section2 = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        view.addSubview(section2)
        section2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        view.addSubview(careLabel)
        careLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section2.snp.bottom).offset(20)
        }
        
        view.addSubview(reservationCareLabel)
        reservationCareLabel.snp.makeConstraints { make in
            make.centerY.equalTo(careLabel.snp.centerY)
            make.left.equalTo(reservationDateLabel.snp.left)
        }
        
        let section3 = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        view.addSubview(section3)
        section3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(careLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        view.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section3.snp.bottom).offset(20)
        }
        
        view.addSubview(reservationCategoryLabel)
        reservationCategoryLabel.snp.makeConstraints { make in
            make.centerY.equalTo(categoryLabel.snp.centerY)
            make.left.equalTo(reservationDateLabel.snp.left)
        }
        
        let section4 = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        view.addSubview(section4)
        section4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(categoryLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        view.addSubview(requirementLabel)
        requirementLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(section4.snp.bottom).offset(20)
        }
        
        view.addSubview(reservationRequirementLabel)
        reservationRequirementLabel.snp.makeConstraints { make in
            make.centerY.equalTo(requirementLabel.snp.centerY)
            make.left.equalTo(reservationCategoryLabel.snp.left)
        }
        
        let section5 = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        view.addSubview(section5)
        section5.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(requirementLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        view.addSubview(addReviewButton)
        addReviewButton.snp.makeConstraints { make in
            make.top.equalTo(section5.snp.bottom).offset(40)
            make.width.equalTo(130)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
    @objc func didTapAddReview() {
        let vc = AddReviewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
