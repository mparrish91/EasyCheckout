//
//  ECProgressView.swift
//  EasyCheckout
//
//  Created by parry on 8/6/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit


final class ECProgressView: UIView {

    var count: Int
    fileprivate var coloredUpToIndex: Int
    fileprivate var layerArray: [CAShapeLayer]
    
    func setColoredUpToIndex(_ index: Int) {
        coloredUpToIndex = index
        
//        self.perform(#selector(ECProgressView.animateViewUpdate), with: nil, afterDelay: 1.5)
    }


    override init(frame: CGRect) {
        self.count = 5
        self.coloredUpToIndex = 0
        self.layerArray = [CAShapeLayer]()
        super.init(frame: frame)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    convenience init?(count: Int) {
        self.init()
        print(count)
        self.count = count
        createShapeLayer(count)
    }

    //creates the shape layer, grayed with spaces in between
    func createShapeLayer(_ count: Int) {

        //calculate width of the view
        let width = self.frame.width

        //divide by the number of items(count) = single progress length
        let singleProgressLength = width/CGFloat(count)


        // take 10% off that as the gap length
        let gapLength = singleProgressLength * 0.10

        //new single progress length = progress length - gap
        var newSingleProgressLength : CGFloat = 0.0
        let staticWidth = singleProgressLength - gapLength

//        loop through the count
        for i in 1...count {
            let layer = CAShapeLayer()

            //start at 0 for the first layer
            layer.path = UIBezierPath(roundedRect: CGRect(x: 0 + (newSingleProgressLength + gapLength), y: 0, width: staticWidth, height: self.frame.height), cornerRadius: 1).cgPath
            newSingleProgressLength += (staticWidth + gapLength)
            if i <= coloredUpToIndex {
                layer.fillColor = UIColor(netHex:0xD8D8D8).cgColor

            }else {
                layer.fillColor = UIColor(netHex:0xD8D8D8).cgColor
            }
            self.layer.addSublayer(layer)
            layerArray.append(layer)
        }
        
//        let poop = layerArray[1]
//        //blah
//        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        
//        // Create CAShapeLayerS
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = bounds
//        rectShape.position = self.center
//        rectShape.cornerRadius = bounds.width / 2
//        self.layer.addSublayer(rectShape)
//        
//        // Apply effects here
//        // 1
//        rectShape.path =  UIBezierPath(ovalIn: rectShape.bounds).cgPath
//
//        
//        rectShape.lineWidth = 4.0
//        rectShape.strokeColor = UIColor(netHex:0xF7B445).cgColor
//
//        rectShape.fillColor = UIColor.clear.cgColor
//        
//        // 2
//        rectShape.strokeStart = 0
//        rectShape.strokeEnd = 0.5
//        
//        // 3
//        let start = CABasicAnimation(keyPath: "strokeStart")
//        start.toValue = 0.7
//        let end = CABasicAnimation(keyPath: "strokeEnd")
//        end.toValue = 1
//        
//        // 4
//        let group = CAAnimationGroup()
//        group.animations = [start, end]
//        group.duration = 1.5
//        group.autoreverses = true
//        group.repeatCount = HUGE // repeat forver
//        rectShape.add(group, forKey: nil)

        var fromPoint = CGPoint(x: 7, y:2 )
        var toPoint = CGPoint(x: 71, y: 2)

        var path: UIBezierPath = UIBezierPath()
        path.move(to: fromPoint)
        path.addLine(to: toPoint)
        
        // Create a CAShape Layer
        var pathLayer: CAShapeLayer = CAShapeLayer()
        pathLayer.frame = self
            .bounds
        pathLayer.path = path.cgPath
        pathLayer.strokeColor = UIColor(netHex:0xF7B445).cgColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 3.5
        pathLayer.lineJoin = kCALineJoinBevel
        
        // Add layer to views layer
        self.layer.addSublayer(pathLayer)
        
        // Basic Animation
        var pathAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 2.0
        pathAnimation.fromValue = NSNumber(value: 0.0)
        pathAnimation.toValue = NSNumber(value:1.0)
        
        // Add Animation
        pathLayer.add(pathAnimation, forKey: "strokeEnd")

    }


    // Adds increment to the progress view, filling a rectangle with animation
    func animateViewUpdate() {
        var delay : TimeInterval = 0.5
        for layer in layerArray {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { () -> Void in
                let animation = CABasicAnimation(keyPath: "opacity")
                animation.duration = 1.0
                animation.fromValue = NSNumber(value: 0.0 as Float)
                animation.toValue = NSNumber(value: 1.0 as Float)
                layer.add(animation, forKey: "animateOpacity")
                self.perform(#selector(ECProgressView.animateViewUpdate), with: nil, afterDelay: delay)
            }
            delay += 0.5
        }
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        createShapeLayer(count)
    }
        
}
