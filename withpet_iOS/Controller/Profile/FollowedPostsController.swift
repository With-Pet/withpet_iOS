//
//  FollowedPetsController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/14.
//

import UIKit

private let reuseIdentifier = "FollowedPostCell"
class FollowedPostsController: UITableViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavigationbar()
        
    }

    //MARK: - Configure
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "찜한 게시물"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
    }
    
    func configure(){
        view.backgroundColor = .white
        tableView.rowHeight = 140
        tableView.separatorStyle = .none
        tableView.register(FollowedPostCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: - selector
    @objc func handleDismissal() {
        dismiss(animated: false, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FollowedPostCell
        return cell
    }
    

}
