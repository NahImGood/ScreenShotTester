//
//  ViewController.swift
//  ScreenShotTester
//
//  Created by Admin on 1/20/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import UIKit
import Photos

class FetchingViewController: UIViewController {
    
    var screenShots: ScreenShotMC!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Button Actions
    
    @IBAction func screenShotButton(_ sender: Any) {
        //Create the UIImage
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        view.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    @IBAction func fetchPhotos(_ sender: Any) {
        //screenShots.fetchPhotos()
       // print("\(screenShots.screenShots)")
    }
    @IBAction func PhotoButton(_ sender: Any) {

    }
    
        
    // Repeatedly call the following method while incrementing
    // the index until all the photos are fetched
    
}

