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

class HomePresenter {
    var moviesList = [Movie]()
    
    var homeDelegate:HomeDelegate?
    func setDelegate(homeDelegate:HomeDelegate){
        self.homeDelegate=homeDelegate
    }
    
    
    func getJsonResponse(){
        let url = URL(string :"https://api.themoviedb.org/3/discover/movie?sort_by=highest-rated.desc&api_key=b3bc361fb3fda11be0977ea63bbfc10f")
        Alamofire.request(url!).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print(error)
            case .success(let value):
                let json = JSON(value)
                if let result = json["results"].array{
                    for item in result{
                        let movie = Movie(id: item["id"].intValue,title: item["title"].stringValue, posterPath: item["poster_path"].stringValue, originalTitle: item["original_title"].stringValue, overview: item["overview"].stringValue, releaseData: item["release_date"].stringValue)
                        self.moviesList.append(movie)
                    }
                    self.homeDelegate?.setMovieList(movieList: self.moviesList)
                }else{
                    print("no movie")
                }
            }
        }
    }
}


