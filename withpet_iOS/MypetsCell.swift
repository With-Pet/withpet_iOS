//
//  PetFeedCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/02.
//

import Foundation
import UIKit

class PetFeedCell: UITableViewCell {
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
