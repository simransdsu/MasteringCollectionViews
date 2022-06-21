//
//  ViewController.swift
//  MasteringCollectionViews
//
//  Created by Simran Preet Narang on 2022-06-20.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var data = ["🍔", "🌭", "🌮", "🌯", "🥙", "🥗", "🥪", "🍕", "🍟", "🍱", "🧆", "🍲", "🍛", "🍜", "🍣", "🍿", "🥟",
              "🍳", "🥞", "🧇", "🍪", "🍩", "🧁", "🍦", "🍮", "🥧", "🍰", "🥡"].shuffled()

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    if let label = cell.viewWithTag(100) as? UILabel {
      label.text = data[indexPath.item]
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // number of columns you want
    let columns: CGFloat = 3
    // Default spacing between cells from each other |-(0)-| Cell-1 |-(10)-| Cell-2 |-(0)-|
    let defaultSpacing: CGFloat = 10
    // totalSpacing between columns will be default * (numberOfColumns - 1)
    let totalSpacingBetweenColumns = defaultSpacing * (columns - 1)
    let size: CGFloat = (collectionView.frame.width - totalSpacingBetweenColumns) / columns
    return CGSize(width: size, height: size)
  }
}

