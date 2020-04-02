//
//  Switcher.swift
//  Car
//
//  Created by Student on 3/26/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation
import UIKit

class Switcher {
    
    
    
    static func updateRootVC() -> UIViewController{
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarvc") as! TabBarViewController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginvc") as! LoginViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
        return rootVC!
        
    }
    
}
