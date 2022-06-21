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
    CGSize(width: 180, height: 180)
  }
}

