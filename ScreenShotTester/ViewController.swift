//
//  ViewController.swift
//  ScreenShotTester
//
//  Created by Admin on 1/20/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import UIKit
import Foundation
import Photos

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return nil
    }
    
   
    @IBAction func PhotoButton(_ sender: Any) {
        fetchPhotos()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
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

    
    var images:[UIImage] = []
    
    func fetchPhotos () {
        // Sort the images by descending creation date and fetch the first 3
        let fetchOptions = PHFetchOptions()
                //Print out all library Photos
        let library = PHAsset.fetchAssets(with: .image, options: PHFetchOptions())
        print("Total Media Photos: \(library.count)")

        //fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
        //fetchOptions.fetchLimit = 30
        
                //Potentially Fetching the Image Based on the Screenshot identifier.
        fetchOptions.predicate = NSPredicate(format: "(mediaSubtype & %d) != 0", PHAssetMediaSubtype.photoScreenshot.rawValue)
        // Fetch the image assets
        //let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        let options1 = PHFetchOptions()
        options1.predicate = NSPredicate(format: "(mediaSubtype & %d) != 0", PHAssetMediaSubtype.photoScreenshot.rawValue)
        let fetchResult = PHAsset.fetchAssets(with: .image, options: options1)
        print("Screenshots: \(fetchResult.count) :: 1")
        
        //Fetching Screen Shots
        let result2 = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        print("Screenshots: \(result2.count) :: 2")

        // If the fetch result isn't empty,
       
        // proceed with the image request
        if fetchResult.count > 0 {
            let totalImageCountNeeded = 3 // <-- The number of images to fetch
            fetchPhotoAtIndex(0, totalImageCountNeeded, fetchResult)
        } else {
            print("There were no Screenshots")
        }
        
        if library.count > 0 {
            let totalImageCountNeeded = 3 // <-- The number of images to fetch
            fetchPhotoAtIndex(0, totalImageCountNeeded, library)
        } else {
            print("There were no photos")
        }
 
    }
    
    // Repeatedly call the following method while incrementing
    // the index until all the photos are fetched
    func fetchPhotoAtIndex(_ index:Int, _ totalImageCountNeeded: Int, _ fetchResult: PHFetchResult<PHAsset>) {
        
        // Note that if the request is not set to synchronous
        // the requestImageForAsset will return both the image
        // and thumbnail; by setting synchronous to true it
        // will return just the thumbnail
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        
        // Perform the image request
        PHImageManager.default().requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: view.frame.size, contentMode: PHImageContentMode.aspectFill, options: requestOptions, resultHandler: { (image, _) in
            if let image = image {
                // Add the returned image to your array
                self.images += [image]
            }
            // If you haven't already reached the first
            // index of the fetch result and if you haven't
            // already stored all of the images you need,
            // perform the fetch request again with an
            // incremented index
            if index + 1 < fetchResult.count && self.images.count < totalImageCountNeeded {
                self.fetchPhotoAtIndex(index + 1, totalImageCountNeeded, fetchResult)
            } else {
                // Else you have completed creating your array
                print("Completed array: \(self.images)")
            }
        })
    }
    

    
    
    
    
    //Allowing the user to have authorization
    /*
    PHPhotoLibrary.requestAuthorization { status in
    switch status {
    case .authorized:
    let fetchOptions = PHFetchOptions()
    let allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
    print("Found \(allPhotos.count) assets")
    case .denied, .restricted:
    print("Not allowed")
    case .notDetermined:
    // Should not see this when requesting
    print("Not determined yet")
    }
    }
*/
}

