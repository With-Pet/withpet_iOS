//
//  Extension.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/04.
//

import Foundation
import UIKit

extension UIColor {
    
    static func hexStringToUIColor(_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static let mainColor = UIColor.hexStringToUIColor("6667AB")
    
    static let barColor = UIColor.hexStringToUIColor("373D7B")
    
    static let currentProgressColor = UIColor.hexStringToUIColor("54BF00")
}

extension UITextField {
    
    func addLeftPadding(image: UIImage?) {
        
        if let image = image {
            let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            leftImageView.contentMode = .scaleToFill
            leftImageView.image = image
            self.leftView = leftImageView
        } else {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
            self.leftView = paddingView
        }
        self.leftViewMode = ViewMode.always
    }
    
    func setDatePicker(target: Any, selector: Selector) {
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 200))
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent

        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: bounds.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancel = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "확인", style: .done, target: target, action: selector)
        
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}
