//
//  ConversationsViewController.swift
//  CarouselHW
//
//  Created by Alli Dryer on 9/21/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {
    
    @IBOutlet weak var backToFeedButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backToFeedButtonDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
