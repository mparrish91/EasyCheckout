//
//  ECLoadingViewController.swift
//  EasyCheckout
//
//  Created by parry on 10/1/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit

class ECLoadingViewController: UIViewController {
    
    fileprivate var progressHUD = ECProgressHUD(text: "Fetching your fix :)")
    fileprivate var backgroundImageView = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFit
        
        
        // Create and add the view to the screen.
        view.addSubview(progressHUD)
        setConstraints()

        view.backgroundColor = UIColor.white
        
        fetchFix()

    }
    
    
    func fetchFix() {
        
        ECNetworkingHelper.sharedInstance.fetchCurrentFix { (data, error) in
            
            DispatchQueue.main.async(execute: {

                let nav = self.navigationController as! ECNavigationController
                nav.items = data
                //create my selectionViewControllers
                for item in data {
                    if let selectionVC = ECSelectionViewController(item: item) {
                        nav.vcArray.append(selectionVC)
                    }
                }
                nav.pushViewController(nav.vcArray[0], animated: true)
                ECNetworkingHelper.sharedInstance.itemCount = nav.vcArray.count
                NotificationCenter.default.post(name: Notification.Name(rawValue: "dataLoaded"), object: nil)

                
            })
        }
        
    }
    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBarHidden = true
        
        self.prefersStatusBarHidden

    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    func setConstraints() {
        
        let margins = view.layoutMarginsGuide
        
        progressHUD.translatesAutoresizingMaskIntoConstraints = false
        progressHUD.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        progressHUD.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        progressHUD.widthAnchor.constraint(equalToConstant: 200
            ).isActive = true
        progressHUD.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
    }
    
}
