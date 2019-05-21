//
//  FavouriteMoviesCollectionViewController_ExtensionDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/21/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import UIKit

extension FavouriteMoviesCollectionViewController : FavouriteMoviesViewDelegate,UICollectionViewDelegateFlowLayout{
  
   
    func getFavouriteMoviesFromCoreData() {
        favouriteMoviesPresenterDelegate.getMoviesFromCoreData()
    }
    
    func showMovies(movieList: [Movie]) {
        self.movieList=movieList
        self.collectionView?.reloadData()

    }
    
    func reloadDataAfterDeletion() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    
    //set cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //width of view - 5 margin (from left and right)/2(2 cells per row)
        let width = (self.view.frame.size.width - 5*2)/2
        let height = width * 1.15 // ratio between width and height
        return CGSize(width: width, height: height)
    }
    
}
