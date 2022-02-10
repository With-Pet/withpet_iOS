//
//  CertificationView.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/04.
//

import Foundation
import UIKit

class CertificationCell:UICollectionViewCell {
    //MARK: - Properties
    
    private let certiciationLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "자격 및 인증"
    }
    
    private let certificationImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray
        $0.layer.borderWidth = 4
        $0.layer.borderColor = UIColor.white.cgColor
        
        
        $0.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(160)
        }
    }
    
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "펫시터 전문가 교육"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        
    }
    
    private let sourceLabel = UILabel().then {
        $0.textColor = .darkText
        $0.text = "(사) K.S.D 문화교육원"
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    private let issueDateLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.text = "2020년 1월 17일"
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(certificationImageView)
        certificationImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(15)
        }
        
        let stack = UIStackView(arrangedSubviews: [nameLabel,sourceLabel,issueDateLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillProportionally
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(certificationImageView.snp.top)
            make.left.equalTo(certificationImageView.snp.right).offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
