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
        $0.setImage( UIImage(named: "outline_place_black_36pt"), for: .normal)
        $0.setTitle(" postion", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 26)
        $0.titleLabel?.textAlignment = .left
        $0.frame = CGRect(x: 20, y: 0, width: 20, height: 20)
        $0.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
    }
    
    private let filterButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)).then {
        $0.setImage(UIImage(named: "outline_filter_list_black_36pt"), for: .normal)
        $0.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    }
    
    private let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)).then {
        $0.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        $0.setImage(UIImage(named: "outline_search_black_36pt"), for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
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
        tableView.register(PostFeedCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
    }
    func setNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .darkGray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: actionButton)
        let filterButton = UIBarButtonItem(customView: filterButton)
        let glassButton = UIBarButtonItem(customView: searchButton)
        navigationItem.rightBarButtonItems = [glassButton,filterButton]
        
    }
    
    //MARK: - Selector
    @objc func handleLocationButton() {
        print("csadfsdfs")
    }
    
    @objc func handleFilterButton() {
        print("DEBUG : clicked filter button")
    }
    
    @objc func handleSearchButton() {
        print("DEBUG : clicked search Button")
        let vc = SearchController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? PostFeedCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        return cell
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
