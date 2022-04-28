//
//  HouseCell.swift
//  FlexLayoutPractice
//
//  Created by KIM HOSE on 2022/04/28.
//

import UIKit
import FlexLayout

class HouseCell: UICollectionViewCell {
  static let reuseIdentifier = "HouseCell"
  fileprivate let nameLabel = UILabel()
  fileprivate let mainImage = UIImageView()
  fileprivate let priceLabel = UILabel()
  fileprivate let distanceLabel = UILabel()
  private var height: CGFloat = 300
  
  fileprivate let padding: CGFloat = 8
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let footerBackgroundColor = UIColor.gray.withAlphaComponent(0.2)
    backgroundColor = .white
    
    nameLabel.font = UIFont.systemFont(ofSize: 24)
    nameLabel.textColor = .white
    nameLabel.numberOfLines = 0
    
    mainImage.backgroundColor = .black
    mainImage.contentMode = .scaleAspectFill
    mainImage.clipsToBounds = true
    
    distanceLabel.textAlignment = .right
    
    contentView.flex.define { (flex) in
      flex.addItem().backgroundColor(.gray).paddingHorizontal(padding).define({ (flex) in
        flex.addItem(nameLabel).grow(1)
      })
      
      flex.addItem(mainImage).height(300)
      
      flex.addItem().direction(.row).justifyContent(.spaceBetween).padding(6, padding, 6, padding).backgroundColor(footerBackgroundColor)
        .define({ (flex) in
          flex.addItem(priceLabel)
          flex.addItem(distanceLabel).grow(1)
        })
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(house: House) {

    nameLabel.text = house.name
    nameLabel.flex.markDirty()
    
    mainImage.download(url: house.mainImageURL)
    mainImage.flex.markDirty()
    
    
    priceLabel.text = house.price
    priceLabel.flex.markDirty()
    
    distanceLabel.text = "\(house.distance) KM"
    distanceLabel.flex.markDirty()
    
    setNeedsLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    
    layout()
    return contentView.frame.size
  }
  private func layout() {
    contentView.flex.layout(mode: .adjustHeight)
  }
}
