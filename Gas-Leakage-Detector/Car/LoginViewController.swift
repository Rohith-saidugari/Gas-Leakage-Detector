//
//  ViewController.swift
//  Car
//
//  Created by Student on 3/26/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF:UITextField!
    @IBOutlet weak var passwordTF:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login(_ sender:Any){
        
        if let emailId = emailTF.text , !emailId.isEmpty {
            if let password = passwordTF.text, !password.isEmpty{
                
                UserDefaults.standard.set(nil,forKey: "AccessToken")
                UserDefaults.standard.set(true, forKey: "status")
                UserDefaults.standard.set(nil,forKey: "error_description")
                
                //UserDefaults.standard.set(nil,forKey: "AccessToken")
                //UserDefaults.standard.set(true, forKey: "status")
                //UserDefaults.standard.set(nil,forKey: "error_description")
                
                let bodyData = "client_id=particle&client_secret=particle&grant_type=password&username=\(emailId)&password=\(password)"
                let result =
                    NetworkHelper.shared.loginRequestBuilder(RequestURL: APIConstants.LoginAPI, BodyData: bodyData, Method: "POST")
                if result == true {
                    let vc = Switcher.updateRootVC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
                else {
                    let message = "Invaild Credentials"
                    let title = UserDefaults.standard.object(forKey: "error_description") as! String
                    let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                    let actions:[UIAlertAction]=[action]
                    self.present(AlertHelper.shared.presentAlert(title:title,message:message,actions:actions), animated: true)
                    
                }
            }
            else{
                let message = "Empty Password Field"
                let title = "Enter your Password"
                let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                let actions:[UIAlertAction]=[action]
                self.present(AlertHelper.shared.presentAlert(title:title,message:message,actions:actions), animated: true)
            }
            
        } else {
            let message = "Empty email ID"
            let title = "Enter your email id"
            let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            let actions:[UIAlertAction]=[action]
            self.present(AlertHelper.shared.presentAlert(title:title,message:message,actions:actions), animated: true)
        }
        
    }
    
    
}

