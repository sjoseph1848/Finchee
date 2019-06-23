//
//  AppsSearchController.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/21/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit



class AppsSearchController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    //Register the cell
    fileprivate let cellId = "id1234"

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        
        //Register cell using cellId
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchStocks()

}
    
    fileprivate var stockSymbols = [Symbols]()
    
    fileprivate func fetchStocks(){
        Service.shared.fetchSymbols{ (stockSymbols,err) in
            if let err = err {
                print("Failed to fetch stocks:",err)
                return
            }
            self.stockSymbols = stockSymbols
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width,height:250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockSymbols.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        let stockSymbol = stockSymbols[indexPath.item]
        cell.symbolLabel.text = stockSymbol.symbol
        cell.nameLabel.text = stockSymbol.name
        cell.priceLabel.text = "\(stockSymbol.price ?? 0)"
        return cell
    }
    
    

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
}
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
