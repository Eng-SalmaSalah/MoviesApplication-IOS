//
//  HomeViewController_ExtensionDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
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
    
}
