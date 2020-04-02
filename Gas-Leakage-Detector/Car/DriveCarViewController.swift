//
//  DriveCarViewController.swift
//  Car
//
//  Created by Student on 3/26/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class DriveCarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Drive"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        let centerButton = createButton(size: 50)
        
        // Looks like there is some issue with buttons will fix it soon
       /* self.view.addSubview(centerButton)
        
      centerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      centerButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

      setUpButtons(count: 4, around: centerButton, radius: 100)*/

        
    }
    
    @objc func logout() {
           UserDefaults.standard.set(false, forKey: "status")
           let vc = Switcher.updateRootVC()
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true, completion: nil)
       }
    
    // Below code is to create circular buttons
    /*
     
     func createButton(size: CGFloat) -> UIButton {
         let button = UIButton(type: .custom)
         button.backgroundColor = .red
         button.translatesAutoresizingMaskIntoConstraints = false
         button.widthAnchor.constraint(equalToConstant: size).isActive = true
         button.heightAnchor.constraint(equalToConstant: size).isActive = true
         button.layer.cornerRadius = size / 2

         return button
     }
    func setUpButtons(count: Int, around center: UIView, radius: CGFloat) {
        // compute angular separation of each button
        let degrees = 360 / CGFloat(count)

        for i in 0 ..< count {
            let button = createButton(size: 50)
            self.view.addSubview(button)

            // use trig to compute offsets from center button
            let hOffset = radius * cos(CGFloat(i) * degrees * .pi / 180)
            let vOffset = radius * sin(CGFloat(i) * degrees * .pi / 180)

            // set new button's center relative to the center button's
            // center using centerX and centerY anchors and offsets
            button.centerXAnchor.constraint(equalTo: center.centerXAnchor, constant: hOffset).isActive = true
            button.centerYAnchor.constraint(equalTo: center.centerYAnchor, constant: vOffset).isActive = true
        }
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
