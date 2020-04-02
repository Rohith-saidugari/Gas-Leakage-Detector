//
//  AlertHelper.swift
//  Car
//
//  Created by Student on 3/27/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation
import UIKit

struct AlertHelper{
    private static var _shared:AlertHelper!
    
    static var shared:AlertHelper {         // To access this anywhere, in the app just write Restaurants.shared
        if _shared == nil {
            _shared = AlertHelper()
        }
        return _shared
    }
    
    func presentAlert(title:String,message:String,actions:[UIAlertAction])->UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        for action in actions {
          alert.addAction(action)
        }
        return alert
    }
}
