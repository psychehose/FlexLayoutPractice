//
//  ViewController.swift
//  FlexLayoutPractice
//
//  Created by KIM HOSE on 2022/04/28.
//

import UIKit

import FlexLayout

import PinLayout

final class IntroViewController: UIViewController {

  private var testView = IntroView()

  private var introView: IntroView { view  as! IntroView }

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func loadView() {
    self.view = IntroView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(testView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
}

