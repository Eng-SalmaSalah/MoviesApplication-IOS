//
//  MovieDetailsDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation

protocol MovieDetailsPresenterDelegate {
    
    func getJsonResponseFromNetwork(movieID:String)
    func getJsonResponseFromNetworkReview(movieID: String) 
    func sendTrailersToView(TrailerList: [Trailer])
    func sendReviewsToView(ReviewsList: [String])
    func storeMovieInCoreData (favMovie:Movie)
    func notifyWithSavingResult(succeeded:Bool)
    func removeMovieFromCoreData(unFavouritedMovie : Movie)
    func notifyWithRemovingResult(succeeded:Bool)
    func checkIfFavourite(movie : Movie)
    func respondToIfFavouriteCheck (favourite : Bool)
   func setDelegate(movieDetailsDelegate:MovieDetailsViewDelegate)
}
