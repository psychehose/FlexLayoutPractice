//
//  TableViewExampleView.swift
//  FlexLayoutPractice
//
//  Created by KIM HOSE on 2022/04/28.
//

import UIKit

final class TableViewExampleView: UIView {
  
  private let tableView = UITableView()

  private var methods: [Method] = []
  
  init() {
    super.init(frame: .zero)

    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableFooterView = UIView()
    tableView.estimatedRowHeight = 1
    tableView.register(MethodCell.self, forCellReuseIdentifier: MethodCell.reuseIdentifier)
    tableView.register(MethodGroupHeader.self, forHeaderFooterViewReuseIdentifier: MethodGroupHeader.reuseIdentifier)
    addSubview(tableView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func configure(methods: [Method]) {
    self.methods = methods
    tableView.reloadData()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    tableView.pin.all()
  }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension TableViewExampleView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return MethodGroupHeader.height
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MethodGroupHeader.reuseIdentifier) as! MethodGroupHeader
    header.configure(title: "Flex container methods")
    return header
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return methods.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MethodCell.reuseIdentifier, for: indexPath) as! MethodCell
    cell.configure(method: methods[indexPath.row])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    // The UITableView will call the cell's sizeThatFit() method to compute the height.
    // WANRING: You must also set the UITableView.estimatedRowHeight for this to work.
    return UITableView.automaticDimension
  }
}
