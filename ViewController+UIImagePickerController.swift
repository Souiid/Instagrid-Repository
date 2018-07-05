//
//  ViewController+UIImagePickerController.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 28/06/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let myImage = photoView.images[selectorIndex]
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImage.image = image
            photoView.photoButtons[selectorIndex].isHidden = true
            myImage.isHidden = false
            
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
