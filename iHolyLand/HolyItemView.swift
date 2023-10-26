//
//  HolyItemView.swift
//  iHolyLand
//
//  Created by duckmoutain on 2023/10/22.
//

import UIKit
import SnapKit
import MapKit

struct HolyLandModel {
    var coordinate  :   CLLocationCoordinate2D?
    var visitTime   :   Date?
    var title       :   String?
    var context     :   String?
    var images      :   NSMutableArray?
    var source      :   String?
}

class HolyItemView : UIView {
    var dataModel: HolyLandModel
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(dataModel: HolyLandModel) {
        self.dataModel = dataModel
        super.init(frame: .zero)
    }
    
    func layoutItemSubviews() {
        
        var formattedDate = ""
        if let unwrappedDate = dataModel.visitTime {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            formattedDate = formatter.string(from: unwrappedDate)
            print(formattedDate) // 输出格式化后的日期
        } else {
            print("Date is nil")
        }
        
        let titleLabel = UILabel()
        titleLabel.text = dataModel.title ?? "unknow"
        titleLabel.text = (titleLabel.text ?? "unknow") + formattedDate
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        let contextLabel = UILabel()
        contextLabel.text = dataModel.context ?? "unknow"
        contextLabel.font = UIFont.systemFont(ofSize: 14)
        contextLabel.numberOfLines = 0
        
        self.addSubview(titleLabel)
        self.addSubview(contextLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-12)
        }
        contextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-12)
        }
    }
}
