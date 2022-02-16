//
//  AddReviewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/11.
//

import UIKit
import Cosmos
import Photos
import PhotosUI

private let reuseIdentifier = "PhotoCell"
class AddReviewController: UIViewController {
    
    //MARK: - Properties
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 6
        let CV = UICollectionView(frame: .zero,collectionViewLayout: layout)
        CV.backgroundColor = .white
        return CV
    }()
    
    private var images = [UIImage]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private let ratingView = CosmosView()
    private let managerTitleLabel = UILabel().then {
        $0.text = "담당자"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .darkGray
    }
    
    private let nameInputLabel = UILabel().then {
        $0.text = "박도윤"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let serviceTitleLabel = UILabel().then {
        $0.text = "서비스"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .darkGray
    }
    
    private let serviceInputLabel = UILabel().then {
        $0.text = "산책"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let reservationTitleLabel = UILabel().then {
        $0.text = "예약 날짜"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .darkGray
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "2021년 12월 3일"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let costTitleLabel = UILabel().then {
        $0.text = "비용"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .darkGray
    }
    
    private let costInputLabel = UILabel().then {
        $0.text = "10,000원 / 시간"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let ratingLabel = UILabel().then {
        $0.text = "평점과 리뷰를 남겨주세요!"
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let reviewTextView = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .lightGray
        $0.textAlignment = .left
        $0.text = "다른 이용자들을 위해 리뷰를 작성해주세요."
        $0.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    private let addImageButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .white
        $0.tintColor = .mainColor
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.mainColor.cgColor
        $0.setImage(UIImage(systemName: "camera"), for: .normal)
        $0.addTarget(self, action: #selector(handleAddPhotos), for: .touchUpInside)
        $0.contentMode = .scaleToFill
        
        //        $0.imageEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 30, right: 20)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureCollectionView()
        configureUI()
        configureNavigationbar()
    }
    
    //MARK: - Configure
    func configureUI() {
        view.backgroundColor = .white
        let titleStack = UIStackView(arrangedSubviews: [managerTitleLabel,serviceTitleLabel,reservationTitleLabel,costTitleLabel])
        titleStack.spacing = 20
        titleStack.distribution = .fillEqually
        titleStack.axis = .vertical
        
        view.addSubview(titleStack)
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalToSuperview().offset(30)
        }
        
        let inputStack = UIStackView(arrangedSubviews: [nameInputLabel,serviceInputLabel,dateLabel,costInputLabel])
        
        inputStack.spacing = 20
        inputStack.distribution = .fillEqually
        inputStack.axis = .vertical
        
        view.addSubview(inputStack)
        inputStack.snp.makeConstraints { make in
            make.leading.equalTo(titleStack.snp.trailing).offset(20)
            make.top.equalTo(titleStack.snp.top)
        }
        
        view.addSubview(ratingView)
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(inputStack.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ratingView.snp.bottom).offset(20)
        }
        
        
        view.addSubview(reviewTextView)
        reviewTextView.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(160)
        }
        
        view.addSubview(addImageButton)
        addImageButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(reviewTextView.snp.bottom).offset(30)
            make.height.width.equalTo(80)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.equalTo(addImageButton.snp.right).offset(20)
            make.top.equalTo(reviewTextView.snp.bottom).offset(30)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(80)
        }
    }
    
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "리뷰 작성하기"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "outline_done_black_36pt"), style: .done, target: self, action: #selector(handleDone))
        
    }
    func configure() {
        ratingView.settings.fillMode = .half
        ratingView.settings.starSize = 50
        reviewTextView.delegate = self
        
    }
    
    func configureCollectionView() {

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReviewPhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
            
    }

    //MARK: - selector
    @objc func handleDismissal(){
        dismiss(animated: false, completion: nil)
    }
    @objc func handleDone() {
        print("DEBUG : handle done button")
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

extension AddReviewController: UITextViewDelegate {
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "제가 바로 PlaceHolder입니다."
            textView.textColor = UIColor.lightGray
        }
    }
    
}

extension AddReviewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ReviewPhotoCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    
}

extension AddReviewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        var selectedImages = [UIImage]()
        
        picker.dismiss(animated: true, completion: nil)
        
        let group = DispatchGroup()
        
        results.forEach { result in
            group.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] reading,error in
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
