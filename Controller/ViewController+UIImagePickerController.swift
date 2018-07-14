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
    
    // Open PickerController and replace the image by a photo in library.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let tag = tag else {return}
        
        let myImage = photoView.images[tag]
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImage.image = image
            photoView.photoButtons[tag].isHidden = true
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_:)))
           
            for imageView in photoView.images {
                if imageView.tag == tag {
                   imageView.addGestureRecognizer(tapGesture)
                }
             }
            
         }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
