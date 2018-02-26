//
//  UIProgressView.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 12/3/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class ColoredProgressView: UIView   {
 
    public private(set) var percentage: Float = 0
    
    private var segmentWidth: CGFloat = 0.0
    private let segmentPercentage: Float = 20.0
    
    private let colors = [
        UIColor(red: 29.0/255.0 ,green:175.0/255.0 ,blue:236.0/255.0 ,alpha:1.0),
        UIColor(red: 80.0/255.0 ,green:131.0/255.0 ,blue:153.0/255.0 ,alpha:1.0),
        UIColor(red: 31.0/255.0 ,green:255.0/255.0 ,blue:199.0/255.0 ,alpha:1.0),
        UIColor(red: 255.0/255.0 ,green:110.0/255.0 ,blue:95.0/255.0 ,alpha:1.0),
        UIColor(red: 204.0/255.0 ,green:5.0/255.0 ,blue:39.0/255.0 ,alpha:1.0)]
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialSetup()
        self.updateViews()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialSetup()
        self.updateViews()
    }
    
    public override var frame: CGRect   {
        didSet  {
            self.initialSetup()
        }
    }
    
    public func updateViews()   {
        for view in self.subviews {
            view.removeFromSuperview()
        }
        self.setupInnerViews()
    }
    
    
    private func setupInnerViews()  {
        if ( percentage >= 0 ) {
            self.addSubview(self.getFirstView())
        }
        if ( percentage >= 20 ) {
            self.addSubview(self.getSecondView())
        }
        if ( percentage >= 40 ) {
            self.addSubview(self.getThirdView())
        }
        if ( percentage >= 60 ) {
            self.addSubview(self.getForthView())
        }
        if ( percentage >= 80 )   {
            self.addSubview(self.getFifthView())
        }
    }
    
    private func initialSetup() {
        self.segmentWidth = self.frame.size.width/5
    }
    
    
    private func getFirstView() -> UIView   {
        return getView(index: 1, viewPercentage: 0.0)
    }
    
    private func getSecondView() -> UIView   {
        return getView(index: 2, viewPercentage: 20.0)
    }
    
    private func getThirdView() -> UIView   {
        return getView(index: 3, viewPercentage: 40.0)
    }
    
    private func getForthView() -> UIView   {
        return getView(index: 4, viewPercentage: 60.0)
    }
    
    private func getFifthView() -> UIView   {
        return getView(index: 5, viewPercentage: 80.0)
    }

    private func getView(index: Int, viewPercentage: Float)  -> UIView {
        var viewWidth: CGFloat = segmentWidth
        if self.percentage < (viewPercentage + segmentPercentage)   {
            let actualPercentage: CGFloat = CGFloat((percentage - viewPercentage ) / segmentPercentage)
            viewWidth = actualPercentage * segmentWidth
        }
        let view = UIView.init(frame: CGRect.init(x: segmentWidth * CGFloat(index), y: 0, width: viewWidth, height: self.frame.size.height))
        view.backgroundColor = self.colors[index]
        return view
    }
}
