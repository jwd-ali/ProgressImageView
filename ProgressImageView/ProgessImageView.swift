//
//  ProgessImageView.swift
//  ProgressImageViewDemo
//
//  Created by Jawad Ali on 05/03/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit

open class ProgessImageView: UIView {
    
    public var progressColor: UIColor = .green { didSet { updateValues() } }
    public var lineWidth: CGFloat = 5 { didSet { updateValues() } }
    public var image: UIImage? = nil {didSet {imageLayer.contents = image?.cgImage}}
    public var animationDuration: Double = 1
    public var animated: Bool = false
    
    /// Should be set to a value between `0.0` and `100.0`
    public var progress = 0.0 { didSet { updateProgress(from: oldValue, to: progress )  } }
    
    /// Gets called each time the current progress change animation finishes
    public var animationDidFinish: (() -> Void)?
    
    /// - Important: Lazily initialize Layers image + progress Layer
    
    private lazy var imageLayer : CALayer = {
        let imageLayer = CALayer()
        imageLayer.shouldRasterize = true
        imageLayer.contentsGravity = CALayerContentsGravity.resizeAspectFill
        imageLayer.contentsScale = UIScreen.main.scale
        imageLayer.contents = image?.cgImage
        return imageLayer
        
    }()
    
    private lazy var progressLayer : CAShapeLayer = {
        let progres = CAShapeLayer()
        progres.lineCap = .round
        progres.strokeColor = progressColor.cgColor
        progres.lineWidth = lineWidth
        progres.strokeStart = 0
        progres.strokeEnd = CGFloat(progress)
        progres.fillColor = UIColor.clear.cgColor
        return progres
        
    }()
    
    /// `Masking` layer
    
    private lazy var maskingLayer = CAShapeLayer()
    
    ///`Initializers` of the View
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    ///  Custom initializer taking
    
    ///  * `UIImage`: To show in center
    ///   * `UIColor `: ProgressBar color
    ///   * `Progress` : Progress in Double between `0.0 - 100`
    ///   * `LineWidth` : Width of the progress circle
    ///   * `Animation` : Is animation On or Off*/
    
    public init(with image:UIImage?, color:UIColor, progress:Double, lineWidth:Double = 5 , animation:Bool = false) {
        super.init(frame:CGRect.zero)
        self.image = image
        self.progressColor = color
        self.lineWidth = CGFloat(lineWidth)
        self.progress = progress
        self.animated = animation
        updateProgress(from: 0, to: progress)
        commonInit()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        updatePaths()
    }
}

extension ProgessImageView {
    
    /// Add layers to view
    
    private func  commonInit() {
        layer.addSublayer(imageLayer)
        layer.addSublayer(progressLayer)
    }
    
    /// Update `UIBezierPath` according to bounds
    
    private func updatePaths() {
        
        let radius: CGFloat = bounds.maxX / 2
        let center = CGPoint(x:bounds.midX,y:bounds.midY)
        
        maskingLayer.path = UIBezierPath(arcCenter: center, radius: radius - lineWidth * 2.5 , startAngle: CGFloat(-90).deg2rad(), endAngle: CGFloat(270).deg2rad(), clockwise: true).cgPath
        
        progressLayer.path = UIBezierPath(arcCenter: center, radius: radius - lineWidth/2 , startAngle: CGFloat(-90).deg2rad(), endAngle: CGFloat(270).deg2rad(), clockwise: true).cgPath
        
        imageLayer.mask = maskingLayer
        imageLayer.frame = bounds
        
    }
    
    private func updateValues() {
        
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = lineWidth
        updatePaths()
    }
    
    /// `Update Progress`
    
    private func updateProgress(from oldValue: Double, to newValue: Double) {
        
        if animated {
            
            let animation = CABasicAnimation(keyPath: StrokePosition.strokeEnd.rawValue)
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            animation.fromValue = oldValue < 0 ? 0 : oldValue / 100
            animation.toValue = newValue > 100 ? 100 : newValue / 100
            
            animation.duration = animationDuration
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.isRemovedOnCompletion = false
            animation.delegate = self
            
            progressLayer.removeAnimation(forKey: StrokePosition.strokeEnd.rawValue)
            progressLayer.add(animation, forKey: StrokePosition.strokeEnd.rawValue)
            
        } else {
            
            progressLayer.strokeEnd = CGFloat(progress / 100)
        }
        
    }
}

extension ProgessImageView: CAAnimationDelegate {
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        animationDidFinish?()
    }
}


public enum StrokePosition: String {
    case strokeStart, strokeEnd
}
/// `Degree to Radians` Conversion
public extension CGFloat {
    func deg2rad() -> CGFloat {
        return self * .pi / 180
    }
}

