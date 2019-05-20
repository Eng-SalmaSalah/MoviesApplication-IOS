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
    
    var jsonRetrievingUsingAlamofire : JsonRetrievingUsingAlamofireDelegate?
    
    init(){
        self.jsonRetrievingUsingAlamofire = JsonRetrievingUsingAlamofire(DetailsPresenter: self)
    }
    
    var MovieDetailsDelegate:MovieDetailsViewDelegate?

    func setDelegate(MovieDetailsDelegate:MovieDetailsViewDelegate){
        self.MovieDetailsDelegate=MovieDetailsDelegate
    }
    
    func getJsonResponseFromNetwork(movieID: String) {
        jsonRetrievingUsingAlamofire!.getTrailer(movieId: movieID)
        
        
    }
    func getJsonResponseFromNetworkReview(movieID: String) {
        jsonRetrievingUsingAlamofire!.getReviews(movieId: movieID)
        
    }
    
    
    func sendTrailersToView(TrailerList: [Trailer]){
      MovieDetailsDelegate?.showMovieTrailers(trailerList: TrailerList)
    }
    
    
    func sendReviewsToView(ReviewsList: [String]){
        MovieDetailsDelegate?.showMovieReviews(reviewList: ReviewsList)
    }
}
