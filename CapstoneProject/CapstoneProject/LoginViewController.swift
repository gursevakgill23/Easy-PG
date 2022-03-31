//
//  LoginViewController.swift
//  CapstoneProject
//
//  Created by Bhavin Pethani on 3/23/22.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var MobileNumber: UITextField!
    
    @IBOutlet weak var OtpTxt: UITextField!
    
    @IBOutlet weak var ErrorLbl: UILabel!
    
    var OTP = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide keyboard when user tap outside
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        ErrorLbl.isHidden = true;
    }
    
    // keyboard dismis function
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //login Button with Validation
    @IBAction func LoginBtn(_ sender: Any) {
        
        if(MobileNumber.text?.count != 10){
            
            ErrorLbl.text = "Mobile Number Must be 10 Digits"
            ErrorLbl.isHidden = false
        }
        else if(OtpTxt.text?.count != 6){
            
            ErrorLbl.text = "OTP Must be 6 Digits"
            ErrorLbl.isHidden = false
        }
        else if(OTP != OtpTxt.text){
            
            ErrorLbl.text = "Wrong OTP"
            ErrorLbl.isHidden = false
        }
        else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "userSelection") as! UserSelectionViewController
            
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
            
        }
        
        //hide label after 3 seconds 
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.ErrorLbl.isHidden = true
        }
        
    }
    
    
}
