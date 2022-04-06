//
//  UploadsViewController.swift
//  CapstoneProject
//
//  Created by Gursevak Singh on 3/30/22.
//

import UIKit

class UploadsViewController: UIViewController,UIImagePickerControllerDelegate
                             ,UINavigationControllerDelegate,UITextFieldDelegate{
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var numberofBeds: UITextField!
    
    @IBOutlet weak var pricetextField: UITextField!
    @IBOutlet weak var uploadedImagesView: UIImageView!
    @IBOutlet weak var leaseTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextField?.delegate = self
        pricetextField?.delegate = self
        leaseTextField?.delegate = self
        numberofBeds?.delegate = self
// Do any additional setup fter loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addressTextField.resignFirstResponder()
        leaseTextField.resignFirstResponder()
        numberofBeds.resignFirstResponder()
        pricetextField.resignFirstResponder()

        return true
    }

    func showImagePicker(sourceType:UIImagePickerController.SourceType)-> UIImagePickerController{
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = sourceType
        imgPicker.delegate = self
        imgPicker.allowsEditing = false
        return imgPicker
    }
    

    
    
}
                                                                                                                                            
