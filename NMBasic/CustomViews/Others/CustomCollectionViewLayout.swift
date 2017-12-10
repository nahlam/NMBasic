//
//  CustomCollectionViewLayout.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 10/25/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit


public class CustomCollectionViewLayout: UICollectionViewFlowLayout {
    
    var height:CGFloat = 0.0
    
    
    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        
        if let collectionView = self.collectionView {
            let currentContentOffset = collectionView.contentOffset
            if currentContentOffset.y < proposedContentOffset.y {
                return currentContentOffset
            }
        }
        return proposedContentOffset
    }
    
    override public var collectionViewContentSize: CGSize {
        let collection = collectionView!
        let width = collection.bounds.size.width
        let height:CGFloat = (self.collectionView?.contentSize.height)!
        return CGSize(width: width, height: height)
    }
    
}
