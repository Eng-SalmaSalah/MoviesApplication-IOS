//
//  movieDetailsViewDelegate.swift
//  MyMovies
//
//  Created by Aya Mohamed Abdo on 5/19/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation

protocol MovieDetailsViewDelegate {
    
    func showMovieTrailers(trailerList: [Trailer])
    func showMovieReviews(reviewList: [String])
    func addMovieToFavourites()
    func respondToStoringInCoreDataResult(succeeded:Bool)
    func removeMovieFromFavourites()
    func respondToRemovingFromCoreDataResult(succeeded: Bool)
    func showAlert (type:String)
    func checkIfFavourite (movie : Movie)
    func setMovieAsFavouriteOrNot(favourite:Bool)
}
