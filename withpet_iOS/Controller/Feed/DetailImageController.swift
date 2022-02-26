//
//  DetialImageController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/24.
//

import UIKit

class DetailImageController: UIViewController {

    private var images = [UIImage?]() {
        didSet {
            
        }
    }
    
    private var pageControl = UIPageControl()
    
    private var scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 270)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        $0.contentMode = .scaleToFill
    }
    
    //MARK: - Lifecycle
    init(images: [UIImage?]) {
        self.images = images
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
//        configureNavigation()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .darkGray
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(15)
        }
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(300)
        }
        
        setupImages(images)
        
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview()
        }
        
    }
    
    func configureNavigation(){
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func setupImages(_ images:[UIImage?]) {
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
            scrollView.delegate = self
        }
    }
    
    func configurePageControl() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        pageControl.pageIndicatorTintColor = .lightGray // 페이지를 암시하는 동그란 점의 색상
        pageControl.currentPageIndicatorTintColor = .white // 현재 페이지를 암시하는 동그란 점 색상
    }

    @objc func handleDismissal(){
        navigationController?.popViewController(animated: false)
    }
}

extension DetailImageController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
