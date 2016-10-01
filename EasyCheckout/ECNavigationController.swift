//
//  ECNavigationController.swift
//  EasyCheckout
//
//  Created by parry on 10/1/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit

class ECNavigationController: UINavigationController {
    
    var nextVCIndex = 1
    var vcArray = [ECSelectionViewController]()
    var items = [ECItem]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
