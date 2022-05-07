//
//  LoginViewController.swift
//  msm-chat
//
//  Created by Fernando on 08/04/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var errorFieldMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tryLogin() {
        errorFieldMessage.isHidden = true
        defaultInputFieldLayer(field: usernameInput)
        defaultInputFieldLayer(field: passwordInput)
        
        
        if (isLoginFieldsValid(username: usernameInput.text ?? "", password: passwordInput.text ?? "")) {
            //Implement login connection logic
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "ConversationViewController") as! ConversationsViewController
            self.present(controller, animated: true, completion: nil)
        } else {
            errorFieldMessage.isHidden = false
            errorInputFieldLayer(field: usernameInput)
            errorInputFieldLayer(field: passwordInput)
        }
    }

    @IBAction func registerAccount() {
        performSegue(withIdentifier: "Go Register", sender: Any?.self)
    }
    
    private func isLoginFieldsValid(username : String, password: String) -> Bool {
        let isUsernameEmpty = isEmptyField(field: username)
        let isPasswordEmpty = isEmptyField(field: password)
        return isUsernameEmpty == false && isPasswordEmpty == false
    }
    
    private func isEmptyField(field : String) -> Bool {
        return field == ""
    }
    
    private func defaultInputFieldLayer(field : UITextField) {
        field.layer.borderWidth = 0
    }
    
    private func errorInputFieldLayer(field : UITextField) {
        if(field.text == ""){
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.red.cgColor
        }
        
    }

}
