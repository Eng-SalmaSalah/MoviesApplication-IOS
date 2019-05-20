//
//  HomeDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
protocol HomeViewDelegate {
    func getMovieList(mostPopular : Bool)
    func showMovies(movieList:[Movie])
    func showNoInternetConnectionAlert()
}
