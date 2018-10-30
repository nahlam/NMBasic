//
//  CustomCollectionViewLayout.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/25/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class CustomCollectionViewLayout: UICollectionViewFlowLayout {

    open var height:CGFloat = 0.0
    
    override open func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        if let collectionView = self.collectionView {
            let currentContentOffset = collectionView.contentOffset
            if currentContentOffset.y < proposedContentOffset.y {
                return currentContentOffset
            }
        }
        return proposedContentOffset
    }
    
    override open var collectionViewContentSize: CGSize {
        let collection = collectionView!
        let width = collection.bounds.size.width
        let height:CGFloat = (self.collectionView?.contentSize.height)!
        return CGSize(width: width, height: height)
    }
    
}
