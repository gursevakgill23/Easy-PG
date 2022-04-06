//
//  MyInformationViewController.swift
//  CapstoneProject
//
//  Created by Gursevak Singh on 4/5/22.
//

import UIKit

class MyInformationViewController: UIViewController,UIImagePickerControllerDelegate
                                   ,UINavigationControllerDelegate,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        firstname.delegate = self
        lastname.delegate = self
        age.delegate  = self
        gender.delegate = self
        bio.delegate = self

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstname.resignFirstResponder()
        lastname.resignFirstResponder()
        age.resignFirstResponder()
        gender.resignFirstResponder()
        bio.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var ownerimageView: UIImageView!
    
    
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var bio: UITextField!
    @IBAction func addDetailsBtn(_ sender: Any) {
    }
    func showImagePicker(sourceType:UIImagePickerController.SourceType)-> UIImagePickerController{
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = sourceType
        imgPicker.delegate = self
        imgPicker.allowsEditing = false
        return imgPicker
    }

    @IBAction func selectImage(_ sender: Any) {
        let picker = showImagePicker(sourceType: .photoLibrary)
        self.present(picker, animated: true)
    }
}
