//
//  HomePresenter.swift
//  MyMovies
//
//  Created by Salma on 5/13/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomePresenter:HomePresenterDelegate {

    var moviesList = [Movie]()
    
    var jsonRetrievingUsingAlamofire : JsonRetrievingUsingAlamofireDelegate?
    
    init(){
    self.jsonRetrievingUsingAlamofire = JsonRetrievingUsingAlamofire(homePresneter: self)
    }
    
    var homeDelegate:HomeViewDelegate?
    func setDelegate(homeDelegate:HomeViewDelegate){
        self.homeDelegate=homeDelegate
    }
    
    
    func getJsonResponseFromNetwork(mostPopular:Bool) {
        jsonRetrievingUsingAlamofire!.getMovies(mostPopular: mostPopular)
    }
    
    func sendMoviesToView(movieList: [Movie]) {
        homeDelegate?.showMovies(movieList: movieList)
    }
    
        
}


