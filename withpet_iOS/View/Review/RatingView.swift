//
//  RatingView.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/09.
//

import UIKit
import Cosmos

class RatingView: UIView {

    private let cosmosView = CosmosView(settings: .default)
    
    private let ratingLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .black
        $0.text = "4.7"
    }

    private let point5progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.trackTintColor = .lightGray
        $0.progressTintColor = .orange
        $0.setProgress(0.7, animated: false)
    }

    private let five = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.text = "5점"
    }
    
    private let fiveCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
        $0.text = "46"
    }
    
    private let point4progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.trackTintColor = .lightGray
        $0.progressTintColor = .orange
        $0.setProgress(0.2, animated: false)
    }
    
    private let four = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.text = "4점"
    }
    
    private let fourCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
        $0.text = "10"
    }
    
    private let point3progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.trackTintColor = .lightGray
        $0.progressTintColor = .orange
        $0.setProgress(0.15, animated: false)
    }
    
    private let three = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.text = "3점"
    }
    
    private let threeCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
        $0.text = "8"
    }
    
    private let point2progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.trackTintColor = .lightGray
        $0.progressTintColor = .orange
        $0.setProgress(0, animated: false)
    }
    
    private let two = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.text = "2점"
    }
    
    private let twoCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
        $0.text = "0"
    }
    
    private let point1progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.trackTintColor = .lightGray
        $0.progressTintColor = .orange
        
        $0.setProgress(0, animated: false)
    }
    
    private let one = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.text = "1점"
    }
    
    private let oneCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
        $0.text = "0"
    }
    
    private lazy var progressContainter = UIView().then {
        $0.backgroundColor = .white
        
        $0.addSubview(five)
        five.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            
        }
        
        $0.addSubview(fiveCount)
        fiveCount.snp.makeConstraints { make in
            make.centerY.equalTo(five.snp.centerY)
            make.right.equalToSuperview().offset(-5)
        }
        
        $0.addSubview(point5progressBar)
        point5progressBar.snp.makeConstraints { make in
            make.left.equalTo(five.snp.right).offset(5)
//            make.right.equalTo(fiveCount.snp.left).offset(-5)
            make.width.equalTo(160)
            make.centerY.equalTo(five.snp.centerY)
            make.height.equalTo(4)
        }
        
        $0.addSubview(four)
        four.snp.makeConstraints { make in
            make.centerX.equalTo(five.snp.centerX)
            make.top.equalTo(five.snp.bottom).offset(5)
        }
        
        $0.addSubview(fourCount)
        fourCount.snp.makeConstraints { make in
            make.centerY.equalTo(four.snp.centerY)
            make.right.equalTo(fiveCount.snp.right)
        }
        
        $0.addSubview(point4progressBar)
        point4progressBar.snp.makeConstraints { make in
            make.left.equalTo(four.snp.right).offset(5)
            make.width.equalTo(160)
            make.centerY.equalTo(four.snp.centerY)
            make.height.equalTo(4)
        }
        
        $0.addSubview(three)
        three.snp.makeConstraints { make in
            make.centerX.equalTo(four.snp.centerX)
            make.top.equalTo(four.snp.bottom).offset(5)
        }
        
        $0.addSubview(threeCount)
        threeCount.snp.makeConstraints { make in
            make.centerY.equalTo(three.snp.centerY)
            make.centerX.equalTo(fourCount.snp.centerX)
        }
        
        $0.addSubview(point3progressBar)
        point3progressBar.snp.makeConstraints { make in
            make.left.equalTo(three.snp.right).offset(5)
            make.width.equalTo(160)
            make.centerY.equalTo(three.snp.centerY)
            make.height.equalTo(4)
        }
        
        $0.addSubview(two)
        two.snp.makeConstraints { make in
            make.centerX.equalTo(four.snp.centerX)
            make.top.equalTo(three.snp.bottom).offset(5)
        }
        
        $0.addSubview(twoCount)
        twoCount.snp.makeConstraints { make in
            make.centerY.equalTo(two.snp.centerY)
            make.centerX.equalTo(fourCount.snp.centerX)
        }

        $0.addSubview(point2progressBar)
        point2progressBar.snp.makeConstraints { make in
            make.left.equalTo(two.snp.right).offset(5)
            make.width.equalTo(160)
            make.centerY.equalTo(two.snp.centerY)
            make.height.equalTo(4)
        }
        
        $0.addSubview(one)
        one.snp.makeConstraints { make in
            make.centerX.equalTo(four.snp.centerX)
            make.top.equalTo(two.snp.bottom).offset(5)
        }
        
        $0.addSubview(oneCount)
        oneCount.snp.makeConstraints { make in
            make.centerY.equalTo(one.snp.centerY)
            make.centerX.equalTo(fourCount.snp.centerX)
        }

        $0.addSubview(point1progressBar)
        point1progressBar.snp.makeConstraints { make in
            make.left.equalTo(one.snp.right).offset(5)
            make.width.equalTo(160)
            make.centerY.equalTo(one.snp.centerY)
            make.height.equalTo(4)
        }
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        configure()
        
        backgroundColor = .white
        cosmosView.rating = 4.7
        addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(60)
        }
        
        addSubview(cosmosView)
        cosmosView.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        addSubview(progressContainter)
        progressContainter.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Configure
    func configure() {
        cosmosView.settings.updateOnTouch = false
        
        cosmosView.settings.fillMode = .half
        cosmosView.settings.starMargin = 5
        cosmosView.settings.filledColor = .orange
        
        // Set the border color of an empty star
        cosmosView.settings.emptyBorderColor = UIColor.orange
        
        // Set the border color of a filled star
        cosmosView.settings.filledBorderColor = UIColor.orange
    }
    

    
    
}
