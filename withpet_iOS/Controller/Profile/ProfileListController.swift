//
//  ProfileViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import Foundation
import UIKit

private let reuseIdentifier = "ProfileListCell"

class ProfileListController : UITableViewController {
    
    private let list = ["내 프로필 관리하기","반려동물 프로필 관리하기","찜한 게시물","찜한 돌봄이","공지사항","FAQ","환경설정","로그아웃","회원 탈퇴"]

    private let icon = [UIImage(named: "person"),UIImage(named:"pets"),
                        UIImage(named: "star"),UIImage(named: "favorite")
                        ,UIImage(named: "campaign"),UIImage(named: "help")
                        ,UIImage(named: "settings"),UIImage(named: "logout")
                        ,UIImage(named: "person_remove")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Profile"
        view.backgroundColor = .white
        tableView.register(ProfileListCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.isScrollEnabled = false
        tableView.separatorInset.left = 0
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProfileListCell else { return UITableViewCell() }
        cell.label.text = list[indexPath.row]
        cell.icon.image = icon[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0 :
            let editProfileVC = UINavigationController(rootViewController: EditOwnerProfileController(collectionViewLayout: UICollectionViewFlowLayout()))
            editProfileVC.modalPresentationStyle = .fullScreen
            present(editProfileVC, animated: false, completion: nil)
        case 1:
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 20
            let MyPetVC = UINavigationController(rootViewController: MyPetsController(collectionViewLayout: layout))
            MyPetVC.modalPresentationStyle = .fullScreen
            present(MyPetVC, animated: false, completion: nil)
        case 2:
            let followedCareVC = UINavigationController(rootViewController: FollowedCaresController())
            followedCareVC.modalPresentationStyle = .fullScreen
            present(followedCareVC,animated: false)
        case 3:
            let followedPostVC = UINavigationController(rootViewController: FollowedPostsController())
            followedPostVC.modalPresentationStyle = .fullScreen
            present(followedPostVC,animated: false)
        case 4:
            let addReviewsVC = UINavigationController(rootViewController: AddReviewController())
            addReviewsVC.modalPresentationStyle = .fullScreen
            present(addReviewsVC,animated: false)
        case 5 :
            let loginVC = LoginController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC,animated: false)
        case 6:
            let registerVC = UINavigationController(rootViewController: RegisterController())
            registerVC.modalPresentationStyle = .fullScreen
            present(registerVC,animated: false)
        case 7 :
            let vc = UINavigationController(rootViewController: OwnerProfileController())
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: false)
        default:
            print("HEllo")
        }

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
