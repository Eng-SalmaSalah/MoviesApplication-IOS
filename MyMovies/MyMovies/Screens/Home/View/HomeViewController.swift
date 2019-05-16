//
//  HomeViewController.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var movieCollectionViewOutlet: UICollectionView!
    
    var movieList = [Movie]()
    

    var homePresenter:HomePresenter = HomePresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionViewOutlet.delegate=self
        movieCollectionViewOutlet.dataSource=self
        // Do any additional setup after loading the view.
        homePresenter.setDelegate(homeDelegate: self)
        homePresenter.getJsonResponse()
        //print (movieList)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HomeCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        let imageURL = "https://image.tmdb.org/t/p/w185"+movieList[indexPath.row].posterPath
        
        cell.MovieImage.sd_setImage(with: URL(string:imageURL ), placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }
   
    

}
