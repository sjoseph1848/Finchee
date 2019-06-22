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

}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width,height:250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
}
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
