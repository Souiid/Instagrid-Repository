//
//  ViewController.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 14/05/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//


// Transformer photoview en image / deplacer outlet / refresh func, valid photoview

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

   
    @IBOutlet var layoutButtons: [UIButton]!
    @IBOutlet weak var photoView: PhotoView!
    let imagePickerController = UIImagePickerController()
    
    @IBOutlet var photoButtons: [UIButton]!
    @IBOutlet var images: [UIImageView]!
    
    @IBOutlet weak var stackView: UIStackView!
   
    var selectorIndex = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for button in layoutButtons {
            button.isSelected = false
        }

        layoutButtons[1].isSelected = true
        photoView.style = .upSquares
        
        let swipenGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipePhotoView(_:)))
            swipenGestureRecognizer.direction = UISwipeGestureRecognizerDirection.up
        photoView.addGestureRecognizer(swipenGestureRecognizer)
        
        
        imagePickerController.delegate = self
        
    }
    
    
    
    
    
    
      func openPopUpToShare(){
       let activityC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)

      present(activityC, animated: true, completion: nil)
        activityC.completionWithItemsHandler = { activity, completed, items, error in
            //
        }
    }
    
    
    
    
    
    @objc private func swipePhotoView(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.state {
        case .ended, .cancelled :
            transformPhotoView(gesture: gesture)
            openPopUpToShare()
            photoView.refresh()
        default:
            break
        }
    }
    
    func moveUp(view: UIView){
        view.center.y += 100
    }
    
    private func transformPhotoView(gesture: UISwipeGestureRecognizer) {
        let translation = gesture.location(in: photoView)
      
        
        print("TRANSLATION: ", translation)
        
        UIView.animate(withDuration: 0.1, animations: {
           self.photoView.center.y -= 40
        })
        
    }
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
        let ind = photoButtons.index(of: sender)
        selectorIndex = ind!
        print(selectorIndex)
        print("PHOTO BUTTON : ", selectorIndex)
        
        
        
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        
        present(imagePickerController, animated: true) {
        
        
        }
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let myImage = images[selectorIndex]
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImage.image = image
            photoButtons[selectorIndex].isHidden = true
        }else{
            print("AAAAA")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
        let ind = layoutButtons.index(of: sender)
        print(ind!)
        modifyLayout(index: ind!)
        
        
    
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
}

