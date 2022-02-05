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
    
    private var isSearchMode:Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
        configureSearchController()
    }
    
    //MARK: - Configure
    
    func configureUI() {
        view.backgroundColor = .white
    }
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "정보를 입력해주세요!"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
        print("DEBUG : Dismissal")
    }
}

extension SearchController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        print("DEBUG : searchText")
    }

}
