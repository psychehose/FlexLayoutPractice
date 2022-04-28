//
//  CollectionViewExampleView.swift
//  FlexLayoutPractice
//
//  Created by KIM HOSE on 2022/04/28.
//

import UIKit

class CollectionViewExampleView: UIView {
  
  private let collectionView: UICollectionView
  private let flowLayout = UICollectionViewFlowLayout()
  private let cellTemplate = HouseCell()
  
  fileprivate var houses: [House] = []
  
  init() {
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    super.init(frame: .zero)
    
    flowLayout.minimumLineSpacing = 8
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
    
    if #available(iOS 11.0, *) {
      flowLayout.sectionInsetReference = .fromSafeArea
    }
    
    collectionView.backgroundColor = .white

    collectionView.dataSource = self
    collectionView.delegate = self

    collectionView.register(HouseCell.self, forCellWithReuseIdentifier: HouseCell.reuseIdentifier)
    addSubview(collectionView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(houses: [House]) {
    self.houses = houses
    collectionView.reloadData()
  }

  func viewOrientationDidChange() {
    flowLayout.invalidateLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.pin.vertically().horizontally(pin.safeArea)
  }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension CollectionViewExampleView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return houses.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HouseCell.reuseIdentifier, for: indexPath) as! HouseCell
    cell.configure(house: houses[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    cellTemplate.configure(house: houses[indexPath.row])
    return cellTemplate.sizeThatFits(CGSize(width: collectionView.bounds.width, height: .greatestFiniteMagnitude))
  }
}
