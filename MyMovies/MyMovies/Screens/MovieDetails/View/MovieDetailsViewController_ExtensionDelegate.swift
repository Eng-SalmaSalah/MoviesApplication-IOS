//
//  MovieDetailsViewController_ExtensionDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation

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
       print(self.ReviewList)  //to ensure that
    }
    func getMovieList(MovieId : String) {
        MoviePresenter.getJsonResponseFromNetwork(movieID: MovieId)
    }
    func getReviewList(MovieId:String){
MoviePresenter.getJsonResponseFromNetworkReview(movieID:MovieId)
    }
    
}
