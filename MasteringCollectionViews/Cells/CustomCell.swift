//
//  CustomCell.swift
//  MasteringCollectionViews
//
//  Created by Simran Preet Singh Narang on 2022-06-22.
//

import UIKit

class CustomCell: UICollectionViewCell {
  
  @IBOutlet weak var itemLabel: UILabel!
  @IBOutlet weak var selectLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.selectLabel.layer.cornerRadius = 22
    self.selectLabel.layer.borderWidth = 1
    self.selectLabel.layer.borderColor = UIColor.black.cgColor
    self.selectLabel.layer.masksToBounds = true
    
  }
}
