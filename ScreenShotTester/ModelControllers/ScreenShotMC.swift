//
//  ScreenShotMC.swift
//  ScreenShotTester
//
//  Created by Eli Warner on 2/8/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import Foundation
import UIKit
import Photos

class ScreenShotMC {
    
    var screenShots: [ScreenShot]?
/*
    func getScreenshot(screenShots: ScreenShot)-> ScreenShot{
        
    }
    */
    
    func screenShotCount()-> Int{
        print("There were \(String(describing: screenShots?.count)) screen Shots")
        return (screenShots?.count)!
    }
    
    func fetchPhotos() {
        // Sort the images by descending creation date and fetch the first 3
        let fetchOptions = PHFetchOptions()
        
        // Fetching the Image Based on the Screenshot identifier.
        fetchOptions.predicate = NSPredicate(format: "(mediaSubtype & %d) != 0", PHAssetMediaSubtype.photoScreenshot.rawValue)
        
        //Fetching Screen Shots
        let result = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        print("Screenshots: \(result.count) :: 2")
        
        // If the fetch result isn't empty,
        
        // proceed with the image request
        if result.count > 0 {
            let totalImageCountNeeded = 3 // <-- The number of images to fetch
            fetchPhotoAtIndex(0, totalImageCountNeeded, result)
        } else {
            print("There were no Screenshots")
        }
    }
    
    func fetchPhotoAtIndex(_ index:Int, _ totalImageCountNeeded: Int, _ fetchResult: PHFetchResult<PHAsset>) {
        
        // Note that if the request is not set to synchronous
        // the requestImageForAsset will return both the image
        // and thumbnail; by setting synchronous to true it
        // will return just the thumbnail
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        
        //Allows the Image to be fullsize with no modifications
        // Perform the image request
        PHImageManager.default().requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.aspectFill, options: requestOptions, resultHandler: { (image, _) in
            
            
            // If you haven't already reached the first
            // index of the fetch result and if you haven't
            // already stored all of the images you need,
            // perform the fetch request again with an
            // incremented index
            if index + 1 < fetchResult.count && (self.screenShots?.count)! < totalImageCountNeeded {
                self.fetchPhotoAtIndex(index + 1, totalImageCountNeeded, fetchResult)
            } else {
                // Else you have completed creating your array
            }
        })
    }
    


}
