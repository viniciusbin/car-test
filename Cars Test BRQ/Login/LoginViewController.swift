//
//  LoginViewController.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 28/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    
    var loginScreen: LoginScreen?
    var userDetail: UserDetailsModel?
     
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.validateTextField()
        
        
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTFdelegate(delegate: self)
//        print(AuthService.shared.userLogged?.token ?? "nada")
        
    }

    
    func alert(title: String, message: String) {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        loginScreen?.validateTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField.text?.isEmpty == true {
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.red.cgColor
            
        }
        
    }
}

extension LoginViewController: LoginScreenProtocol {
    func actionLoginButton() {
        
        Service().postRequest(user: loginScreen?.loginTF.text ?? "" , password: loginScreen?.senhaTF.text ?? "") { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(responseJSON):
                    AuthService.shared.userLogged = responseJSON
                    print(AuthService.shared.userLogged?.token ?? "nada")
                    
                    let navVC = UINavigationController(rootViewController: HomeViewController())
                    navVC.modalPresentationStyle = .fullScreen
                    self.navigationController?.show(navVC, sender: nil)
                    
                case let .failure(error):
                    self.alert(title: "Opss", message: "Login incorreto")
                }
                
            }
            
            
        }
        
    }
}
