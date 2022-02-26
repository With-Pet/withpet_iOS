//
//  SearchController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/02.
//

import Foundation
import UIKit

class SearchController: UITableViewController {
    
    //MARK: - Properties
    private var collectionView: UICollectionView!
    
    private var isSearchMode:Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureCollectionView()
        configureUI()
    }
    
    //MARK: - Configure
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.title = "동네 설정"
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "정보를 입력해주세요!"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - selector
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        print("DEBUG : searchText")
    }
}
extension SearchController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.reuseIdentifier, for: indexPath) as! FeedCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
}
