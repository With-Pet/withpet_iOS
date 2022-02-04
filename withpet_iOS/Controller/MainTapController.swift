//
//  ViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import UIKit
import SnapKit
import Then

class MainTapController: UITabBarController {
    
    let actionButton = UIButton().then {
        $0.tintColor = .white
        $0.backgroundColor = .mainColor
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.white.cgColor
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.addTarget(self, action: #selector(didTapPlusButton), for:.touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTapbar()
        setCircleButton()
        // Do any additional setup after loading the view.
    }

    //MARK: - Configure

    func setCircleButton() {
        
        view.addSubview(actionButton)
        
        actionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-55)
            make.width.height.equalTo(60)
        }
        actionButton.layer.cornerRadius = 60/2
    }
    
    func configureTapbar() {
        
        let feedVC = FeedViewController()
        let nav1 = templateNavigationController(image: UIImage(systemName: "house"), rootViewController: feedVC)
        
        let resvVC = ReservationViewController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "list.bullet.rectangle"), rootViewController: resvVC)
        
        let chatVC = ChatViewController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "message"), rootViewController: chatVC)
        
        
        let profile = ProfileViewController()
        let nav4 = templateNavigationController(image: UIImage(systemName: "person"), rootViewController: profile)
        
        setViewControllers([nav1,nav2,nav3,nav4], animated: false)
        
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.mainColor.cgColor
        tabBar.tintColor = .mainColor
    }
    
    func templateNavigationController(image: UIImage?,rootViewController: UIViewController) -> UINavigationController{
        
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem.image = image
        return navigation
    }

    
    //MARK: - selector
    @objc func didTapPlusButton() {
        let nav = UINavigationController(rootViewController: PostViewController())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
}

