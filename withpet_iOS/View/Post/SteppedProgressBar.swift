//
//  SteppedProgressBar.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/16.
//

import UIKit
import FlexibleSteppedProgressBar

class SteppedProgressBar: UIView {
    
    var progressBar : FlexibleSteppedProgressBar!
    
    var index : Int!
    
    init(frame: CGRect,index: Int) {
        self.index = index
        super.init(frame: frame)
        configure()
        backgroundColor = .white
        
        addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        progressBar = FlexibleSteppedProgressBar()
        
        progressBar.numberOfPoints = 6
        progressBar.lineHeight = 3
        progressBar.radius = 18
        progressBar.progressRadius = 18
        progressBar.progressLineHeight = 0
        progressBar.delegate = self
        progressBar.currentIndex = index
        progressBar.selectedOuterCircleLineWidth = 0

        progressBar.currentSelectedTextColor = .darkGray
        
        progressBar.currentSelectedCenterColor = .currentProgressColor
        progressBar.backgroundShapeColor = .lightGray
        progressBar.selectedBackgoundColor = .mainColor
        
        progressBar.centerLayerTextColor = .white
        progressBar.stepTextColor = .black
        progressBar.stepTextFont = .systemFont(ofSize: 12)

    }
}

//MARK: - FlexibleSteppedProgressBarDelegate
extension SteppedProgressBar : FlexibleSteppedProgressBarDelegate {
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if position == FlexibleSteppedProgressBarTextLocation.bottom {
            switch index {
            case 0 : return "반려동물 선택"
            case 1: return "서비스 종류"
            case 2: return "날짜 선택"
            case 3: return "사전 등록"
            case 4: return "세부사항"
            default: return "최종확인"
            }
        }else if position == FlexibleSteppedProgressBarTextLocation.center {
            switch index {
                
            case 0: return "1"
            case 1: return "2"
            case 2: return "3"
            case 3: return "4"
            case 4: return "5"
            default: return "6"
            }
            
        }
        return ""
    }
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, canSelectItemAtIndex index: Int) -> Bool {
        return false
    }
}
