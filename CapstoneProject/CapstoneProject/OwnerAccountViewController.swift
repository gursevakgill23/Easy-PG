//
//  OwnerAccountViewController.swift
//  CapstoneProject
//
//  Created by user202391 on 4/11/22.
//

import UIKit

class OwnerAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
