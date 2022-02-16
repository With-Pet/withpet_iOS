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
    
    //MARK: - Properties
    var icon = UIImageView().then {
        $0.backgroundColor = .white
        $0.tintColor = .black

    }
    var label = UILabel().then {
        $0.text = "text"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textAlignment = .left
    }
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        addSubview(icon)
        icon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(30)
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
