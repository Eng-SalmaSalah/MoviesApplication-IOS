//
//  HomeViewController.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController/*, UICollectionViewDelegate,UICollectionViewDataSource*/ {
    var homePresenter:HomePresenter = HomePresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homePresenter.setDelegate(homeDelegate: self)
        homePresenter.getJsonResponse()
        print ("view did load")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //code
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //code
    }
   */
    

}
