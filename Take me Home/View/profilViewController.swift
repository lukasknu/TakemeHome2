//
//  profilViewController.swift
//  Take me Home
//
//  Created by Lukas on 15.11.17.
//  Copyright © 2017 Developster - Lukas Knutti. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class profilViewController: UIViewController {
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var currentUser: UILabel!
    @IBAction func saveBtn(_ sender: UIButton) {
    }
    func setUserName() {
        self.currentUser.text = username
    }
    
    let username = Auth.auth().currentUser?.email
    @IBAction func logOutBtn(_ sender: UIButton) {
        do {
           try Auth.auth().signOut()
            performSegue(withIdentifier: "logOut", sender: self)
        } catch {
            let alert = UIAlertController(title: "Logout Failed", message: "Logout Failed! Check your Internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print(error)
        }
    }
    
}
