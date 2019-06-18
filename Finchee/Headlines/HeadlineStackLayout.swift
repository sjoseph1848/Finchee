//
//  HeadlineStackLayout.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/16/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//
import UIKit

class HeadlineStackLayout: UICollectionViewLayout {
    
    override func prepare() {
        super.prepare()
    }
    
    fileprivate func indexPathsForElementsInRect(_ rect: CGRect) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        
        if let numItems = collectionView?.numberOfItems(inSection: 0), numItems > 0 {
            for i in 0...numItems-1 {
                indexPaths.append(IndexPath(item: i, section: 0))
            }
        }
        
        return indexPaths
    }
}












//import UIKit
//
//protocol HeadlineStackLayoutDelegate:class {
//    func headlineShouldRemove(_ flowLayout: HeadlineStackLayout,indexPath:IndexPath)
//}
//
//class HeadlineStackLayout: UICollectionViewLayout {
//
//    private var panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer()
//    private let maxOffsetThresholdPercentage:CGFloat = 0.3
//    private let animationDuration: TimeInterval = 0.15
//
//    typealias CellWithIndexPath = (cell:UICollectionViewCell,indexPath:IndexPath)
//
//    weak var delegate:HeadlineStackLayoutDelegate?
//
//    private var topCellWithIndexPath: CellWithIndexPath? {
//        let lastItem = collectionView?.numberOfItems(inSection: 0) ?? 0
//        let indexPath = IndexPath(item: lastItem - 1,section:0)
//
//        guard let cell = collectionView?.cellForItem(at: indexPath) else {return nil}
//
//        return (cell:cell,indexPath:indexPath)
//    }
//
//    private var bottomCellWithIndexPath:CellWithIndexPath? {
//        guard let numItems = collectionView?.numberOfItems(inSection: 0),numItems > 1 else {return nil}
//        let indexPath = IndexPath(item:numItems - 2, section:0)
//
//        guard let cell = collectionView?.cellForItem(at: indexPath) else {return nil}
//
//        return (cell:cell,indexPath:indexPath)
//    }
//
//
//
//    override func prepare() {
//        super.prepare()
//
//    panGestureRecognizer.addTarget(self, action: #selector(handlePan(gestureRecognizer:)))
//    collectionView?.addGestureRecognizer(panGestureRecognizer)
//    }
//
//    fileprivate func indexPathsForElementsInRect(_ rect: CGRect) -> [IndexPath] {
//        var indexPaths: [IndexPath] = []
//
//        if let numItems = collectionView?.numberOfItems(inSection: 0), numItems > 0 {
//
//            for i in 0...numItems-1 {
//                indexPaths.append(IndexPath(item: i, section: 0))
//            }
//        }
//
//        return indexPaths
//    }
//
//    @objc func handlePan(gestureRecognizer:UIPanGestureRecognizer){
//        let translation = gestureRecognizer.translation(in: collectionView)
//
//        let xOffset = translation.x
//        let xMaxOffset = (collectionView?.frame.width ?? 0) * maxOffsetThresholdPercentage
//
//        switch gestureRecognizer.state {
//        case .changed:
//            if let topCard = topCellWithIndexPath {
//                topCard.cell.transform = CGAffineTransform(translationX: xOffset, y: 0)
//            }
//
//            if let bottomCard = bottomCellWithIndexPath{
//
//                let draggingScale = 0.5 + (abs(xOffset) / (collectionView?.frame.width ?? 1) * 0.7)
//                let scale = draggingScale > 1 ? 1 :draggingScale
//
//                bottomCard.cell.transform = CGAffineTransform(scaleX:scale,y:scale)
//
//                bottomCard.cell.alpha = scale / 2
//            }
//        case .ended:
//            if abs(xOffset) > xMaxOffset {
//                if let topCard = topCellWithIndexPath {
//                    //animate and remove
//                    animateAndRemove(left: xOffset < 0, cell: topCard.cell, completion: {
//                        [weak self] in
//
//                        guard let `self` = self else {return}
//                        self.delegate?.headlineShouldRemove(self, indexPath: topCard.indexPath)
//
//                    })
//                }
//                if let bottomCard = bottomCellWithIndexPath{
//                    //animate into primary position
//                    animateIntoPosition(cell: bottomCard.cell)
//                }
//            } else {
//                if let topCard = topCellWithIndexPath {
//                    //animate back into primary position
//                    animateIntoPosition(cell: topCard.cell)
//                }
//            }
//        default:
//            break
//        }
//    }
//
//    private func animateIntoPosition(cell: UICollectionViewCell){
//        UIView.animate(withDuration:animationDuration){
//            cell.transform = CGAffineTransform.identity
//            cell.alpha = 1
//        }
//    }
//
//    private func animateAndRemove(left:Bool,cell:UICollectionViewCell,completion: (() -> ())?) {
//        let screenWidth = UIScreen.main.bounds.width
//
//        UIView.animate(withDuration: animationDuration,animations: {
//            let xTranslateOffscreen = CGAffineTransform(translationX: left ? -screenWidth : screenWidth, y: 0)
//            cell.transform = xTranslateOffscreen
//        }) { (completed) in completion?()
//
//        }
//    }
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//
//        attributes.frame = collectionView?.bounds ?? .zero
//
//        var isNotTop = false
//        if let numItems = collectionView?.numberOfItems(inSection: 0),numItems > 0 {
//            isNotTop = indexPath.row != numItems - 1
//        }
//
//        attributes.alpha = isNotTop ? 0 : 1
//
//        return attributes
//    }
//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let indexPaths = indexPathsForElementsInRect(rect)
//        let layoutAttributes = indexPaths.map {layoutAttributesForItem(at: $0)}
//            .filter {$0 != nil }.map {$0!}
//
//        return layoutAttributes
//    }
//}
