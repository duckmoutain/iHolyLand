//
//  HolyItemView.swift
//  iHolyLand
//
//  Created by duckmoutain on 2023/10/22.
//

import UIKit
import SnapKit

class HolyItemView : UIView {
    var _title: String?
    var title: String? {
        set {
            _title = newValue
        }
        get {
            return _title
        }
    }
    
    var _textContext : String?
    var textContext : String? {
        set {
            _textContext = newValue
        }
        get {
            return _textContext
        }
    }
    
    var _imageUrl : String?
    var imageUrl : String? {
        set {
            _imageUrl = newValue
        }
        get {
            return _imageUrl
        }
    }
    
    func layoutItemSubviews() {
        let label = UILabel()
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 32)
        
        let contextLabel = UILabel()
        contextLabel.text = textContext
        contextLabel.font = UIFont.systemFont(ofSize: 14)
        contextLabel.numberOfLines = 0
        
        self.addSubview(label)
        self.addSubview(contextLabel)
        label.snp.makeConstraints { make in
            make.left.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-12)
        }
        contextLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(12)
            make.left.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-12)
        }
    }
}
