//
//  IntroFooterView.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/08.
//

import UIKit
import Cosmos

protocol OwnerProfileFooterDeleagte : class {
    func showMoreReviews()
}
class OnwerProfileFooter: UICollectionReusableView {
    
    //MARK: - Properties
    weak var delegate : OwnerProfileFooterDeleagte?
    
    private var titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "서비스 이용자 후기"
    }
    private let moreButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(handleMoreRiviews), for: .touchUpInside)
    }
    override init(frame:CGRect) {
        super.init(frame:.zero)
        backgroundColor = .white
    
        let ratingView = RatingView(frame: .zero)
        
        let underline = UIView()
        underline.backgroundColor = .lightGray
        
        addSubview(underline)
        underline.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(25)
        }
        
        addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(25)
            make.height.width.equalTo(20)
        }
        
        addSubview(ratingView)
        ratingView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - selector
    @objc func handleMoreRiviews() {
        delegate?.showMoreReviews()
    }
    
}
