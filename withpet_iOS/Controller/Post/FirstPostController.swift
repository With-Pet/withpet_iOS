//
//  PostViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import Foundation
import UIKit
import FlexibleSteppedProgressBar

private let reuseIdentifier = "MyPetCell"
class FirstPostController : UIViewController {
    
    //MARK: - Properties
    private var selectedIndex : Int?
    
    private var collectionView : UICollectionView!
    
    private let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)

        $0.setTitleColor(.black, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceRightToLeft

        $0.setTitleColor(.mainColor, for: .normal)
        $0.tintColor = .mainColor
        $0.addTarget(self, action: #selector(didTapNextstep), for: .touchUpInside)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureNavigation()
        configureUI()
    }
    
    //MARK: - Configure
    func configureUI(){
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-30)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
          
    }
    
    func configureNavigation(){
        navigationItem.title = "등록"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FirstPostHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FirstPostHeader.reuseIdentifier)
        collectionView.register(MyPetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: - Selector
    @objc func didTapNextstep() {
        if let index = selectedIndex {
            let vc = SecondPostController()
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let alert = UIAlertController(title: "반드시 반려동물을 클릭해주세요!", message: .none, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인" , style: .default))
            
            present(alert,animated: true)
        }
    }
    
    @objc func handleDismissal() {
        dismiss(animated: true)
    }
}

extension FirstPostController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FirstPostHeader.reuseIdentifier, for: indexPath) as! FirstPostHeader
            return header
        default : return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyPetCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let selectedIndex = selectedIndex {
            if selectedIndex == indexPath.row {
                self.selectedIndex = nil
            }
        }
    }
}

extension FirstPostController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 30, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 185)
    }
}
