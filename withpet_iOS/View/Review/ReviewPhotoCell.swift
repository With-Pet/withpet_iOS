//
//  PhotoCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/11.
//

import UIKit

class ReviewPhotoCell: UICollectionViewCell {
    
    //MARK: - Properties
    var imageView = UIImageView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(imageView)
        imageView.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
