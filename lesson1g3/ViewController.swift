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
    @IBOutlet weak var loadLabel1: UILabel!
    @IBOutlet weak var loadLabel2: UILabel!
    @IBOutlet weak var loadLabel3: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.backgroundColor = UIColor.white
        passwordTextField.backgroundColor = UIColor.white
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
        loadAnimation()
        //    guard let login = self.loginTextField.text,
        //              let password = self.passwordTextField.text,
        //              login.trimmingCharacters(in: .whitespacesAndNewlines) == "admin",
        //              password.trimmingCharacters(in: .whitespacesAndNewlines) == "12345678"
        //        else {
        //            showAlert(alertText: "Wrong login or password")
        //            return
        //        }
        //
        // performSegue(withIdentifier: fromLoginToTabbarSegue, sender: self)
    }
    
    func loadAnimation() {
        UIView.animate(withDuration: 0.6, delay: 0.3, options: [.autoreverse, .repeat], animations: {[weak self] in
            guard let self = self else {return}
            self.loadLabel1.alpha = 1
        },
        completion: nil)
        UIView.animate(withDuration: 0.6, delay: 0.6, options: [.autoreverse, .repeat], animations: {[weak self] in
            guard let self = self else {return}
            self.loadLabel2.alpha = 1
        },
        completion: nil)
        UIView.animate(withDuration: 0.6, delay: 0.9, options: .autoreverse, animations: {[weak self] in
            guard let self = self else {return}
            self.loadLabel3.alpha = 1
        }, completion: {[weak self] _ in
            guard let self = self else {return}
            self.loadLabel3.alpha = 0
            UIView.animate(withDuration: 0.6, delay: 0, options: .autoreverse, animations: {[weak self] in
                guard let self = self else {return}
                self.loadLabel3.alpha = 1
            }, completion: {[weak self] _ in
                guard let self = self else {return}
                self.loadLabel3.alpha = 0
                self.performSegue(withIdentifier: self.fromLoginToTabbarSegue, sender: self)
            })
        })
    }
}
