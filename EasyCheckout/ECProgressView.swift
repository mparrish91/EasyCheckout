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
    private var coloredUpToIndex: Int
    private var layerArray: [CAShapeLayer]


    override init(frame: CGRect) {
        self.count = Int()
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
    func createShapeLayer(count: Int) {

        //calculate width of the view
        let width = self.frame.width

        //divide by the number of items(count) = single progress length
        let singleProgressLength = width/CGFloat(count)


        // take 10% off that as the gap length
        let gapLength = singleProgressLength * 0.10

        //new single progress length = progress length - gap
        let newSingleProgressLength = singleProgressLength - gapLength

        print(count)

        //loop through the count
        for _ in 0...count {
            let layer = CAShapeLayer()
            layer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: newSingleProgressLength, height: self.frame.height), cornerRadius: 50).CGPath

            //start at 0 for the first layer
            if count == 0 {
                layer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: newSingleProgressLength, height: self.frame.height), cornerRadius: 50).CGPath

            }else {
                layer.path = UIBezierPath(roundedRect: CGRect(x: 0 + (newSingleProgressLength + gapLength), y: 0, width: newSingleProgressLength, height: self.frame.height), cornerRadius: 50).CGPath

            }

            layer.fillColor = UIColor.grayColor().CGColor
            self.layer.addSublayer(layer)

            layerArray.append(layer)
        }

        // for each draw a rectangle cashape layer
        //(keep incrementing by the x by the width + gap)

            //add each to the view
            //store each variable in the layerArray

    }


    // Adds increment to the progress view, filling a rectangle with animation
    func updateView() {

        //select next layer in array
        let layer = layerArray[coloredUpToIndex]


        //change color of the layer in animation

        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in

            layer.fillColor = UIColor.yellowColor().CGColor


            }, completion: { (finished: Bool) -> Void in
        })

        coloredUpToIndex++


    }

    override func layoutSubviews() {

    }
        
}
