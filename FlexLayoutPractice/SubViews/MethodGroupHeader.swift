//
//  MethodGroupHeader.swift
//  FlexLayoutPractice
//
//  Created by KIM HOSE on 2022/04/28.
//

import UIKit

final class MethodGroupHeader: UITableViewHeaderFooterView {
    static let reuseIdentifier = "MethodGroupHeader"
    static let height: CGFloat = 50
    
    fileprivate let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.sizeToFit()
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Center the label vertically. Note that we don't need to specify the size, it has already be adjusted in init().
        titleLabel.pin.horizontally(pin.safeArea.left + 12).vCenter()
    }
}
