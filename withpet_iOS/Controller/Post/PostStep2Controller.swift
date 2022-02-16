//
//  PostStep2Controller.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit

class PostStep2Controller: UIViewController {

    //MARK: - Properties
    private let progressBar = SteppedProgressBar(frame: .zero, index: 1)
    
    private let infoLabel = UILabel().then {
        $0.text = "서비스 종류"
        $0.textColor = .black
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
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
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
    }

}
