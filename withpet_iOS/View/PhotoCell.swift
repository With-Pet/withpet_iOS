//
//  PhotoCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/11.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    //MARK: - Properties
    static let reuseIdentifier = "PhotoCell"
    
    var imageView = UIImageView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        contentMode = .scaleAspectFit
        layer.cornerRadius = 20
        addSubview(imageView)
//        imageView.snp.makeConstraints { make in
//            make.top.bottom.left.right.equalToSuperview()
//        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
