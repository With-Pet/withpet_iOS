//
//  ProfileViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import Foundation
import UIKit

class ProfileViewController : UITableViewController {
    
    private let section1 = ["내 프로필","내 반려동물 프로필"]
    private let section2 = ["찜한 돌봄이","찜한 반려 동물"]
    private let section3 = ["공지사항","FAQ","환경설정","로그아웃","회원 탈퇴"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return section1.count
        } else if section == 1 {
            return section2.count
        } else {
            return section3.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
}
