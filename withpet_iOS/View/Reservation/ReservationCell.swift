//
//  ReservationCell.swift
//  withpet_iOS
//
//  Created by Doyun Park on 2022/03/08.
//

import UIKit

enum ReservationStateOption : Int, CaseIterable {
    case before = 0
    case current
    case after
    
    var description : String {
        switch self {
        case .before : return "이용 전"
        case .current : return "이용 중"
        case .after : return "이용 완료"
        }
    }
    
    var color : UIColor {
        switch self {
        case .after : return UIColor.red
        default : return UIColor.mainColor
        }
    }
}


class ReservationCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ReservationCell"
    
    private var stateView = ReservationStateView(state: ReservationStateOption.init(rawValue: Int.random(in: 0...2))!)
    
    private var locationLabel = UILabel().then {
        let imageAttachment = NSTextAttachment()
        
        imageAttachment.image = UIImage(named: "outline_place_black_36pt")
        imageAttachment.bounds = CGRect(x: 0, y: -5, width: 25, height: 25)
        
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        completeText.append(attachmentString)
        let textAfterIcon = NSAttributedString(string: "서울시 강남구 논현동")
        completeText.append(textAfterIcon)
        
        $0.attributedText = completeText
    }
    
    private var usedServiceLabel = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 18)
        $0.text = "산책"
        $0.textAlignment = .left
    }
    
    private var userNameLabel = UILabel().then{
        $0.text = "상대방 이름"
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .left
    }
    
    private lazy var profileButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle(" 프로필 보기", for: .normal)
        $0.setImage(UIImage(named: "person"), for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.tintColor = .black
        $0.setTitleColor(.black, for: .normal)
        
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.darkGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 5)
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowRadius = 5
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.1
        $0.layer.masksToBounds = false
        $0.addTarget(self, action: #selector(handleViewProfile), for: .touchUpInside)
    }
    
    private lazy var chatButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle(" 채팅하기", for: .normal)
        $0.setImage(UIImage(named: "chat"), for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.tintColor = .black
        $0.setTitleColor(.black, for: .normal)
        
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.darkGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 5)
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowRadius = 5
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.1
        
        $0.layer.masksToBounds = false
        $0.addTarget(self, action: #selector(handleViewProfile), for: .touchUpInside)
    }
    
    private let startLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "체크 인"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let endLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "체크 아웃"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private var startDateLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.text = "22.01.30 AM 09:00"
        $0.textColor = .black
    }
    
    private var endDateLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.text = "22.01.30 PM 02:00"
        $0.textColor = .black
    }
    override init(frame:CGRect) {
        super.init(frame: frame)
        configrue()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configrue() {
        backgroundColor = .white
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        let section1 = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        addSubview(section1)
        section1.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        
        addSubview(usedServiceLabel)
        usedServiceLabel.snp.makeConstraints { make in
            make.top.equalTo(section1.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(14)
        }
        
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14)
            make.top.equalTo(usedServiceLabel.snp.bottom).offset(14)
        }
        
        
        addSubview(stateView)
        stateView.snp.makeConstraints { make in
            make.top.equalTo(section1.snp.bottom).offset(14)
            make.right.equalToSuperview().offset(-14)
//            make.height.equalTo(20)
//            make.width.equalTo(40)
        }
        
        addSubview(profileButton)
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(24)
            make.width.equalTo(130)
            make.height.equalTo(40)
        }
        
        addSubview(chatButton)
        chatButton.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(40)
            make.right.equalToSuperview().offset(-24)
            make.width.equalTo(130)
            make.height.equalTo(40)
        }
        
        let section2 = UIView().then{
            $0.backgroundColor = .lightGray
        }
        
        addSubview(section2)
        section2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(chatButton.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
        
        addSubview(startLabel)
        startLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(70)
            make.top.equalTo(section2.snp.bottom).offset(15)
        }
        
        addSubview(endLabel)
        endLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-70)
            make.centerY.equalTo(startLabel.snp.centerY)
        }
        
        addSubview(startDateLabel)
        startDateLabel.snp.makeConstraints { make in
            make.top.equalTo(startLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(10)
        }
        
        addSubview(endDateLabel)
        endDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startDateLabel.snp.centerY)
            make.right.equalToSuperview().offset(-10)
        }
    }
    func setupLayout() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 8
        layer.cornerRadius = 5
//        layer.masksToBounds = true
        contentView.layer.masksToBounds = true
    }
    
    @objc func handleViewProfile(){
        
    }
}
