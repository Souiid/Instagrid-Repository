//
//  ViewController.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 14/05/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var layoutButtons: [UIButton]!
    @IBOutlet weak var photoView: PhotoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func modifyLayout(index: Int) {
        switch index {
        case 0:
             photoView.style = .downSquares
        case 1:
            photoView.style = .upSquares
        case 2:
            photoView.style = .allSquares
        default:
            print("ERROR")
        }
     
    }
    
    @IBAction func selectLayout(_ sender: UIButton) {
        for button in layoutButtons {
            button.isSelected = false
        }
        sender.isSelected = true
        
    
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
}

