//
//  Utilities.swift
//  withpet_iOS
//
//  Created by doyun on 2022/02/04.
//

import UIKit

class Utilities {
    
    func makeLabel(with text:String,font size:Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: CGFloat(size))
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
//        tf.backgroundColor = .white
//        tf.text = placeholder
//        tf.textColor = .black
//        tf.textAlignment = .left
//        tf.font = .systemFont(ofSize: CGFloat(size))
//        tf.clearButtonMode = .whileEditing
//        tf.tintColor = .black
//        
////        tf.layer.addSublayer(border)
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
    
    func iconLabel(with icon: UIImage?,text :String) -> NSMutableAttributedString {
        // Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = icon
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 15, height: 15)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: text)
        completeText.append(textAfterIcon)
        
        return completeText
    }
}
