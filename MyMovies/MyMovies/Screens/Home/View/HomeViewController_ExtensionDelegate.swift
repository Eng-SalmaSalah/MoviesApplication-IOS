//
//  HomeViewController_ExtensionDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import Alamofire

extension HomeViewController : HomeViewDelegate,UICollectionViewDelegateFlowLayout{


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
        let alert = UIAlertController(title: "No Internet Connection", message: "Please Check Your Internet Connection",preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    //set cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //width of view - 5 margin (from left and right)/2(2 cells per row)
        let width = (self.view.frame.size.width - 5*2)/2
        let height = width * 1.15 // ratio between width and height
        return CGSize(width: width, height: height)
    }

}
