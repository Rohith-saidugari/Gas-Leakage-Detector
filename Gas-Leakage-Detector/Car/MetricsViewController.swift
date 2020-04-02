//
//  MetricsViewController.swift
//  Car
//
//  Created by Student on 4/1/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class MetricsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Gas Metrics"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action:#selector(logout))
        // Do any additional setup after loading the view.
    }
    
    @objc func logout() {
           UserDefaults.standard.set(false, forKey: "status")
           let vc = Switcher.updateRootVC()
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true, completion: nil)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
