//
//  ZoomImageViewController.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/11/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit
import ImageSlideshow

class InstructionViewController: UIViewController {
  
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet var slideshow: ImageSlideshow!
    
    let localSource = [ImageSource(imageString: "InstructionBloodPressure.png")!, ImageSource(imageString: "InstructionDiabetes.png")!, ImageSource(imageString: "InstructionDiabetes2.png")!, ImageSource(imageString: "InstructionKidney")!,ImageSource(imageString: "InstructionDrink")!,ImageSource(imageString: "InstructionEat")!]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.black
        slideshow.pageControl.pageIndicatorTintColor = UIColor.lightGray
        slideshow.contentScaleMode = UIViewContentMode.scaleToFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(InstructionViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "คำแนะนำสุขภาพ"
    }
}
