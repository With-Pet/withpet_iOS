//
//  FeedViewController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/01.
//

import UIKit

private let reuseIdentifier = "petCell"

class FeedController: UITableViewController {
    
    //MARK: - Properties
    private lazy var actionButton = UIButton().then {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "marker")
        imageAttachment.bounds = CGRect(x: 10, y: -7, width: 30, height: 30)
        
        let attributedTitle = NSMutableAttributedString(attributedString: NSAttributedString(attachment: imageAttachment))
        attributedTitle.append(NSAttributedString(string: " postion", attributes: [.font : UIFont.systemFont(ofSize: 30), .foregroundColor : UIColor.systemGray]))
        
        $0.setAttributedTitle(attributedTitle, for: .normal)
        $0.titleLabel?.textAlignment = .left
        $0.frame = CGRect(x: 20, y: 0, width: 64, height: 32)
        $0.addTarget(self, action: #selector(handleLocationButton), for: .touchUpInside)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
    }
    //MARK: - Configure
    func configureUI() {
        view.backgroundColor = .white
        tableView.register(PetFeedCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
    }
    func setNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: actionButton)
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .plain, target: self, action: #selector(handleFilterButton))
        let glassButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(handleSearchButton))
        navigationItem.rightBarButtonItems = [glassButton,filterButton]
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
    //MARK: - Selector
    @objc func handleLocationButton() {
        print("csadfsdfs")
    }
    
    @objc func handleFilterButton() {
//        let vc = FileterViewController()
//        navigationController?.pushViewController(vc, animated: false)
        
        print("DEBUG : clicked filter button")
    }
    
    @objc func handleSearchButton() {
        let nav = UINavigationController(rootViewController: SearchController())
        nav.modalPresentationStyle = .fullScreen
        present(nav,animated: false)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? PetFeedCell else { return UITableViewCell()}
        
        return cell
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
