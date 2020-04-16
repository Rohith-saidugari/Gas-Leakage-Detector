//
//  TestViewController.swift
//  Car
//
//  Created by Student on 4/15/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class TestViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var imageData: [String] = [String]()
    var imageCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Images"
               navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action:#selector(logout))
        imageData = ["Steering"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath as IndexPath) as! MyImageCell
              cell.backgroundColor = UIColor.white
                  var currImage:String = ""
                  currImage = self.imageData[self.imageCounter]
                  self.imageCounter += 1
                  if self.imageCounter >= self.imageData.count {
                          self.imageCounter = 0
                  }
                  cell.image.image = UIImage(named: currImage)
                  return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        
     }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
                  return CGSize(width: 190, height: 190)
        
    }

    
    @objc func logout() {
        UserDefaults.standard.set(false, forKey: "status")
        let vc = Switcher.updateRootVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
