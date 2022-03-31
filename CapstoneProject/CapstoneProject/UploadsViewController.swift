//
//  UploadsViewController.swift
//  CapstoneProject
//
//  Created by user202391 on 3/30/22.
//

import UIKit
typealias imageBlock = ((UIImage)->())

class UploadsViewController: UIViewController,UIImagePickerControllerDelegate
                             ,UINavigationControllerDelegate{
    var imgBlock:imageBlock?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func showImagePicker(sourceType:UIImagePickerController.SourceType)-> UIImagePickerController{
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = sourceType
        imgPicker.delegate = self
        imgPicker.allowsEditing = false
        return imgPicker
    }
    

    @IBAction func uploadImageBtn(_ sender: Any) {
        let picker = showImagePicker(sourceType: .photoLibrary)
        self.present(picker, animated: true)
    }
    
    @IBOutlet weak var addressTextField: UITextField!
    
}
