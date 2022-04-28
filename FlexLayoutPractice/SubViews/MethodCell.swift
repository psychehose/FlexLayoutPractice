//
//  MethodCell.swift
//  FlexLayoutPractice
//
//  Created by KIM HOSE on 2022/04/28.
//

import UIKit
import PinLayout
import FlexLayout

final class MethodCell: UITableViewCell {
  static let reuseIdentifier = "MethodCell"
  
  private let padding: CGFloat = 10
  private let nameLabel = UILabel()
  private let descriptionLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    selectionStyle = .none
    separatorInset = .zero
    
    let imageView = UIImageView(
      image: UIImage(systemName: "drop")
    )
    nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
    nameLabel.lineBreakMode = .byTruncatingTail
    
    descriptionLabel.font = UIFont.systemFont(ofSize: 12)
    descriptionLabel.numberOfLines = 0
    
    contentView.flex.padding(12).define { flex in
      flex.addItem().direction(.row).define { flex in
        flex.addItem(imageView).size(30)
        flex.addItem(nameLabel).marginLeft(padding).grow(1)
      }
      flex.addItem(descriptionLabel).marginTop(padding)
    }
    
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
  }
}

extension MethodCell {
  func configure(method: Method) {
    nameLabel.text = method.name
    nameLabel.flex.markDirty()
    
    descriptionLabel.text = method.description
    descriptionLabel.flex.markDirty()
  }
  
  private func layout() {
    contentView.flex.layout(mode: .adjustHeight)
  }
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    
    layout()
    
    return contentView.frame.size
  }
}
