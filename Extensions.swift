//
//  Extensions.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 28/06/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//

import UIKit

extension UIImagePickerController {
    
    open override var shouldAutorotate: Bool { return true }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {return .all}
        
}
