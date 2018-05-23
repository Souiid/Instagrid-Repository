//
//  LayoutButtons.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 18/05/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//

import UIKit

class LayoutCollection: UIStackView {

    @IBOutlet private var buttons : [UIButton]!
    
    enum Style {
        case selected, standard
    }
    
    var style: Style = .standard {
        didSet {
            
        }
    }
    
    private func setStyle(style: Style) {
        switch style {
        case .standard :
            buttons.
            
            
        }
    
    
}
