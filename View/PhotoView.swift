//
//  PhotoView.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 20/05/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//

import UIKit

class PhotoView: UIView {
    
    // - MARK: OUTLETS
    @IBOutlet var upView : UIView!
    @IBOutlet var downView: UIView!
    @IBOutlet var images : [UIImageView]!
    @IBOutlet var photoButtons: [UIButton]!
   
    
    // - MARK: VARS & ENUM
    enum Style {
        case upSquares, downSquares, allSquares
    }
    
    var style : Style = .allSquares {
        didSet {
            setStyle(style)
        }
    }
    
    // - MARK: METHODS
    // Manage PhotoView
    func setStyle(_ style: Style) {
        switch style {
        case .upSquares:
            downView.isHidden = true
            upView.isHidden = false
        case .downSquares:
            upView.isHidden = true
            downView.isHidden = false
        case .allSquares:
            upView.isHidden = false
            downView.isHidden = false
        }
    }
    //Remove all images 
    func refresh() {
        for image in images {
            image.image = nil
        }
        
        for button in photoButtons {
            button.isHidden = false
        }
       
        print("\n REFRESH \n")
    }
    
}


