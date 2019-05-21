//
//  FavouriteMoviesPresenterDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/21/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
protocol FavouriteMoviesPresenterDelegate {
    func setDelegate(favouriteMoviesViewDelegate : FavouriteMoviesViewDelegate)
    func getMoviesFromCoreData()
    func sendMoviesToView(movieList: [Movie]) 
}
