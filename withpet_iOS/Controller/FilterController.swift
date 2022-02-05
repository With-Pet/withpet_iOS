////
////  FilterViewController.swift
////  withpet_iOS
////
////  Created by doyun on 2022/02/02.
////
//
//import Foundation
//import UIKit
//
//class FileterController : UIViewController {
//    
//    //MARK: - Properties
//    private let nameLabel = UILabel().then {
//        $0.text = "서비스 종류"
//        $0.font = UIFont.systemFont(ofSize: 16)
//    }
//    
//    private let servicesSegment = UISegmentedControl(items: ["전체","산책","돌봄","체험"]).then {
//        $0.layer.borderColor = UIColor.blue.cgColor
//        $0.layer.borderWidth = 2
//        $0.selectedSegmentTintColor = .blue
//        $0.backgroundColor = .white
//        $0.tintColor = .blue
//        $0.addTarget(self, action: #selector(servicesSelect), for: .valueChanged)
//    }
//    
//    private let servicesFilterView = UIView()
//    
//    //MARK: - Lifecycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        configureUI()
//    }
//    
//    //MARK: - Configure
//    
//    func configureUI() {
//        servicesFilterView.addSubview(nameLabel)
//        
//        nameLabel.snp.makeConstraints { make in
//            make.top.equalTo(servicesFilterView.safeAreaLayoutGuide).offset(20)
//            make.left.equalToSuperview()
//        }
//        
//        servicesFilterView.addSubview(servicesSegment)
//        
//        servicesSegment.snp.makeConstraints { make in
//            make.size.width.equalTo(360)
//            make.size.height.equalTo(100)
//            make.center.equalToSuperview()
//        }
//        
//        let underline = UIView()
//        underline.backgroundColor = .lightGray
//        
//        servicesFilterView.addSubview(underline)
//        underline.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(20)
//            make.leading.equalToSuperview().offset(20)
//            make.height.equalTo(2)
//            make.bottom.equalToSuperview()
//        }
//        
//        view.addSubview(servicesFilterView)
//        servicesFilterView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(300)
//        }
//    }
//    //MARK: - selector
//    
//    @objc func servicesSelect() {
//        
//    }
//}
