//
//  ViewController.swift
//  Tinder
//
//  Created by Kostyantyn Runduyev on 5/16/17.
//  Copyright © 2017 CuriousIT. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    var signupMode = false
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signupOrLoginButton: UIButton!
    @IBOutlet weak var changeSignupModeButton: UIButton!
    @IBOutlet weak var errorField: UILabel!
    
    @IBAction func signupOrLogin(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
        
        if signupMode {
            FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                if error != nil {
                    self.errorField.text = error!.localizedDescription
                } else {
                    self.errorField.text = ""
                }
            }
        } else {
            FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                if error != nil {
                    self.errorField.text = error!.localizedDescription
                } else {
                    self.errorField.text = ""
                }
            }
        }
    }
    
    @IBAction func changeSignupMode(_ sender: Any) {
        if signupMode {
            signupMode = false
            signupOrLoginButton.setTitle("Log In", for: [])
            changeSignupModeButton.setTitle("Sign Up", for: [])
        } else {
            signupMode = true
            signupOrLoginButton.setTitle("Sign Up", for: [])
            changeSignupModeButton.setTitle("Log In", for: [])
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

