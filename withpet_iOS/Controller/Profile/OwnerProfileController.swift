//
//  OwnerViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/03.
//

import UIKit
import MaterialComponents.MaterialChips
import MaterialComponents

private let headerIdentifier = "OwnerHeader"
private let certificationIdentifier = "certificationCell"
private let footerIdentifier = "OnwerFooter"

class OwnerProfileController: UIViewController {
    
    //MARK: - Properties
    private var collectionView : UICollectionView!
    
    private var isFollowed:Bool = false
    
    private var storeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        
        $0.addTarget(self, action: #selector(handleFollow), for: .touchUpInside)
        $0.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationbar()
    }
    
    //MARK: - Confiture
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "프로필"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: storeButton)
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(OwnerProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.register(CertificationCell.self, forCellWithReuseIdentifier: certificationIdentifier)
        collectionView.register(OnwerProfileFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerIdentifier)
    }
    
    //MARK: - selector
    @objc func handleDismissal(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapSetting() {
        print("DEBUG : tapped setting button")
    }
    @objc func handleFollow() {
        print("DEBUG : clicked")
        if isFollowed {
            storeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            storeButton.tintColor = .black
            isFollowed = false
        } else {
            storeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            storeButton.tintColor = .red
            isFollowed = true
        }
    }
    
}

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension OwnerProfileController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! OwnerProfileHeader
            header.delegate = self
            return header
        case UICollectionView.elementKindSectionFooter :
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath) as! OnwerProfileFooter
            footer.delegate = self
            return footer
        default :
            return UICollectionReusableView()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: certificationIdentifier, for: indexPath) as! CertificationCell
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OwnerProfileController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let height = Utilities().heightForView(text: "현재 6세 말티즈를 키우고 있으며, 자격증을 보유하고 있습니다.", font: .systemFont(ofSize: 20), width: view.frame.width-36)
        
        return CGSize(width: view.frame.width, height: 650 + height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width:view.frame.width,height:400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 110)
    }
}
extension OwnerProfileController : OwnerProfileHeaderDelegate {
    func didTapViewPosts() {
//        let vc = EditOwnerProfileController()
//        navigationController?.pushViewController(vc, animated: false)
    }
}
extension OwnerProfileController : OwnerProfileFooterDeleagte {
    func showMoreReviews() {
        let vc = ReviewsController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
