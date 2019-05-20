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

}