//
//  ScreenShotStruct.swift
//  ScreenShotTester
//
//  Created by Eli Warner on 2/8/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import Foundation
import UIKit

struct ScreenShot {
    
    var delete: Bool
    var image: UIImage
    
    init(image: UIImage, delete: Bool){
        self.image = image
        self.delete = delete
    }
}
