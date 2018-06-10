//
//  LoginVC.swift
//  WatchProject
//
//  Created by Jakub Majewski on 09.06.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Login View"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func test(_ sender: Any) {
        print("Test")
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        print("Action")
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "qwerty" && password == "qwerty" {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Wrong password", message: "Please type qwerty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
