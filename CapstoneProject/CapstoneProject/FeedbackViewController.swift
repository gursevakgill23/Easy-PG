//
//  FeedbackViewController.swift
//  CapstoneProject
//
//  Created by user202462 on 4/11/22.
//

import UIKit

class FeedbackViewController: UIViewController,UITextFieldDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFullname.delegate = self
        txtEmailid.delegate = self
        txtFeedback.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        ErrorLb1.isHidden = true;

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtFullname.resignFirstResponder()
        txtEmailid.resignFirstResponder()
         txtFeedback.resignFirstResponder()
        return true
    
    }
    

    
    @IBOutlet weak var txtFullname: UITextField!
    
    
    @IBOutlet weak var txtEmailid: UITextField!
    
    @IBOutlet weak var txtFeedback: UITextField!
    
    
    
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

    

    @IBOutlet weak var ErrorLb1: UILabel!
    
    
    
    
    @IBAction func btnSubmit(_ sender: Any) {
        
        
    //login Button with Validation
    
        
        if( txtFullname.text?.count == 0 ){
            
            ErrorLb1.text = "Full Name is Mandatory"
            ErrorLb1.isHidden = false
        }
        else if(txtEmailid.text?.count == 0){
            
            ErrorLb1.text = "Email Id is Mandatory"
            ErrorLb1.isHidden = false
        }
        else if(txtFeedback.text?.count == 0){
            
            ErrorLb1.text = "Feedback is Mandatory"
            ErrorLb1.isHidden = false
        }
        else{
            
            let alertController = UIAlertController(title: "User Feedback", message:
                    "Your feedback has been submitted sucessfully", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))

                self.present(alertController, animated: true, completion: nil)

            
        }
        
        //hide label after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.ErrorLb1.isHidden = true
        }
        
    }
    
    
    
    @IBAction func btnClear(_ sender: Any) {
        
        txtFullname.text = ""
        txtEmailid.text = ""
        txtFeedback.text = ""
    }
    
    
    
}



