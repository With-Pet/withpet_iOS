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
        
        let feedVC = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "outline_pets_black_36pt"), rootViewController: feedVC)
        
        let resvVC = ReservationController()
        let nav2 = templateNavigationController(image: UIImage(named: "outline_event_note_black_36pt"), rootViewController: resvVC)
        
        let postVC = PostStep1Controller()
        let nav3 = UINavigationController(rootViewController: postVC)
        
        let chatVC = ChatController()
        let nav4 = templateNavigationController(image: UIImage(named: "outline_chat_black_36pt"), rootViewController: chatVC)
        
        let profile = ProfileListController()
        let nav5 = templateNavigationController(image: UIImage(named: "outline_person_outline_black_36pt"), rootViewController: profile)
        
        setViewControllers([nav1,nav2,nav3,nav4,nav5], animated: false)
        tabBar.tintColor = .barColor
    }
    
    func templateNavigationController(image: UIImage?,rootViewController: UIViewController) -> UINavigationController{
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem.image = image
        return navigation
    }

    
    //MARK: - selector
    @objc func didTapPlusButton() {
        let nav = UINavigationController(rootViewController: PostStep1Controller())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false, completion: nil)
    }
}

