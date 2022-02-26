//
//  FeedViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import UIKit

private let reuseIdentifier = "petCell"

class FeedController: UIViewController {
    
    //MARK: - Properties
    private var collectionView: UICollectionView!
    
    private lazy var actionButton = UIButton().then {
        $0.setImage( UIImage(named: "outline_place_black_36pt"), for: .normal)
        $0.setTitle(" postion", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 26)
        $0.titleLabel?.textAlignment = .left
        $0.imageView?.contentMode = .scaleAspectFit
        $0.semanticContentAttribute = .forceLeftToRight
        $0.frame = CGRect(x: 20, y: 0, width: 20, height: 20)
        $0.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
    }
    
    private lazy var filterButton = UIButton().then {
        $0.setImage(UIImage(named: "outline_filter_list_black_36pt"), for: .normal)
        $0.addTarget(self, action: #selector(handleFilterButton), for: .touchUpInside)
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    }
    
    private lazy var searchButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        $0.setImage(UIImage(named: "outline_search_black_36pt"), for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    }
    
    private lazy var notificationButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleNotification), for: .touchUpInside)
        $0.setImage(UIImage(named: "outline_notifications_black_36pt"), for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureUI()
        setNavigationBar()
        
    }
    
    //MARK: - Configure
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func setNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .darkGray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: actionButton)
        let filterButton = UIBarButtonItem(customView: filterButton)
        let glassButton = UIBarButtonItem(customView: searchButton)
        let notification = UIBarButtonItem(customView: notificationButton)
        navigationItem.rightBarButtonItems = [glassButton,filterButton,notification]
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
    }
    //MARK: - Selector
    @objc func handleLocationButton() {
        print("csadfsdfs")
    }
    
    @objc func handleFilterButton() {
        let vc = UINavigationController(rootViewController: FilterController())
        present(vc,animated: true)
    }
    
    @objc func handleSearchButton() {
        let vc = UINavigationController(rootViewController: SearchController())
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    
    @objc func handleNotification() {
        print("DEBUG : clicked notification button")
    }
    
}

extension FeedController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.reuseIdentifier, for: indexPath) as! FeedCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UINavigationController(rootViewController: DetailFeedController())
//        let vc = DetailFeedController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}

extension FeedController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
