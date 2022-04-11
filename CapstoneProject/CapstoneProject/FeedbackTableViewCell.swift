//
//  FeedbackTableViewCell.swift
//  CapstoneProject
//
//  Created by Teena Thomas on 4/4/22.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var txtFullname: UITextField!
    
    
    @IBOutlet weak var txtEmailid: UITextField!
    
    @IBOutlet weak var txtFeedback: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

    

    @IBOutlet weak var ErrorLb1: UILabel!
    

    @IBAction func btnSubmit(_ sender: Any) {
        
        
    //login Button with Validation
    
        
        if( txtFullname.text?.count == 0){
            
            ErrorLb1.text = "Full Name is Mandatory"
            ErrorLb1.isHidden = false
        }
        else if(txtEmailid.text?.count == 0){
            
            ErrorLb1.text = "OTP Must be 6 Digits"
            ErrorLb1.isHidden = false
        }
        else if(txtFeedback.text?.count == 0){
            
            ErrorLb1.text = "Wrong OTP"
            ErrorLb1.isHidden = false
        }
        else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "userSelection") as! UserSelectionViewController
            
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
            
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
