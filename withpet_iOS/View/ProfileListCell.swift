//
//  ProfileListCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/03.
//

import Foundation
import UIKit
import Then
import SnapKit

class ProfileListCell : UITableViewCell {
    
    var label = UILabel().then {
        $0.text = "text"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.textAlignment = .left
    }
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
