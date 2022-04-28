//
//  IntroView.swift
//  FlexLayoutPractice
//
//  Created by KIM HOSE on 2022/04/28.
//

import UIKit
import FlexLayout
import PinLayout

final class IntroView: UIView {
  private let rootFlexContainer = UIView()
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    
    let imageView = UIImageView(
      image: UIImage(systemName: "flame")
    )
    
    let segmentedControl = UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"])
    segmentedControl.selectedSegmentIndex = 0
    
    let label = UILabel()
    label.text = "Flexbox layouting is simple, powerfull and fast.\n\nFlexLayout syntax is concise and chainable."
    label.numberOfLines = 0
    
    let bottomLabel = UILabel()
    bottomLabel.text = "FlexLayout/yoga is incredibly fast, its even faster than manual layout."
    bottomLabel.numberOfLines = 0
    
    rootFlexContainer.flex.direction(.column).padding(12).define { flex in
      flex.addItem().direction(.row).define { flex in
        flex.addItem(imageView).width(100).aspectRatio(of: imageView)
        
        flex.addItem().direction(.column).paddingLeft(12).grow(1).shrink(1).define { flex in
          flex.addItem(segmentedControl).marginBottom(12).grow(0)
          flex.addItem(label)
        }
      }
      flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
      flex.addItem(bottomLabel).marginTop(12)
    }
    addSubview(rootFlexContainer)
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootFlexContainer.pin.all(pin.safeArea)
    rootFlexContainer.flex.layout(mode: .adjustHeight)
  }
}
