//
//  Utilities.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/04.
//

import UIKit

class Utilities {
    
    func makeLabel(text:String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }
    
    func textField(withPlaceholder placeholder:String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.textColor = .darkText
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }
    
}
