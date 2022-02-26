//
//  PetInfoView.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/24.
//

import UIKit

class PetInfoView: UIView {

    private let kindsLabel = UILabel().then {
        $0.text = "종류"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    private let detailLabel = UILabel().then {
        $0.text = "품종"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    private let sexLabel = UILabel().then {
        $0.text = "성별"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    private let ageLabel = UILabel().then {
        $0.text = "나이"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    private let weightLabel = UILabel().then {
        $0.text = "몸무게"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    private let neuteringLabel = UILabel().then {
        $0.text = "중성화"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    
    private let kindsInputLabel = UILabel().then {
        $0.text = "강아지"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .black
    }
    
    private let detailInputLabel = UILabel().then {
        $0.text = "말티즈"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .black
    }
    
    private let sexInputLabel = UILabel().then {
        $0.text = "여성"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .black
    }
    private let weightInputLabel = UILabel().then {
        $0.text = "2.8kg"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .black
    }
    private let ageInputLabel =  UILabel().then {
        $0.text = "3살"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .black
    }
    private let neuteringInputLabel = UILabel().then {
        $0.text = "O"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .black
    }

  
    override init(frame:CGRect){
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(kindsLabel)
        kindsLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
        }
        
        addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(kindsLabel.snp.centerY)
            make.left.equalTo(kindsLabel.snp.right).offset(110)
        }
        
        addSubview(sexLabel)
        sexLabel.snp.makeConstraints { make in
            make.centerY.equalTo(detailLabel.snp.centerY)
            make.left.equalTo(detailLabel.snp.right).offset(110)
        }

        addSubview(kindsInputLabel)
        kindsInputLabel.snp.makeConstraints { make in
            make.left.equalTo(kindsLabel.snp.left)
            make.top.equalTo(kindsLabel.snp.bottom).offset(16)
        }

        addSubview(detailInputLabel)
        detailInputLabel.snp.makeConstraints { make in
            make.left.equalTo(detailLabel)
            make.top.equalTo(kindsInputLabel.snp.top)
        }
        
        addSubview(sexInputLabel)
        sexInputLabel.snp.makeConstraints { make in
            make.left.equalTo(sexLabel.snp.left)
            make.top.equalTo(kindsInputLabel.snp.top)
        }

        addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(kindsInputLabel.snp.bottom).offset(20)
        }
        
        addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.left.equalTo(detailLabel.snp.left)
            make.top.equalTo(ageLabel.snp.top)
        }
        
        addSubview(neuteringLabel)
        neuteringLabel.snp.makeConstraints { make in
            make.left.equalTo(sexLabel)
            make.top.equalTo(ageLabel.snp.top)
        }
        
        addSubview(ageInputLabel)
        ageInputLabel.snp.makeConstraints { make in
            make.left.equalTo(kindsInputLabel.snp.left)
            make.top.equalTo(ageLabel.snp.bottom).offset(16)
        }
        
        addSubview(weightInputLabel)
        weightInputLabel.snp.makeConstraints { make in
            make.left.equalTo(detailInputLabel.snp.left)
            make.top.equalTo(ageInputLabel.snp.top)
        }
        
        addSubview(neuteringInputLabel)
        neuteringInputLabel.snp.makeConstraints { make in
            make.top.equalTo(weightInputLabel.snp.top)
            make.left.equalTo(sexInputLabel.snp.left)
        }
        
        let underLine = UIView()
        underLine.backgroundColor = .lightGray
        
        addSubview(underLine)
        underLine.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
