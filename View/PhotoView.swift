//
//  PhotoView.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 20/05/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//

import UIKit

class PhotoView: UIView {
    
    @IBOutlet var upView : UIView!
    @IBOutlet var downView: UIView!
    
    enum Style {
        case upSquares, downSquares, allSquares
    }
    
    var style : Style = .allSquares {
        didSet {
            setStyle(style)
        }
    }
    
    func setStyle(_ style: Style) {
        switch style {
        case .upSquares:
            downView.isHidden = true
        case .downSquares:
            upView.isHidden = true
        case .allSquares:
            upView.isHidden = false
            downView.isHidden = false
        }
    }

}
