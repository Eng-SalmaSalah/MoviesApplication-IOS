//
//  CoreDataAccessDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/19/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
protocol CoreDataAccessDelegate {
    func storeMovieInCoreData (favouriteMovie : Movie)
    func getMoviesFromCoreData ()
    func showMoviesFromCoreData ()
    func removeMovieFromCoreData(unFavouritedMovie:Movie)
    func checkIfFavourite(movie : Movie)
  
}
