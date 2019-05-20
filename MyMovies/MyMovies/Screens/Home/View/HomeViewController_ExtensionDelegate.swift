//
//  HomeViewController_ExtensionDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import Alamofire
extension HomeViewController : HomeViewDelegate{


    func getMovieList(mostPopular : Bool) {
    homePresenter.getJsonResponseFromNetwork(mostPopular:mostPopular)
    
    }
    func showMovies(movieList: [Movie]) {
        self.movieList=movieList
        DispatchQueue.main.async {
            self.movieCollectionViewOutlet.reloadData()
        }

    }
    func showNoInternetConnectionAlert() {
        let alert = UIAlertController(title: "No Internet Connection", message: "Please Check Your Internet Connection",preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}
