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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
    cell.itemLabel.text = data[indexPath.row]
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(DetailViewController.self)") as? DetailViewController else { return }
    detailViewController.selectedData = data[indexPath.row]
    navigationController?.pushViewController(detailViewController, animated: true)
  }
  
  @IBAction func insertNewItem() {
    
    let alertActionController = UIAlertController(title: "Add a new Item", message: nil, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "☄️", style: .default) { action in
      self.data.append("☄️")
      self.collectionView.insertItems(at: [IndexPath(row: self.data.count - 1, section: 0)])
    }
    
    let addAction = UIAlertAction(title: "✨", style: .default) { action in
      self.data.insert("✨", at: 0)
      self.collectionView.insertItems(at: [IndexPath(row: 0, section: 0)])
    }
    alertActionController.addAction(addAction)
    alertActionController.addAction(cancelAction)
    
    present(alertActionController, animated: true)
    
  }
}

