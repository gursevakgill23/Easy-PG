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
    
    @IBOutlet weak var uploadedItemImages: UIImageView!
    @IBOutlet weak var pricetextField: UITextField!
    @IBOutlet weak var uploadedImagesView: UIImageView!
    @IBOutlet weak var leaseTextField: UITextField!
    public var completionHandler : ((String?)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextField?.delegate = self
        pricetextField?.delegate = self
        leaseTextField?.delegate = self
        numberofBeds?.delegate = self
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
        imgPicker.allowsEditing = true
        return imgPicker
    }
    @IBAction func showImagePicker(_ sender: Any) {
        let picker = showImagePicker(sourceType: .photoLibrary)
        self.present(picker, animated: true)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else  {return}
        uploadedItemImages.image = image
        dismiss(animated: true)
    }
    
    @IBAction func uploadItemBtn(_ sender: Any) {
        completionHandler!(addressTextField.text)
        dismiss(animated: true)
        
    }
    
    

    
    
}
                                                                                                                                            
