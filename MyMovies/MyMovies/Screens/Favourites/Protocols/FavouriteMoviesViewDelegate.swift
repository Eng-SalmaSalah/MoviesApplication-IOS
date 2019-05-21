//
//  FavouriteMoviesViewDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/21/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
protocol FavouriteMoviesViewDelegate {
    func getFavouriteMoviesFromCoreData()
    func showMovies(movieList:[Movie])
}
