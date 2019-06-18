//
//  ViewController.swift
//  Finchee
//
//  Created by Samuel Joseph on 5/26/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation
import UIKit

// Layout constants
private extension CGFloat {
    static let tickerHeightMultiplier: CGFloat = 0.4
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var headlineCollectionView: UICollectionView!
    
    private var cardsData = FincheeNewsData.data.headlines
 
//    private var graphData = FincheeChartData.vooDayData
    
    override func viewDidLoad() {
        
        headlineCollectionView.delegate = self
        headlineCollectionView.dataSource = self
        headlineCollectionView.register(FincheeHeadlineCell.self, forCellWithReuseIdentifier: FincheeHeadlineCell.identifier)
    }
}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           print(cardsData)
        return cardsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FincheeHeadlineCell.identifier, for: indexPath) as? FincheeHeadlineCell else {
            return UICollectionViewCell()
        }
        
        cell.viewModel = cardsData[indexPath.row]
        cell.backgroundType = .light(priceMovement: .up)
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {  }

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size
        let cellSize = CGSize(width: collectionViewSize.width * 0.9, height: collectionViewSize.height * 0.9)
        return cellSize
    }
}















//import UIKit
//
//class ViewController: UIViewController {
//
//
//    @IBOutlet weak var topView: UIView!
//    @IBOutlet weak var headlineCollectionView: UICollectionView!
//
//    private var headlineData = FincheeNewsData.data.headlines
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        headlineCollectionView.delegate = self
//        headlineCollectionView.dataSource = self
//        headlineCollectionView.register(FincheeHeadlineCell.self,forCellWithReuseIdentifier: FincheeHeadlineCell.identifier)
//        // Do any additional setup after loading the view.
//
//        if let layout = headlineCollectionView.collectionViewLayout as? HeadlineStackLayout {
//            layout.delegate = self
//        }
//    }
//}
//
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(headlineData.count)
//        return headlineData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FincheeHeadlineCell.identifier, for: indexPath) as? FincheeHeadlineCell else {
//            return UICollectionViewCell()
//        }
//
//        cell.viewModel = headlineData[indexPath.row]
//        cell.backgroundType = .light(priceMovement: .up)
//
//        return cell
//    }
//}
//
//extension ViewController: UICollectionViewDelegate {  }
//
//extension ViewController:HeadlineStackLayoutDelegate{
//    func headlineShouldRemove(_ flowLayout: HeadlineStackLayout, indexPath: IndexPath) {
//        headlineData.removeLast()
//        headlineCollectionView.reloadData()
//    }
//}
//
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let collectionViewSize = collectionView.frame.size
//        let cellSize = CGSize(width: collectionViewSize.width * 0.9, height: collectionViewSize.height * 0.9)
//        return cellSize
//    }
//}

