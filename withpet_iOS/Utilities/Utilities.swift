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
        tf.placeholder = placeholder
        tf.textColor = .darkText
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }
    
    func layerTextField(text: String,inputView : UIView?) -> UITextField {
        let tf = UITextField()
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.text = text
        tf.textAlignment = .natural
        tf.font = .systemFont(ofSize: 20)
        tf.clearButtonMode = .whileEditing
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.addLeftPadding()
        
        if let inputView = inputView {
            tf.inputView = inputView
        }
        return tf
    }
//    func underlineTextField(withPlaceholder placeholder:String,font size:Int) -> UITextField {
//        let tf = UITextField()
//        tf.backgroundColor = .red
//        tf.text = placeholder
//        tf.textColor = .black
//        tf.textAlignment = .center
//        tf.font = .systemFont(ofSize: CGFloat(size))
//        tf.clearButtonMode = .always
//        let border = CALayer()
//        border.frame = CGRect(x: 0, y: tf.frame.size.height-1, width: tf.frame.width, height: 1)
//        border.backgroundColor = UIColor.black.cgColor
//        tf.layer.addSublayer(border)
//
//        return tf
//    }
    
    func heightForView(text:String,font:UIFont,width:CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
}
