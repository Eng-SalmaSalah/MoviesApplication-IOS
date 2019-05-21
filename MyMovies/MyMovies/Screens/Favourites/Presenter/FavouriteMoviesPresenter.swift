//
//  FavouriteMoviesPresenter.swift
//  MyMovies
//
//  Created by Salma on 5/21/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
class FavouriteMoviesPresenter : FavouriteMoviesPresenterDelegate {

    var favouriteMoviesViewDelegate : FavouriteMoviesViewDelegate?
    var coreDataAccessDelegate : CoreDataAccessDelegate?
    init(){
        coreDataAccessDelegate=CoreDataAccess(favouriteMoviesPresenterDelegate: self)
    }
    func setDelegate(favouriteMoviesViewDelegate: FavouriteMoviesViewDelegate) {
        self.favouriteMoviesViewDelegate=favouriteMoviesViewDelegate
    }
    func getMoviesFromCoreData() {
        coreDataAccessDelegate?.getMoviesFromCoreData()
    }
    func sendMoviesToView(movieList: [Movie]) {
        favouriteMoviesViewDelegate?.showMovies(movieList: movieList)
    }

    
}
