//
//  TutorialViewController.swift
//  CarouselHW
//
//  Created by Alli Dryer on 9/19/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var welcome1Image: UIView!
    @IBOutlet weak var welcome2Image: UIView!
    @IBOutlet weak var welcome3Image: UIView!
    @IBOutlet weak var welcome4Image: UIView!
    @IBOutlet weak var spinButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.alpha = 0
        self.pageControl.alpha = 1
        
        var scrollWidth: CGFloat  = 4 * self.view.frame.width
        var scrollHeight: CGFloat  = self.view.frame.size.height
        self.scrollView!.contentSize = CGSizeMake(scrollWidth, 1.0);
        self.scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var page = floor((scrollView.contentOffset.x - 320 / 2) / 320) + 1
        var pageInt:Int = Int(page)
        pageControl.currentPage = pageInt
        
        if pageInt == 3 {
            
            UIPageControl.animateWithDuration(0.2, delay: 0.0, options: nil, animations: {
                self.pageControl.alpha = 0
                self.spinButton.alpha = 1
                }, completion: { finished in
            })
        }
    }
}
