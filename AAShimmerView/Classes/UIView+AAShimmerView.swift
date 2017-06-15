//
//  UIView+AAShimmerView.swift
//  AAShimmerView
//
//  Created by Ahmed Magdi on 6/11/17.
//  Copyright © 2017 Ahmed Magdi. All rights reserved.
//

import UIKit

public extension UIView {
    private static let association_subViews = ObjectAssociation<[UIView]>()
    private static let association_viewHeight = ObjectAssociation<CGFloat>()
    private static let association_viewAlpha = ObjectAssociation<CGFloat>()
    private static let association_FBShimmerView = ObjectAssociation<AAShimmerView>()
    
    private var shimmerView: AAShimmerView? {
        get { return UIView.association_FBShimmerView[self] }
        set { UIView.association_FBShimmerView[self] = newValue }
    }
    
    var aaShimmerViewAlpha: CGFloat {
        get { return UIView.association_viewAlpha[self] ?? 1 }
        set { UIView.association_viewAlpha[self] = newValue }
    }
    
    public var aaShimmerSubViews: [UIView]? {
        get { return UIView.association_subViews[self] }
        set { UIView.association_subViews[self] = newValue }
    }
    
    public var aaShimmerHeight: CGFloat {
        get { return UIView.association_viewHeight[self] ?? self.frame.height }
        set { UIView.association_viewHeight[self] = newValue }
    }
    
    public var isShimmering:Bool {
        return shimmerView != nil
    }
    
    public func startShimmering() {
        if shimmerView == nil {
            shimmerView = AAShimmerView(rootView: self)
        }
        shimmerView?.start()
    }
    
    public func stopShimmering() {
        if shimmerView == nil {
            return
        }
        shimmerView?.stop()
        shimmerView = nil
    }
}

