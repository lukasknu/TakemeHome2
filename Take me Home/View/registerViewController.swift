//
//  registerViewController.swift
//  Take me Home
//
//  Created by Lukas on 15.11.17.
//  Copyright © 2017 Developster - Lukas Knutti. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import SVProgressHUD

class registerViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func registerBtn(_ sender: UIButton) {
    
        SVProgressHUD.show()
        if let email = self.emailTextField.text, let password = self.passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    let alert = UIAlertController(title: "Registration Failed", message: "Registration Failed! Check your Internet connection, and check your eMail and Password.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else{
                    self.performSegue(withIdentifier: "goToHomeR", sender: self)
                }
                SVProgressHUD.dismiss()
            }
            
        }
    }
    
    
}
