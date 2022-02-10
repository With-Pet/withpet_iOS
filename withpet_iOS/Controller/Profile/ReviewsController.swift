//
//  ReviewsController.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/05.
//

import UIKit

private let reuseIdentifier = "ReviewCell"
class ReviewsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureNav()
        tableView.register(ReviewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.reloadData()
        
    }
    
    //MARK: - configure
    func configureNav(){
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "리뷰"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(handleDismissal))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "outline_settings_black_24pt_1x"), style: .plain, target: self, action: #selector(didTapSetting))
    }

    //MARK: - selector
    @objc func handleDismissal() {
        dismiss(animated: false, completion: nil)
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ReviewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //             Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            //             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            print("Hello")
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
}
