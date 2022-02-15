//
//  FollowedCareController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/14.
//

import UIKit

private let reuseIdentifier = "FollowedCareCell"
class FollowedCaresController: UITableViewController {

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationbar()
        view.backgroundColor = .white
        tableView.register(FollowedCareCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 250
    }
    
    //MARK: - Configure
    func configureNavigationbar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "찜한 돌봄이"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
    }
    
    //MARK: - selector
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FollowedCareCell

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OwnerProfileController()
        navigationController?.pushViewController(vc, animated: false)
    }

}
