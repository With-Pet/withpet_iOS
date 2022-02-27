//
//  DetailFeedController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/22.
//

import UIKit
import Combine

class DetailFeedController: UIViewController {
    
    var collectionView:UICollectionView!
    
    private let pageInfoSubject = PassthroughSubject<Int,Never>()
    
    var images = [UIImage(named: "dogdog"),UIImage(named: "dogdog"),UIImage(named: "dogdog")]
    
    var dataSource: UICollectionViewDiffableDataSource<Int, UIImage?>! = nil
    
    var str:String?
    
    private var isFollowed : Bool = false {
        didSet {
            followingButton.tintColor = self.isFollowed ? .orange : .lightGray
        }
    }
    
    private lazy var bottomContainterView = UIView().then {
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.backgroundColor = .white
        $0.addSubview(chatButton)
        
        chatButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
    }
    
    private let chatButton = UIButton().then {
        $0.backgroundColor = .mainColor
        $0.setImage(UIImage(named:"chat"), for: .normal)
        $0.setTitle(" 채팅으로 거래하기", for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.tintColor = .white
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(handleChat), for: .touchUpInside)
        $0.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        $0.contentMode = .scaleToFill
    }
    
    private lazy var followingButton = UIButton().then {
        $0.setImage(UIImage(systemName: "star.fill"), for: .normal)
        $0.tintColor = .lightGray
        $0.addTarget(self, action: #selector(handleFollowing), for: .touchUpInside)
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .red
        $0.image = UIImage(named: "dogdog")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configureCollectionView()
        configureDataSource()
        
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(60)
            make.width.height.equalTo(30)
        }
        
        view.addSubview(followingButton)
        followingButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.centerY.equalTo(backButton)
            make.trailing.equalToSuperview().offset(-20)
        }
        view.addSubview(bottomContainterView)
        bottomContainterView.snp.makeConstraints { make in
            make.width.equalTo(440)
            make.height.equalTo(100)
            make.bottom.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        //        configureNavigation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    //    func configureNavigation(){
    //        navigationController?.isNavigationBarHidden = false
    //        navigationController?.navigationBar.tintColor = .darkGray
    //        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    //        let followButton = UIBarButtonItem(customView: followingButton)
    //        navigationItem.rightBarButtonItem = followButton
    //    }
    
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        collectionView.register(DetailFeedFooter.self, forSupplementaryViewOfKind: DetailFeedFooter.reuseIdentifier, withReuseIdentifier: DetailFeedFooter.reuseIdentifier)
        collectionView.register(PageControlView.self, forSupplementaryViewOfKind: PageControlView.reuseIdentifier, withReuseIdentifier: PageControlView.reuseIdentifier)
        collectionView.delegate = self
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    }
    
    
    
    //MARK: - selector
    @objc func handleDismissal(){
        dismiss(animated: false, completion: nil)
    }
    
    @objc func handleFollowing(){
        isFollowed.toggle()
    }
    
    @objc func imageTapped() {
        let vc = DetailImageController(images: images)
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc func handleChat(){
        print("DEBUG : did tap chat button")
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Int, UIImage?> {
        var snapshot = NSDiffableDataSourceSnapshot<Int, UIImage?>()
        snapshot.appendSections([0])
        snapshot.appendItems([UIImage(named: "sample1"),UIImage(named:"dogdog"),UIImage(named:"exprience")])
        return snapshot
    }
}

extension DetailFeedController : UICollectionViewDelegate {
    
    
    func generateLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex,layoutEnvironment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let badgeAnchor = NSCollectionLayoutAnchor(edges: [.bottom,.trailing], absoluteOffset: CGPoint(x: -40, y: -10))
            
            let badgeSize = NSCollectionLayoutSize(widthDimension: .absolute(32), heightDimension: .absolute(8))
            
            let badge = NSCollectionLayoutSupplementaryItem(
                layoutSize: badgeSize,
                elementKind: PageControlView.reuseIdentifier,
                containerAnchor: badgeAnchor)
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize,supplementaryItems: [badge])
            //            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(350))
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(865)), elementKind: DetailFeedFooter.reuseIdentifier, alignment: .bottom)]
            section.orthogonalScrollingBehavior = .paging
            
            section.visibleItemsInvalidationHandler = { [weak self] (items, offset, env) -> Void in
                guard let self = self else { return }
                
                let page = round(offset.x / self.view.bounds.width)
                
                
                self.pageInfoSubject.send(Int(page))
            }
            
            return section
        })
        return layout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
        <Int, UIImage?>(collectionView: self.collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, image: UIImage?) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PhotoCell.reuseIdentifier,
                for: indexPath) as? PhotoCell else { fatalError("Could not create new cell") }
            cell.image = image
            //            cell.configure(current: indexPath.row, number: self.images.count)
            return cell
        }
        
        dataSource?.supplementaryViewProvider = {
            (collectionView:UICollectionView,kind: String, indexPath:IndexPath) -> UICollectionReusableView? in
            
            switch kind {
            case PageControlView.reuseIdentifier :
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PageControlView.reuseIdentifier, for: indexPath) as? PageControlView else {
                    fatalError("Cannot create supplementray view")
                }
                let itemCount = self.dataSource?.snapshot().numberOfItems(inSection: indexPath.section)
                supplementaryView.configure(number: itemCount!)
                supplementaryView.subscribeTo(subject: self.pageInfoSubject)
                return supplementaryView
            case DetailFeedFooter.reuseIdentifier :
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailFeedFooter.reuseIdentifier, for: indexPath) as? DetailFeedFooter else {
                    fatalError("Cannot create footer view")
                }
                return supplementaryView
                
            default:
                fatalError("Cannot create footer view")
            }
        }
        
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailImageController(images: images)
        navigationController?.pushViewController(vc, animated: false)
        
    }
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        print(Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width)))
    ////        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    //    }
}


