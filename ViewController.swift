//
//  ViewController.swift
//  Instagrid1
//
//  Created by Souissi idriss2 on 14/05/2018.
//  Copyright © 2018 Souissi idriss2. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet var layoutButtons: [UIButton]!
    @IBOutlet weak var photoView: PhotoView!
    
    // MARK: - VARS
   private let imagePickerController = UIImagePickerController()
    
    private var swipeGesture: UISwipeGestureRecognizer?
    private var longPressGesture: UILongPressGestureRecognizer?
    private var tapGesture: UITapGestureRecognizer?
    
    
    
     var selectorIndex = 0
    
    
    
    // MARK: - VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpBehaviors()
        
    }
    
    // MARK: - CLASS METHODS
    // MARK: - GESTURE METHODS
    private func setUpBehaviors() {
        
        photoView.style = .upSquares
        
        // Long press gesture
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(pressOnImage(_:)))
        longPressGesture?.minimumPressDuration = 1.0
        
        guard let longPressGesture = longPressGesture else {return}
        photoView.addGestureRecognizer(longPressGesture)
        
        // Swipe gesture
        
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipePhotoView(_:)))
        selectSwipeGesture()
        
        guard let swipeGestureRecognizer = swipeGesture else {return}
        photoView.addGestureRecognizer(swipeGestureRecognizer)
        NotificationCenter.default.addObserver(self, selector: #selector(selectSwipeGesture), name: .UIDeviceOrientationDidChange, object: nil)
        
        //Tap gesture
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_:)))
        tapGesture?.numberOfTapsRequired = 2
        
        guard let tapGesture = tapGesture else {return}
        
        for image in photoView.images {
            image.addGestureRecognizer(tapGesture)
        }
        
        
        imagePickerController.delegate = self
        
    }
    
    // Tap on image for remove it
    @objc func tapOnImage(_ gesture: UITapGestureRecognizer) {
        photoView.images[0].image = nil
        print("DOUBLE TAP")
    }
    
    // Select the direction of the swipe gesture according to phone rotation
    @objc private func selectSwipeGesture() {
        if UIDevice.current.orientation == .portrait {
            swipeGesture?.direction = UISwipeGestureRecognizerDirection.up
        }else{
            swipeGesture?.direction = UISwipeGestureRecognizerDirection.left
        }
        
    }
    // Remove all image after the press gesture
    @objc private func pressOnImage(_ gesture: UILongPressGestureRecognizer) {
        photoView.refresh()
    }
    
    // Animate photoView according to the phone rotation
    @objc private func swipePhotoView(_ gesture: UISwipeGestureRecognizer) {
        if swipeGesture?.direction == .up {
            animationBegin(duration: 0.5, x: 0, y: -view.frame.height)
        }else {
            animationBegin(duration: 0.5, x: -view.frame.width, y: 0)
        }
        
        self.openPopUpToShare()
        
    }
    
    // Animate the photoview
    private func animationBegin(duration: Double, x: CGFloat, y: CGFloat) {
        
        UIView.animate(withDuration: duration) {
            self.photoView.transform = CGAffineTransform(translationX: x, y: y)
        }
    }
    
    //MARK: - PHOTO MANAGER METHODS
    
    // Add photo in a case
    @IBAction @objc func addPhoto(_ sender: UIButton) {
        
        guard let ind = photoView.photoButtons.index(of: sender) else {return}
        selectorIndex = ind
        
        print(selectorIndex)
        print("PHOTO BUTTON : ", selectorIndex)
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        
        present(imagePickerController, animated: true) {
        
        
        }
        
    }
   
    // Open pop up and animate photoView
    private func openPopUpToShare(){
        guard let image = ImageRender.rendingViewToImage(view: photoView) else { return }
        let activityC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(activityC, animated: true, completion: nil)
        activityC.completionWithItemsHandler = { activity, completed, items, error in
            print("\n ERROR \n")
            
            self.photoView.transform = .identity
        }
    }
    
    // MARK: - LAYOUT METHODS
    // Change the layout of photoView
    private func modifyLayout(index: Int) {
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
    
    // Select the layout of photoView according to layoutButtons
    @IBAction func selectLayout(_ sender: UIButton) {
        for button in layoutButtons {
            button.isSelected = false
        }
        sender.isSelected = true
        guard let ind = layoutButtons.index(of: sender) else {return}
        print(ind)
        modifyLayout(index: ind)
    }
    

}

