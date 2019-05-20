//
//  PresneterDelegate.swift
//  MyMovies
//
//  Created by Salma on 5/17/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
protocol HomePresenterDelegate{
    func getJsonResponseFromNetwork(mostPopular:Bool)
    func sendMoviesToView (movieList:[Movie])
    func showAlert()
    
}
