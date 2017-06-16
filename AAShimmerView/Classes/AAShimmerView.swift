//
//  ShimmeringView.swift
//  AAShimmerView
//
//  Created by Ahmed Magdi on 6/11/17.
//

import UIKit

class AAShimmerView: UIView, CAAnimationDelegate {
    
    private var rootView:UIView!
    private var gradientLayer:CAGradientLayer!
    private var constraintsList:[NSLayoutConstraint] =  []
    
    //MARK:- Initalization
    
    override init(frame: CGRect) {super.init(frame: frame)}
    
    convenience init(rootView:UIView, colors:[CGColor]?=nil) {
        self.init(frame: CGRect(x: 0, y: 0, width: rootView.frame.width, height: rootView.frame.height))
        self.translatesAutoresizingMaskIntoConstraints = false
        self.gradientLayer = CAGradientLayer(layer: rootView.layer)
        self.rootView = rootView
        self.tag = 104420
        
        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationDidChange(notification:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Pivate View Configurtions
    
    private func configure() {
        if rootView.aaShimmerSubViews?.count == 0 {
            self.removeFromSuperview()
            return
        }
        
        configureGradientLayer()
        gradientLayer.removeFromSuperlayer()
        layer.addSublayer(gradientLayer)
        applyMaskingFromSubViews()
        startAnimating()
    }
    
    /// Is responsable for Creating CAShapeLayer with paths depending on the subViews and mask
    /// the generated CAShapeLayer to the gradientLayer leaving only the paths the was added
    private func applyMaskingFromSubViews() {
        let lay = CAShapeLayer()
        let path: CGMutablePath = CGMutablePath()
        
        rootView.aaShimmerSubViews?.forEach { (view) in
            let bound = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.size.width, height: view.aaShimmerHeight)
            var rect:CGRect!
            
            if view.superview == nil {
                rect = bound
            }else if view.superview == rootView {
                rect = bound
            } else {
                rect = view.superview!.convert(bound, to: self)
            }
            
            if view.aaShimmerHeight != view.frame.height {
                switch view.aashimmerVerticalAlignment {
                case .bottom:
                    rect.origin.y += (view.frame.size.height - view.aaShimmerHeight)
                case .center:
                    rect.origin.y += view.frame.size.height/2 - view.aaShimmerHeight/2
                case .top:
                    rect.origin.y = 0
                }
            }
            return path.addPath((UIBezierPath(roundedRect: rect, cornerRadius: view.layer.cornerRadius).cgPath))
        }
        lay.path = path
        lay.fillRule = kCAFillRuleEvenOdd
        self.layer.mask = lay
    }
    
    /// Is responsable for Applying the GradientLayer
    private func configureGradientLayer() {
        let layer = gradientLayer!
        layer.frame = self.layer.frame
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.525)
        layer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
        var colors:[Any]!
        if let colorList = rootView.aashimmerColors, colorList.count > 0 {
            colors = colorList.map{$0.cgColor}
        }else {
            colors = [UIColor.lightGray.cgColor , UIColor.white.cgColor]
        }
        
        layer.colors = colors
    }
    
    /// Responsable for creating the animation
    private func startAnimating() {
        let layer = gradientLayer!
        let fromColors = layer.colors
        
        let toColors = self.shift(list: fromColors)
        layer.colors = toColors
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = 1.5
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.delegate = self
        layer.add(animation, forKey: "animateGradient")
    }
    
    /// Shifting the last element in the array to the first index
    ///
    /// - Parameter list: list of items to be shifted
    /// - Returns: list of items shifted by one element
    private func shift(list:[Any]?) -> [Any]? {
        guard var newList = list else {return list}
        let color = newList.removeLast()
        newList.insert(color, at: 0)
        return newList
    }
    
    internal func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        startAnimating()
    }
    
    private func configureConstraints() {
        constraintsList += NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view":self])
        constraintsList += NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view":self])
        NSLayoutConstraint.activate(constraints)
    }
    
    public func start() {
        rootView.addSubview(self)
        configureConstraints()
        rootView.aaShimmerSubViews?.forEach{$0.aaShimmerViewAlpha = $0.alpha; $0.alpha = 0}
    }
    
    func deviceOrientationDidChange(notification:Notification) {
        applyMaskingFromSubViews()
    }
    
    public func stop() {
        rootView.aaShimmerSubViews?.forEach{$0.alpha = $0.aaShimmerViewAlpha}
        NotificationCenter.default.removeObserver(self)
        self.removeFromSuperview()
    }
}

