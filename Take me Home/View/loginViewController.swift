//
//  loginViewController.swift
//  Take me Home
//
//  Created by Lukas on 15.11.17.
//  Copyright © 2017 Developster - Lukas Knutti. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD
class loginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        SVProgressHUD.show()
        
        if let email = self.emailTextField.text, let password = self.passwordTextField.text {
            
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if let error = error {
                            let alert = UIAlertController(title: "Login Failed", message: "Login Failed! Check your Internet connection, and check your eMail and Password.", preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                    }      else{
                       self.performSegue(withIdentifier: "goToHome", sender: self)
            }
                    SVProgressHUD.dismiss()
        }
        
    }
    }
    @IBAction func resetPassword(_ sender: UIButton) {
        let userEmail = emailTextField.text
        Auth.auth().sendPasswordReset(withEmail: userEmail!) { (error) in
            let alert = UIAlertController(title: "Password Reset", message: "To Reset your password, you need to enter your email in the textfield and click Reset Password. Thanks!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
