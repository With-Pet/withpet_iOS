//
//  ServiceCell.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/19.
//

import UIKit

class ServiceCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ServiceCell"
    
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = ServiceCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        return cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    override var isSelected:Bool {
        didSet {
            backgroundColor = isSelected ? .mainColor : .lightGray
        }
    }
    
    private let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    private func setupView() {
        backgroundColor = .lightGray

        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configure(name: String?) {
        titleLabel.text = name
    }
}
