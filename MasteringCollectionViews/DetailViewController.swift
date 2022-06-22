  //
  //  DetailViewController.swift
  //  MasteringCollectionViews
  //
  //  Created by Simran Preet Narang on 2022-06-22.
  //

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet private weak var label: UILabel!
  
  var selectedData: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label.text = selectedData
  }
}
