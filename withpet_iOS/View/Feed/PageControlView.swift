//
//  pageControlView.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/25.
//

import UIKit
import Combine

class PageControlView: UICollectionReusableView {
    
    static let reuseIdentifier = "pageControlIdentfier"
    
    private var pagingInfoToken: AnyCancellable?
    
    private let pagingInfoSubject = PassthroughSubject<Int, Never>()
    
    private var pageControl = UIPageControl()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configurePageControl()
        backgroundColor = UIColor(white: 1, alpha: 0)
        addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(number: Int){
        pageControl.numberOfPages = number
        layoutIfNeeded()
    }
    private func configurePageControl() {
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .lightGray // 페이지를 암시하는 동그란 점의 색상
        pageControl.currentPageIndicatorTintColor = .white // 현재 페이지를 암시하는 동그란 점 색상
        pageControl.isEnabled = false
    }
    
    func subscribeTo(subject: PassthroughSubject<Int, Never>) {
        pagingInfoToken = subject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] index in
                self?.pageControl.currentPage = index
            }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pagingInfoToken?.cancel()
        pagingInfoToken = nil
    }
    
    
}
