//
//  LoginViewController.swift
//  Fast Food App
//
//  Created by Дархан Есенкул on 18.04.2023.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    static let storyboardIdentifier = "LoginViewController"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginText: UILabel!
    
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    @IBAction func loginButtonDidTap(_ sender: UIButton){
        let people = realm.objects(User.self)
        let email = emailTextField.text
        let password = passwordTextField.text
        for person in people{
            if email == person.email && password == person.password{
                print("\(person.name) entered")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = storyboard.instantiateViewController(withIdentifier: TabBarViewController.storyboardIdentifier)
                DataManager.shared.onlineUser = person.name
                mainVC.modalPresentationStyle = .fullScreen
                present(mainVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func dontHaveAccountButtonDidTap(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: SignUpViewController.storyboardIdentifier)
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }


}
