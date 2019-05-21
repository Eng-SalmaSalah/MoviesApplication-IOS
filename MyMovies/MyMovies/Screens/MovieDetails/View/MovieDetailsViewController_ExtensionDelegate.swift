//
//  MovieDetailsViewController_ExtensionDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import UIKit

extension MovieDetailsViewController : MovieDetailsViewDelegate{
   
    func showMovieTrailers(trailerList: [Trailer]) {
        self.TrailerList=trailerList
        DispatchQueue.main.async {
          self.trailersTableview.reloadData()
        }
        //print(self.TrailerList)  //to ensure that
    }
    func showMovieReviews(reviewList: [String]) {
        self.ReviewList=reviewList
        DispatchQueue.main.async {
            self.reviewsTableview.reloadData()
        }
       //print(self.ReviewList)  //to ensure that
    }
    func getMovieList(MovieId : String) {
        moviePresenterDelegate.getJsonResponseFromNetwork(movieID: MovieId)
    }
    func getReviewList(MovieId:String){
moviePresenterDelegate.getJsonResponseFromNetworkReview(movieID:MovieId)
    }
    func addMovieToFavourites(){
        moviePresenterDelegate.storeMovieInCoreData(favMovie: selectedMovie)
    }
    func respondToStoringInCoreDataResult(succeeded: Bool) {
        if succeeded{
            storedAsFavourite=true
        }
        else{
            storedAsFavourite=false
        }
    }
    func removeMovieFromFavourites(){
        moviePresenterDelegate.removeMovieFromCoreData(unFavouritedMovie:selectedMovie)
    }
    func respondToRemovingFromCoreDataResult(succeeded: Bool) {
        if succeeded{
            removedFromFavourites=true
        }
        else{
            removedFromFavourites=false
        }
    }

    func showAlert (type : String) {
        var alert : UIAlertController?
        if type == "failedToStore"
        {
            alert = UIAlertController(title: "Failed", message: "Failed To Add Movie To Favourites",preferredStyle: .alert)
        }
        else
        {
            alert = UIAlertController(title: "Failed", message: "Failed To Remove Movie From Favourites",preferredStyle: .alert)
        }
        alert?.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        self.present(alert!, animated: true, completion: nil)
    }
    
    func checkIfFavourite(movie: Movie) {
        moviePresenterDelegate.checkIfFavourite(movie: movie)
    }
    func setMovieAsFavouriteOrNot(favourite: Bool) {
        selectedAsFavourite = true
    }
    
}
