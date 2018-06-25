//
//  ViewController.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 14/05/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//


// valid photoview

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

   
    @IBOutlet var layoutButtons: [UIButton]!
    @IBOutlet weak var photoView: PhotoView!
    let imagePickerController = UIImagePickerController()
    
    var swipeGestureRecognizer: UISwipeGestureRecognizer?
    var longPressGesture: UILongPressGestureRecognizer?
    
    var selectorIndex = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for button in layoutButtons {
            button.isSelected = false
        }

        layoutButtons[1].isSelected = true
        photoView.style = .upSquares
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(pressOnImage(_:)))
        
        longPressGesture?.minimumPressDuration = 1.0
        
        photoView.addGestureRecognizer(longPressGesture!)
        
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipePhotoView(_:)))
        
        selectSwipeGesture()
        
        photoView.addGestureRecognizer(swipeGestureRecognizer!)
        NotificationCenter.default.addObserver(self, selector: #selector(selectSwipeGesture), name: .UIDeviceOrientationDidChange, object: nil)
        
        imagePickerController.delegate = self
        
    }
    
    @objc func selectSwipeGesture() {
        if UIDevice.current.orientation == .portrait {
            swipeGestureRecognizer?.direction = UISwipeGestureRecognizerDirection.up
        }else{
            swipeGestureRecognizer?.direction = UISwipeGestureRecognizerDirection.left
        }
        
    }
    
    @objc func pressOnImage(_ gesture: UILongPressGestureRecognizer) {
        photoView.refresh()
    }
    
    func openPopUpToShare(){
        guard let image = ImageRender.rendingViewToImage(view: photoView) else { return }
       let activityC = UIActivityViewController(activityItems: [image], applicationActivities: nil)

      present(activityC, animated: true, completion: nil)
        activityC.completionWithItemsHandler = { activity, completed, items, error in
            print("\n ERROR \n")
            
            self.photoView.transform = .identity
        }
        
    }
    
    
    @objc private func swipePhotoView(_ gesture: UISwipeGestureRecognizer) {
        if swipeGestureRecognizer?.direction == .up {
            animationBegin(duration: 0.5, x: 0, y: -view.frame.height)
        }else {
            animationBegin(duration: 0.5, x: -view.frame.width, y: 0)
        }
        
        self.openPopUpToShare()
        
    }
    
    func animationBegin(duration: Double, x: CGFloat, y: CGFloat) {

        UIView.animate(withDuration: duration, animations: {
            self.photoView.transform = CGAffineTransform(translationX: x, y: y)
        }) { _ in
           
            
        }
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
        let ind = photoView.photoButtons.index(of: sender)
        selectorIndex = ind!
        
        print(selectorIndex)
        print("PHOTO BUTTON : ", selectorIndex)
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        
        present(imagePickerController, animated: true) {
        
        
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let myImage = photoView.images[selectorIndex]
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImage.image = image
            photoView.photoButtons[selectorIndex].isHidden = true
            myImage.isHidden = false
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

