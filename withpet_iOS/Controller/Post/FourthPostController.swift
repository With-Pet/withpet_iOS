//
//  PostStep2Controller.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit
import Photos
import PhotosUI

private let reuseIdentifier = "PhotoCell"
class FourthPostController: UIViewController {

    //MARK: - Properties
    private let progressBar = SteppedProgressBar(frame: .zero, index: 3)
    
    private var images = [UIImage]() {
        didSet {
            print(self.images)
            self.collectionView.reloadData()
        }
    }
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 6
        let CV = UICollectionView(frame: .zero,collectionViewLayout: layout)
        CV.backgroundColor = .white
        return CV
    }()
    
    private let plusPhotoButton = UIButton(type: .system).then{
        $0.backgroundColor = .lightGray
        $0.setImage(UIImage(systemName: "photo"), for: .normal)
        $0.setTitle("당신의 반려동물의 사진을 올려주세요!", for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.contentHorizontalAlignment = .center
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.tintColor = .white
        $0.semanticContentAttribute = .playback
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(handleAddPhotos), for: .touchUpInside)
    }
    
    private let infoLabel = UILabel().then {
        $0.text = "사진 등록"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private let explainLabel = UILabel().then {
        $0.text = "선택된 사진 목록"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 16)
    }
    
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
//        photo
    }

    //MARK: - Configure
    
    func configureUI(){
        view.backgroundColor = .white
        
        navigationItem.title = "등록"
        view.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.left.right.equalToSuperview()
            make.height.equalTo(130)
        }
        
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.top.equalTo(infoLabel.snp.bottom).offset(20)
            make.height.equalTo(130)
        }
        
        view.addSubview(explainLabel)
        explainLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(plusPhotoButton.snp.bottom).offset(30)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
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
    
    //MARK: - configure
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
   
    }
    //MARK: - selector
    @objc func didTapNextstep() {
        let vc = FifthPostController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func didTapPreviousstep() {
        navigationController?.popViewController(animated: true)
    }
    @objc func handleAddPhotos() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 3
        config.filter = .images
        
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }

}

extension FourthPostController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "삭제하시겠습니까?", message: .none, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
            self.images.remove(at: indexPath.row)
            collectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "아니오", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
extension FourthPostController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
extension FourthPostController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        var selectedImages = [UIImage]()
        
        picker.dismiss(animated: true, completion: nil)
        
        let group = DispatchGroup()
        
        results.forEach { result in
            group.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self) { (reading,error) in
                defer {
                    group.leave()
                }
                guard let image = reading as? UIImage, error == nil else {
                    return
                }
                selectedImages.append(image)
            }
        }
        
        group.notify(queue: .main) {
            self.images = selectedImages
        }
    }
}
