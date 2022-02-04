//
//  ProfileViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import Foundation
import UIKit

private let reuseIdentifier = "ProfileListCell"

class ProfileViewController : UITableViewController {
    
    private let list = ["내 프로필","내 반려동물 프로필","찜한 돌봄이","찜한 반려 동물","공지사항","FAQ","환경설정","로그아웃","회원 탈퇴"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Profile"
        view.backgroundColor = .white
        tableView.register(ProfileListCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProfileListCell else { return UITableViewCell() }
        cell.label.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let ownerVC = OwnerViewController()
            navigationController?.pushViewController(ownerVC, animated: false)
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
