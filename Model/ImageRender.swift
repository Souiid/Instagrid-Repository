//
//  ImageRendered.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 13/06/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//

import Foundation
import UIKit

class ImageRender {
    
    static func rendingViewToImage(view: UIView)-> UIImage? {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil}
        UIGraphicsEndImageContext()
        return image
        
//        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
//        let imageOfView = renderer.image { ctx in
//        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//        }
//
//        return imageOfView
    }
}
