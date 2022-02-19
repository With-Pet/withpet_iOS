//
//  PostStep2Controller.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit

class SecondPostController: UIViewController {

    //MARK: - Properties
    private let progressBar = SteppedProgressBar(frame: .zero, index: 1)
    
    private var selectButtons = [UIButton]()
    private var selectLabels = [UILabel]()
    
    private var selectIndex : Int? {
        didSet {
            if oldValue == nil && selectIndex != nil{
                selectButtons[selectIndex!-1].layer.borderColor = UIColor.mainColor.cgColor
                selectLabels[selectIndex!-1].textColor = .mainColor
            } else if oldValue != nil && selectIndex == nil {
                selectButtons[oldValue!-1].layer.borderColor = UIColor.lightGray.cgColor
                selectLabels[oldValue!-1].textColor = .lightGray
            } else {
                selectButtons[oldValue!-1].layer.borderColor = UIColor.lightGray.cgColor
                selectLabels[oldValue!-1].textColor = .lightGray
                
                selectButtons[selectIndex!-1].layer.borderColor = UIColor.mainColor.cgColor
                selectLabels[selectIndex!-1].textColor = .mainColor
            }
        }
    }
    private let infoLabel = UILabel().then {
        $0.text = "서비스 종류"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private var walkButton = UIButton(type: .system).then{
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.setImage(UIImage(named: "walk"), for: .normal)
        $0.tag = 1
        $0.contentHorizontalAlignment = .center
        $0.imageEdgeInsets = UIEdgeInsets(top: 20, left: 25, bottom: 25, right: 20)
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 120 / 2
        $0.addTarget(self, action: #selector(didTapSelectButton(_:)), for: .touchUpInside)
    }
    
    private let walkLabel = UILabel().then {
        $0.text = "산책"
        $0.textColor = .lightGray
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private var careButton = UIButton(type: .system).then{
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.setImage(UIImage(named: "care"), for: .normal)
        $0.tag = 2
        $0.contentHorizontalAlignment = .center
        $0.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 120 / 2
        $0.addTarget(self, action: #selector(didTapSelectButton(_:)), for: .touchUpInside)
    }
    
    private let careLabel = UILabel().then {
        $0.text = "돌봄"
        $0.textColor = .lightGray
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private var exprienceButton = UIButton(type: .system).then{
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.setImage(UIImage(named: "exprience"), for: .normal)
        $0.tag = 3
        $0.contentHorizontalAlignment = .center
        $0.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 120 / 2
        $0.addTarget(self, action: #selector(didTapSelectButton(_:)), for: .touchUpInside)
    }
    
    private let exprienceLabel = UILabel().then {
        $0.text = "체험"
        $0.textColor = .lightGray
        $0.font = .boldSystemFont(ofSize: 24)
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
        configure()
        configureUI()
        // Do any additional setup after loading the view.
    }

    //MARK: - Configure
    func configure(){
        selectButtons.append(walkButton)
        selectButtons.append(careButton)
        selectButtons.append(exprienceButton)
        
        selectLabels.append(walkLabel)
        selectLabels.append(careLabel)
        selectLabels.append(exprienceLabel)
    }
    
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
        
        view.addSubview(walkButton)
        walkButton.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.top.equalTo(infoLabel.snp.bottom).offset(60)
            make.left.equalToSuperview().offset(47)
        }
        
        view.addSubview(walkLabel)
        walkLabel.snp.makeConstraints { make in
            make.centerX.equalTo(walkButton.snp.centerX)
            make.top.equalTo(walkButton.snp.bottom).offset(10)
        }
        
        view.addSubview(careButton)
        careButton.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.centerY.equalTo(walkButton.snp.centerY)
            make.right.equalToSuperview().offset(-47)
        }
        
        view.addSubview(careLabel)
        careLabel.snp.makeConstraints { make in
            make.centerX.equalTo(careButton.snp.centerX)
            make.top.equalTo(careButton.snp.bottom).offset(10)
        }
        
        view.addSubview(exprienceButton)
        exprienceButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(careButton.snp.bottom).offset(80)
            make.width.height.equalTo(120)
        }
        
        view.addSubview(exprienceLabel)
        exprienceLabel.snp.makeConstraints { make in
            make.centerX.equalTo(exprienceButton.snp.centerX)
            make.top.equalTo(exprienceButton.snp.bottom).offset(10)
        }

    }
    
    //MARK: - selector
    @objc func didTapNextstep() {
        if selectIndex != nil {
            let vc = ThirdPostController()
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let alert = UIAlertController(title: "하나의 서비스를 반드시 선택해주세요!", message: .none, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인" , style: .default))
            
            present(alert,animated: true)
        }
    }
    @objc func didTapPreviousstep() {
        navigationController?.popViewController(animated: true)
    }
    @objc func didTapSelectButton(_ sender:Any){
        guard let tag = (sender as? UIButton)?.tag else {
            return
        }
        
        if selectIndex == nil {
            selectIndex = tag
        } else {
            if selectIndex == tag {
                selectIndex = nil
            } else {
                selectIndex = tag
            }
        }
    }
}
