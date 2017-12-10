//
//  CollectionViewController+Orientation.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/22/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionViewController  {
    
    public func preferredWith(forSize size: CGSize) -> CGFloat {
        return (size.width)
    }
    
    public func estimateVisibleCellSizes(to size: CGSize) {
        guard let collectionView = self.collectionView else {
            return
        }
        
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: self.preferredWith(forSize: size), height: size.height)
        }
        collectionView.visibleCells.forEach({ cell in
           // if let cell = cell as? UICollectionViewCell {
                //cell.setPreferred(width: self.preferredWith(forSize: size))
            //}
        })
        
    }
}
