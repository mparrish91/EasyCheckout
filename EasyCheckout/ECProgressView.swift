//
//  ECProgressView.swift
//  EasyCheckout
//
//  Created by parry on 8/6/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit


final class ECProgressView: UIView {

    private var count: Int
    private var coloredUpToIndex: Int
    private var layerArray: [CAShapeLayer]


    override init(frame: CGRect) {
        self.count = Int()
        self.coloredUpToIndex = Int()
        self.layerArray = [CAShapeLayer]()
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    convenience init?(count: Int) {
        self.init()
        self.count = count
    }

    //creates the shape layer, grayed with spaces in between
    func createShapeLayer(count: Int) {

        //calculate width of the view

        //divide by the number of items(count) = single progress length

        // take 10% off that as the gap length

        //new single progress length = progress length - gap

        //loop through the count

        // for each draw a rectangle cashape layer
        //(keep incrementing by the x by the width + gap)

            //add each to the view
            //store each variable in the layerArray

    }


    // Adds increment to the progress view, filling a rectangle with animation
    func updateView() {

        //select next layer in array

        //change color of the layer in animation


    }

    override func layoutSubviews() {

    }
        
}
