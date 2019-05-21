//
//  MovieDetailsPresenter.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation


class MovieDetailsPresenter : MovieDetailsPresenterDelegate{
  
    
    var trailerList = [Trailer]()
    var reviewList=[String]()
    var movieDetailsDelegate:MovieDetailsViewDelegate?
    var jsonRetrievingUsingAlamofire : JsonRetrievingUsingAlamofireDelegate?
    var coreDataAccessDelegate : CoreDataAccessDelegate?
    
    init(){
        self.jsonRetrievingUsingAlamofire = JsonRetrievingUsingAlamofire(DetailsPresenter: self)
        self.coreDataAccessDelegate=CoreDataAccess(movieDetailsPresenterDelegate: self)
    }
    
 

    func setDelegate(movieDetailsDelegate:MovieDetailsViewDelegate){
        self.movieDetailsDelegate=movieDetailsDelegate
    }
    
    func getJsonResponseFromNetwork(movieID: String) {
        jsonRetrievingUsingAlamofire!.getTrailer(movieId: movieID)
        
        
    }
    func getJsonResponseFromNetworkReview(movieID: String) {
        jsonRetrievingUsingAlamofire!.getReviews(movieId: movieID)
        
    }
    
    
    func sendTrailersToView(TrailerList: [Trailer]){
      movieDetailsDelegate?.showMovieTrailers(trailerList: TrailerList)
    }
    
    
    func sendReviewsToView(ReviewsList: [String]){
        movieDetailsDelegate?.showMovieReviews(reviewList: ReviewsList)
    }
    
    func storeMovieInCoreData (favMovie:Movie){
        coreDataAccessDelegate?.storeMovieInCoreData(favouriteMovie: favMovie)
    }
    func notifyWithSavingResult(succeeded: Bool) {
        movieDetailsDelegate?.respondToStoringInCoreDataResult(succeeded: succeeded)
    }
    func removeMovieFromCoreData(unFavouritedMovie: Movie) {
        coreDataAccessDelegate?.removeMovieFromCoreData(unFavouritedMovie: unFavouritedMovie)
    }
    func notifyWithRemovingResult(succeeded: Bool) {
        movieDetailsDelegate?.respondToRemovingFromCoreDataResult(succeeded: succeeded)
    }
    func checkIfFavourite(movie: Movie) {
        coreDataAccessDelegate?.checkIfFavourite(movie: movie)
    }
    func respondToIfFavouriteCheck (favourite : Bool) {
        movieDetailsDelegate?.setMovieAsFavouriteOrNot(favourite: favourite)
    }
}
