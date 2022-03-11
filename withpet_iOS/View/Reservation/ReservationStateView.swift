//
//  ReservationStateView.swift
//  withpet_iOS
//
//  Created by Doyun Park on 2022/03/08.
//

import Foundation
import UIKit

class ReservationStateView : UIView {
    
    private var state: ReservationStateOption {
        didSet {
            stateLabel.text = state.description
            backgroundColor = state.color
        }
    }
    
    private var stateLabel = UILabel().then {
        $0.text = "이용 전"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    init(state: ReservationStateOption) {
        self.state = state
        
        super.init(frame: CGRect(x: 0, y: 0, width: state == .after ? 40 : 30, height: 25))
        backgroundColor = .mainColor

        layer.cornerRadius = 20 / 2

        addSubview(stateLabel)
        layer.masksToBounds = true
        stateLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(5)
            make.right.bottom.equalToSuperview().offset(-5)
        }
        
        stateLabel.text = state.description
        backgroundColor = state.color
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
