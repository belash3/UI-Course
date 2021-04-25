//
//  ViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 02.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let fromLoginToTabbarSegue = "fromLoginToTabbarSegue"

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func showAlert(alertText: String){
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: UIAlertController.Style.alert)
        let actionButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: {_ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        })
        alertController.addAction(actionButton)
        present(alertController, animated: true, completion: nil)
    }
 

    @IBAction func pressLoginButton(_ sender: Any) {
//    guard let login = self.loginTextField.text,
//              let password = self.passwordTextField.text,
//              login.trimmingCharacters(in: .whitespacesAndNewlines) == "admin",
//              password.trimmingCharacters(in: .whitespacesAndNewlines) == "12345678"
//        else {
//            showAlert(alertText: "Wrong login or password")
//            return
//        }
//
        performSegue(withIdentifier: fromLoginToTabbarSegue, sender: self)
    }
    

    
    
    
    
}
