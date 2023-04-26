//
//  SignUpViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 18.04.2023.
//

import UIKit
import RealmSwift

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpText: UILabel!
    
    static let storyboardIdentifier = "SignUpViewController"
    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpButtonDidTap(_ sender: UIButton){
        let user = User()
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        user.email = email ?? "some@mail.ru"
        user.name = name ?? "SomeName"
        user.password = password ?? "SomePassword"
        realm.beginWrite()
        realm.add(user)
        try! realm.commitWrite()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier)
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)

    }
    
    @IBAction func IHaveAnAccountButtonDidTap(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: LoginViewController.storyboardIdentifier)
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
    }
    

}
