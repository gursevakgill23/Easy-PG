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

    @IBAction func btnClear(_ sender: Any) {
        
        txtFullname.text = ""
        txtEmailid.text = ""
        txtFeedback.text = ""
    }
    
    
    
}
