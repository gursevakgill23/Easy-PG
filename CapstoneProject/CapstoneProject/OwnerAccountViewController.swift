//
//  OwnerAccountViewController.swift
//  CapstoneProject
//
//  Created by Gursevak Singh on 4/11/22.
//

import UIKit

class OwnerAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBAction func backupBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Backup and Restore", message:
            "Backup Done!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))

        self.present(alertController, animated: true, completion: nil)

    }
    
    @IBAction func resetBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Reset", message:
            "All your Account details,Favourites and Uploads will be resetted!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))

        self.present(alertController, animated: true, completion: nil)

    }
}
