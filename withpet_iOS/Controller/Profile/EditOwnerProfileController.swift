//
//  EditOwnerProfileController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/05.
//

import UIKit

private let headerIdentifier = "EditProfileHeader"
private let reuseIdentifier = "CertificationCell"
class EditOwnerProfileController: UICollectionViewController {
    
    private let imagePicker = UIImagePickerController()
    
    private var selectedImage:UIImage? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationbar()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(EditOwnerProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.register(CertificationCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "내 프로필"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "outline_done_black_36pt"), style: .done, target: self, action: #selector(handleDone))
    }
    func configureImagePicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }

    //MARK: - selector
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
    @objc func handleDone() {
        dismiss(animated: true, completion: nil)
    }
}

extension EditOwnerProfileController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! EditOwnerProfileHeader
            header.delegate = self
            header.selectedImage = self.selectedImage
            return header
        default :
            return UICollectionReusableView()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CertificationCell
        return cell
    }
}

//MARK: - CollectionViewDelegateFlowLayout
extension EditOwnerProfileController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 870)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 110)
    }
}

extension EditOwnerProfileController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        self.selectedImage = image
        
        dismiss(animated: true, completion: nil)
    }
}

extension EditOwnerProfileController : EditOwnerProfileHeaderDelegate {
    func handleAddCetification() {
        let addCertificationVC = AddCertificationController()
        addCertificationVC.delegate = self
        present(addCertificationVC, animated: true, completion:nil)
    }
    
    func didTapChangeProfilePhoto() {
        present(imagePicker,animated: true,completion: nil)
        print("DEBUG: Handle Change Photo")
    }
}
//MARK: - AddCertificationControllerDelegate
extension EditOwnerProfileController : AddCertificationControllerDelegate {
    func addCerticiation(CertificationName title: String, CertificationSource source: String, CertificationDate date: Date) {
        print("title : \(title)")
        print("source : \(source)")
        print("Date : \(date)")
    }
}



