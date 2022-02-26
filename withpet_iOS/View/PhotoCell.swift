//
//  PhotoCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/11.
//

import UIKit

enum PhotoState {
    case register
    case detail
}

class PhotoCell: UICollectionViewCell {
    //MARK: - Properties
    static let reuseIdentifier = "PhotoCell"
    
    private var pageControl = UIPageControl().then {
        $0.pageIndicatorTintColor = .lightGray // 페이지를 암시하는 동그란 점의 색상
        $0.currentPageIndicatorTintColor = .white // 현재 페이지를 암시하는 동그란 점 색상
        $0.isEnabled = false
        $0.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    var image: UIImage? {
        didSet{
            imageView.image = self.image
        }
    }

    lazy var imageView = UIImageView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.frame = bounds
        imageView.contentMode = .scaleAspectFill
        
//        addSubview(pageControl)
//        pageControl.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-10)
//            make.right.equalToSuperview().offset(-10)
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configurePhoto(state: PhotoState) {
        if state == .register {
            layer.cornerRadius = 20
            pageControl.isHidden = true
        }
    }
    func configure(current page:Int,number: Int){
        pageControl.currentPage = page
        pageControl.numberOfPages = number
    }
    
}
