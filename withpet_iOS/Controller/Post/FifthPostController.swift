//
//  PostStep2Controller.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit

private let reuseIdentifier = "ServiceCell"
class FifthPostController: UIViewController {
    
    //MARK: - Properties
    private let services = ["또띠아",
                            "버터",
                            "달걀",
                            "치즈볼",
                            "쪽파",
                            "진미채",
                            "참외",
                            "케이크",
                            "새우",
                            "대패삼겹살"]
    private var isSelected = Array(repeating: false, count: 10)
    
    private let progressBar = SteppedProgressBar(frame: .zero, index: 4)
    private var collectionView : UICollectionView!
    
    private let titleLabel = UILabel().then {
        $0.text = "제목"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let titleTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.clearButtonMode = .whileEditing
        $0.textAlignment = .left
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "비용/보상"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let priceTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "보상을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.clearButtonMode = .whileEditing
        $0.textAlignment = .left
    }
    
    private let unitLabel = UILabel().then {
        $0.text = "원/시간"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let locationLabel = UILabel().then {
        $0.text = "동네"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    private let locationButton = UIButton().then {
        $0.setTitle("논현 1동 ", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        $0.setTitleColor(.darkGray, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .center
        $0.semanticContentAttribute = .forceRightToLeft
        
        $0.tintColor = .darkGray
        $0.addTarget(self, action: #selector(didTapSelectLocation), for: .touchUpInside)
    }
    
    private let serviceLabel = UILabel().then {
        $0.text = "서비스 상세"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let requireLabel = UILabel().then {
        $0.text = "요청 사항"
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    private lazy var requireTextView = UITextView().then {
        $0.text = "현재 6세 말티즈를 키우고 있으며, 자격증을 보유하고 있습니다."
        $0.backgroundColor = .white
        $0.textColor = .lightGray
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 14)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
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
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(progressBar.snp.bottom).offset(14)
        }
        
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.width.equalTo(300)
            make.right.equalToSuperview().offset(-16)
            
        }
        
        let section1 = UIView()
        section1.backgroundColor = .lightGray
        
        view.addSubview(section1)
        section1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
        }
        
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(section1.snp.bottom).offset(14)
        }
        
        view.addSubview(unitLabel)
        unitLabel.snp.makeConstraints { make in
            make.centerY.equalTo(priceLabel.snp.centerY)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(priceTextField)
        priceTextField.snp.makeConstraints { make in
            make.left.equalTo(titleTextField.snp.left)
            make.right.equalTo(unitLabel.snp.left)
            make.centerY.equalTo(unitLabel.snp.centerY)
        }
        
        let section2 = UIView()
        section2.backgroundColor = .lightGray
        
        view.addSubview(section2)
        section2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(priceTextField.snp.bottom).offset(14)
        }
        
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(section2.snp.bottom).offset(14)
        }
        
        view.addSubview(locationButton)
        locationButton.snp.makeConstraints { make in
            make.centerY.equalTo(locationLabel.snp.centerY)
            make.right.equalToSuperview().offset(-15)
        }
        
        let section3 = UIView()
        section3.backgroundColor = .lightGray
        
        view.addSubview(section3)
        section3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(locationLabel.snp.bottom).offset(14)
        }
        
        view.addSubview(serviceLabel)
        serviceLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(section3.snp.bottom).offset(14)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(serviceLabel.snp.bottom).offset(20)
            make.height.equalTo(100)
        }
        
        let section4 = UIView()
        section4.backgroundColor = .lightGray
        
        view.addSubview(section4)
        section4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.top.equalTo(collectionView.snp.bottom).offset(14)
        }
        
        view.addSubview(requireLabel)
        requireLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(section4.snp.bottom).offset(14)
        }
        
        view.addSubview(requireTextView)
        requireTextView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(requireLabel.snp.bottom).offset(20)
            make.height.equalTo(180)
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
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 5, left: 10, bottom: 5, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.allowsMultipleSelection = true
        collectionView.register(ServiceCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    //MARK: - selector
    @objc func didTapNextstep() {
        let vc = LastPostController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func didTapPreviousstep() {
        navigationController?.popViewController(animated: true)
    }
    @objc func didTapSelectLocation() {
        print("DEBUG : tap location")
    }
}

extension FifthPostController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ServiceCell
        cell.configure(name: services[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelected[indexPath.row] = !isSelected[indexPath.row]
        
        let cell = collectionView.cellForItem(at: indexPath) as! ServiceCell
        cell.isSelected = isSelected[indexPath.row]
        
    }
    
    private func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: IndexPath) {
        
        isSelected[indexPath.row] = !isSelected[indexPath.row]
        
        let cell = collectionView.cellForItem(at: indexPath) as! ServiceCell
        cell.isSelected = isSelected[indexPath.row]
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        isSelected[indexPath.row].toggle()
        
        let cell = collectionView.cellForItem(at: indexPath) as! ServiceCell
        cell.isSelected = isSelected[indexPath.row]
    }
    
    
}
extension FifthPostController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ServiceCell.fittingSize(availableHeight: 35, name: services[indexPath.item])
    }
}
