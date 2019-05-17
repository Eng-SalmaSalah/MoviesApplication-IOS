//
//  JsonRetrievingUsingAlamofireDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/16/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
protocol JsonRetrievingUsingAlamofireDelegate {
    func getMovies();
    func sendMoviesToPresenter(movieList:[Movie]);
}
