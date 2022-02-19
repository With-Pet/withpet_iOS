//
//  FirstPostHeader.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/18.
//

import UIKit

class FirstPostHeader: UICollectionReusableView {
    static let reuseIdentifier = "FirstPostHeader"
    
    private let progressBar = SteppedProgressBar(frame: .zero, index: 0)
    
    private let selectMyPetLabel = UILabel().then {
        $0.text = "반려동물 선택"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-10)
            make.left.right.equalToSuperview()
            make.height.equalTo(130)
        }
        
        addSubview(selectMyPetLabel)
        selectMyPetLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
