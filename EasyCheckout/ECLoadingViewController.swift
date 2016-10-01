//
//  ECLoadingViewController.swift
//  EasyCheckout
//
//  Created by parry on 10/1/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit

class ECLoadingViewController: UIViewController {
    
    private var progressHUD = ECProgressHUD(text: "Fetching your fix :)")
    private var backgroundImageView = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .ScaleAspectFit
        
        self.prefersStatusBarHidden()


        view.addSubview(backgroundImageView)


        
        // Create and add the view to the screen.
        view.addSubview(progressHUD)
        setConstraints()
//        progressHUD.backgroundColor = UIColor(netHex: 0xF7B445)

        navigationController?.navigationBarHidden = false
        view.backgroundColor = UIColor.whiteColor()
        
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        
        self.prefersStatusBarHidden()

    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    
    func setConstraints() {
        
        let margins = view.layoutMarginsGuide
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 0).active = true
        backgroundImageView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 0).active = true
        backgroundImageView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
        
        progressHUD.translatesAutoresizingMaskIntoConstraints = false
        progressHUD.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor).active = true
        progressHUD.centerYAnchor.constraintEqualToAnchor(margins.centerYAnchor).active = true
        progressHUD.widthAnchor.constraintEqualToAnchor(nil, constant: 170
            ).active = true
        progressHUD.heightAnchor.constraintEqualToAnchor(nil, constant: 48).active = true
        
        
        
    }
    
}