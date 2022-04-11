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
        showdetailsView.isHidden = true
        editProfile.isHidden = true

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
    
    @IBOutlet weak var editProfile: UIButton!
    @IBOutlet weak var ownerimageView: UIImageView!
    
    @IBOutlet weak var showdetailsView: UITextView!
    @IBOutlet weak var imageBtn: UIButton!
    
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var bio: UITextField!
    @IBAction func addDetailsBtn(_ sender: Any) {
        let Name = firstname.text! + lastname.text!
        let Age = age.text!
        let Gender = gender.text!
        let Bio = bio.text!
        showdetailsView.text = "Name: \(Name)\nAge:\(Age)\nGender\(Gender)\nBio: \(Bio)"
        showdetailsView.isHidden = false
        editProfile.isHidden = false
    }
    func showImagePicker(sourceType:UIImagePickerController.SourceType)-> UIImagePickerController{
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = sourceType
        imgPicker.delegate = self
        imgPicker.allowsEditing = true
        return imgPicker
    }

    @IBAction func selectImage(_ sender: Any) {
        let picker = showImagePicker(sourceType: .photoLibrary)
        self.present(picker, animated: true)
    }
    @IBAction func editProfileBtn(_ sender: Any) {
        showdetailsView.isHidden = true
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else  {return}
        ownerimageView.image = image
        imageBtn.isHidden = true
        dismiss(animated: true)
    }
}
