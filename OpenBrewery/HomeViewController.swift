//
//  HomeViewController.swift
//  OpenBrewery
//
//  Created by Anthony on 9/09/19.
//  Copyright © 2019 EmeraldApps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewBreweriesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.font = UIFont(name: "Futura-Bold", size: 26.0)
        viewBreweriesButton.titleLabel?.font = UIFont(name: "Futura-Bold", size: 26.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
