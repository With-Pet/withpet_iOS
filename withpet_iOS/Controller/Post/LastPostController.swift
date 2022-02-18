//
//  PostStep2Controller.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit


class LastPostController: UIViewController {

    //MARK: - Properties
    private let images = [UIImage]()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 6
        let CV = UICollectionView(frame: .zero,collectionViewLayout: layout)
        CV.backgroundColor = .white
        return CV
    }()
    
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
    
    private let previousButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.setTitle("이전", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceLeftToRight
        $0.setTitleColor(.mainColor, for: .normal)
        $0.tintColor = .mainColor
        $0.addTarget(self, action: #selector(didTapPreviousstep), for: .touchUpInside)
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureUI()
        // Do any additional setup after loading the view.
    }

    //MARK: - Configure
    
    func configureUI(){
        view.backgroundColor = .white
        
        navigationItem.title = "등록"
        
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
        view.addSubview(previousButton)
        previousButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(nextButton.snp.centerY)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LastPostHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LastPostHeader.reuseIdentifier)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
   
    }
    //MARK: - selector
    @objc func didTapNextstep() {
        let vc = MainTapController()
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    @objc func didTapPreviousstep() {
        navigationController?.popViewController(animated: true)
    }
}

extension LastPostController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LastPostHeader.reuseIdentifier, for: indexPath) as! LastPostHeader
            return header
        default :
            return UICollectionReusableView()
        }
    }
}

extension LastPostController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 570)
    }
}
